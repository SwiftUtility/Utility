import Foundation
import Facility
public protocol ConformistRequest {
  associatedtype Response
  static var conforms: Protocol { get }
  static var responds: Selector { get }
  static func makeResopnder(
    handle: @escaping Act.Of<Self>.Do<Response>
  ) -> Conformist.Responder<Self>
}
