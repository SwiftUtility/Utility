import Foundation
import Facility
public final class Conformist: NSObject {
  private let responders: [Selector: ConformistResponder]
  private let protocols: [ObjectIdentifier: Protocol]
  public override func forwardingTarget(for aSelector: Selector!) -> Any? {
    aSelector.flatMap { responders[$0] }
  }
  public override func responds(to aSelector: Selector!) -> Bool {
    aSelector.flatMap { responders[$0] } != nil
  }
  public override func conforms(to aProtocol: Protocol) -> Bool {
    protocols[.init(aProtocol)] != nil
  }
  public init(conformance: Conformance) throws {
    self.responders = conformance.responders
    self.protocols = conformance.protocols
    super.init()
    for (selector, responder) in responders {
      if !responder.responds(to: selector) {
        throw Thrown("Wrong responder for \(selector)")
      }
    }
    for aProtocol in protocols.values {
      guard !protocol_isEqual(aProtocol, NSObjectProtocol.self) else { continue }
      try checkSelectors(aProtocol: aProtocol)
      try checkProperties(aProtocol: aProtocol)
    }
  }
  private func checkSelectors(aProtocol: Protocol) throws {
    var count: UInt32 = 0
    guard let list = protocol_copyMethodDescriptionList(aProtocol, true, true, &count) else {
      return
    }
    defer { free(list) }
    for index in 0..<Int(count) {
      guard let name = list[index].name else { throw MayDay("Nil name in \(list[index])") }
      if responders[name] == nil { throw MayDay("Not implemented \(name)") }
    }
  }
  private func checkProperties(aProtocol: Protocol) throws {
    var count: UInt32 = 0
    guard let list = protocol_copyPropertyList(aProtocol, &count) else { return }
    defer { free(list) }
    for index in 0..<Int(count) {
      let name = property_getName(list[index])
      if protocol_getProperty(aProtocol, name, true, true) != nil {
        throw MayDay("\(aProtocol) requires \(String(cString: name))")
      }
    }
  }
}
