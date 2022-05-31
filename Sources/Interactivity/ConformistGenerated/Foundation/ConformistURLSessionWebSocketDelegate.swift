#if canImport(Foundation)
import Foundation
import Facility
extension Conformist {
  @available(macOS 10.15, *)
  @available(iOS 13.0, *)
  @available(tvOS 13.0, *)
  @available(watchOS 6.0, *)
  public enum URLSessionWebSocketDelegate {
    @available(macOS 10.15, *)
    @available(iOS 13.0, *)
    @available(tvOS 13.0, *)
    @available(watchOS 6.0, *)
    public struct DidOpen: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionWebSocketTask
      public var aProtocol: String?
      public init(
        session: URLSession,
        task: URLSessionWebSocketTask,
        aProtocol: String?
      ) {
        self.session = session
        self.task = task
        self.aProtocol = aProtocol
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionWebSocketDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:aProtocol:))
      }
      public final class Responder: Conformist.Responder<DidOpen> {
        @objc(URLSession:webSocketTask:didOpenWithProtocol:)
        func respond(
          session: URLSession,
          task: URLSessionWebSocketTask,
          aProtocol: String?
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            aProtocol: aProtocol
          ))
        }
      }
    }
    @available(macOS 10.15, *)
    @available(iOS 13.0, *)
    @available(tvOS 13.0, *)
    @available(watchOS 6.0, *)
    public struct DidClose: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionWebSocketTask
      public var code: URLSessionWebSocketTask.CloseCode
      public var reason: Data?
      public init(
        session: URLSession,
        task: URLSessionWebSocketTask,
        code: URLSessionWebSocketTask.CloseCode,
        reason: Data?
      ) {
        self.session = session
        self.task = task
        self.code = code
        self.reason = reason
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionWebSocketDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:code:reason:))
      }
      public final class Responder: Conformist.Responder<DidClose> {
        @objc(URLSession:webSocketTask:didCloseWithCode:reason:)
        func respond(
          session: URLSession,
          task: URLSessionWebSocketTask,
          code: URLSessionWebSocketTask.CloseCode,
          reason: Data?
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            code: code,
            reason: reason
          ))
        }
      }
    }
  }
}
#endif
