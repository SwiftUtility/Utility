#if canImport(Foundation)
import Foundation
import Facility
extension Conformist {
  @available(macOS 10.11, *)
  @available(iOS 7.0, *)
  @available(tvOS 9.0, *)
  @available(watchOS 2.0, *)
  public enum URLSessionStreamDelegate {
    @available(macOS 10.11, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct ReadClosed: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionStreamTask
      public init(
        session: URLSession,
        task: URLSessionStreamTask
      ) {
        self.session = session
        self.task = task
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionStreamDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:))
      }
      public final class Responder: Conformist.Responder<ReadClosed> {
        @objc(URLSession:readClosedForStreamTask:)
        func respond(
          session: URLSession,
          task: URLSessionStreamTask
        ) -> Response {
          handle(.init(
            session: session,
            task: task
          ))
        }
      }
    }
    @available(macOS 10.11, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct WriteClosed: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionStreamTask
      public init(
        session: URLSession,
        task: URLSessionStreamTask
      ) {
        self.session = session
        self.task = task
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionStreamDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:))
      }
      public final class Responder: Conformist.Responder<WriteClosed> {
        @objc(URLSession:writeClosedForStreamTask:)
        func respond(
          session: URLSession,
          task: URLSessionStreamTask
        ) -> Response {
          handle(.init(
            session: session,
            task: task
          ))
        }
      }
    }
    @available(macOS 10.11, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct BetterRouteDiscovered: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionStreamTask
      public init(
        session: URLSession,
        task: URLSessionStreamTask
      ) {
        self.session = session
        self.task = task
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionStreamDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:))
      }
      public final class Responder: Conformist.Responder<BetterRouteDiscovered> {
        @objc(URLSession:betterRouteDiscoveredForStreamTask:)
        func respond(
          session: URLSession,
          task: URLSessionStreamTask
        ) -> Response {
          handle(.init(
            session: session,
            task: task
          ))
        }
      }
    }
    @available(macOS 10.11, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidBecomeStream: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionStreamTask
      public var input: InputStream
      public var output: OutputStream
      public init(
        session: URLSession,
        task: URLSessionStreamTask,
        input: InputStream,
        output: OutputStream
      ) {
        self.session = session
        self.task = task
        self.input = input
        self.output = output
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionStreamDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:input:output:))
      }
      public final class Responder: Conformist.Responder<DidBecomeStream> {
        @objc(URLSession:streamTask:didBecomeInputStream:outputStream:)
        func respond(
          session: URLSession,
          task: URLSessionStreamTask,
          input: InputStream,
          output: OutputStream
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            input: input,
            output: output
          ))
        }
      }
    }
  }
}
#endif
