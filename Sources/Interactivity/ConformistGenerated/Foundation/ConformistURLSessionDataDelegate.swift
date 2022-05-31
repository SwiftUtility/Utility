#if canImport(Foundation)
import Foundation
import Facility
extension Conformist {
  @available(macOS 10.9, *)
  @available(iOS 7.0, *)
  @available(tvOS 9.0, *)
  @available(watchOS 2.0, *)
  public enum URLSessionDataDelegate {
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidReceiveResponse: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionDataTask
      public var response: URLResponse
      public var complete: Act.Of<Completion>.Go
      public init(
        session: URLSession,
        task: URLSessionDataTask,
        response: URLResponse,
        complete: @escaping Act.Of<Completion>.Go
      ) {
        self.session = session
        self.task = task
        self.response = response
        self.complete = complete
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionDataDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:response:complete:))
      }
      public struct Completion {
        public var disposition: URLSession.ResponseDisposition
        public init(
          disposition: URLSession.ResponseDisposition
        ) {
          self.disposition = disposition
        }
        public static func curry(callback: @escaping CallBack) -> Act.Of<Self>.Go {
          return { this in
            callback(
              this.disposition
            )
          }
        }
        public typealias CallBack = (
          URLSession.ResponseDisposition
        ) -> Void
      }
      public final class Responder: Conformist.Responder<DidReceiveResponse> {
        @objc(URLSession:dataTask:didReceiveResponse:completionHandler:)
        func respond(
          session: URLSession,
          task: URLSessionDataTask,
          response: URLResponse,
          complete: @escaping Completion.CallBack
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            response: response,
            complete: Completion.curry(callback: complete)
          ))
        }
      }
    }
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidBecomeDownloadTask: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionDataTask
      public var downloadTask: URLSessionDownloadTask
      public init(
        session: URLSession,
        task: URLSessionDataTask,
        downloadTask: URLSessionDownloadTask
      ) {
        self.session = session
        self.task = task
        self.downloadTask = downloadTask
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionDataDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:downloadTask:))
      }
      public final class Responder: Conformist.Responder<DidBecomeDownloadTask> {
        @objc(URLSession:dataTask:didBecomeDownloadTask:)
        func respond(
          session: URLSession,
          task: URLSessionDataTask,
          downloadTask: URLSessionDownloadTask
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            downloadTask: downloadTask
          ))
        }
      }
    }
    @available(macOS 10.11, *)
    @available(iOS 9.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidBecomeStreamTask: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionDataTask
      public var streamTask: URLSessionStreamTask
      public init(
        session: URLSession,
        task: URLSessionDataTask,
        streamTask: URLSessionStreamTask
      ) {
        self.session = session
        self.task = task
        self.streamTask = streamTask
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionDataDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:streamTask:))
      }
      public final class Responder: Conformist.Responder<DidBecomeStreamTask> {
        @objc(URLSession:dataTask:didBecomeStreamTask:)
        func respond(
          session: URLSession,
          task: URLSessionDataTask,
          streamTask: URLSessionStreamTask
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            streamTask: streamTask
          ))
        }
      }
    }
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidReceiveData: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionDataTask
      public var data: Data
      public init(
        session: URLSession,
        task: URLSessionDataTask,
        data: Data
      ) {
        self.session = session
        self.task = task
        self.data = data
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionDataDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:data:))
      }
      public final class Responder: Conformist.Responder<DidReceiveData> {
        @objc(URLSession:dataTask:didReceiveData:)
        func respond(
          session: URLSession,
          task: URLSessionDataTask,
          data: Data
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            data: data
          ))
        }
      }
    }
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct WillCacheResponse: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionDataTask
      public var response: CachedURLResponse
      public var complete: Act.Of<Completion>.Go
      public init(
        session: URLSession,
        task: URLSessionDataTask,
        response: CachedURLResponse,
        complete: @escaping Act.Of<Completion>.Go
      ) {
        self.session = session
        self.task = task
        self.response = response
        self.complete = complete
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionDataDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:response:complete:))
      }
      public struct Completion {
        public var response: CachedURLResponse?
        public init(
          response: CachedURLResponse?
        ) {
          self.response = response
        }
        public static func curry(callback: @escaping CallBack) -> Act.Of<Self>.Go {
          return { this in
            callback(
              this.response
            )
          }
        }
        public typealias CallBack = (
          CachedURLResponse?
        ) -> Void
      }
      public final class Responder: Conformist.Responder<WillCacheResponse> {
        @objc(URLSession:dataTask:willCacheResponse:completionHandler:)
        func respond(
          session: URLSession,
          task: URLSessionDataTask,
          response: CachedURLResponse,
          complete: @escaping Completion.CallBack
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            response: response,
            complete: Completion.curry(callback: complete)
          ))
        }
      }
    }
  }
}
#endif
