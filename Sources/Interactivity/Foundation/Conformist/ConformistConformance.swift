import Foundation
import Facility
extension Conformist {
  public struct Conformance {
    public private(set) var responders: [Selector: ConformistResponder]
    public subscript<T: ConformistRequest>(request: T) -> Act.Of<T>.Do<T.Response>? {
      get {
        guard let responder = responders[T.responds] else { return nil }
        guard let responder = responder as? Responder<T> else {
          MayDay.report("Type mismatch for \(T.responds)")
          return nil
        }
        return responder.handle
      }
      set {
        responders[T.responds] = newValue.map(T.makeResopnder(handle:))
      }
    }
    public var protocols: [ObjectIdentifier: Protocol] {
      responders
        .map { $0.value.conforms }
        .reduce(
          into: [.init(NSObjectProtocol.self as Protocol): NSObjectProtocol.self],
          expand(protocols:value:)
        )
    }
    private func expand(
      protocols: inout [ObjectIdentifier: Protocol],
      value: Protocol
    ) {
      guard protocols[.init(value)] == nil else { return }
      protocols[.init(value)] = value
      var count: UInt32 = 0
      guard let list = protocol_copyProtocolList(value, &count) else { return }
      for index in 0..<Int(count) {
        expand(protocols: &protocols, value: list[index])
      }
    }
  }
}
