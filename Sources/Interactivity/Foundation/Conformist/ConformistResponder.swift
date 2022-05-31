import Foundation
import Facility
public protocol ConformistResponder: NSObjectProtocol {
  var conforms: Protocol { get }
}
extension Conformist {
  open class Responder<T: ConformistRequest>: NSObject, ConformistResponder {
    public let handle: Act.Of<T>.Do<T.Response>
    public init(handle: @escaping Act.Of<T>.Do<T.Response>) {
      self.handle = handle
    }
    public var conforms: Protocol {
      T.conforms
    }
  }
}
