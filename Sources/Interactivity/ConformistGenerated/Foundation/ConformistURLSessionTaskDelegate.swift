#if canImport(Foundation)
import Foundation
import Facility
extension Conformist {
  @available(macOS 10.9, *)
  @available(iOS 7.0, *)
  @available(tvOS 9.0, *)
  @available(watchOS 2.0, *)
  public enum URLSessionTaskDelegate {
    @available(macOS 10.13, *)
    @available(iOS 11.0, *)
    @available(tvOS 11.0, *)
    @available(watchOS 4.0, *)
    public struct WillBeginDelayedRequest: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionTask
      public var request: URLRequest
      public var complete: Act.Of<Completion>.Go
      public init(
        session: URLSession,
        task: URLSessionTask,
        request: URLRequest,
        complete: @escaping Act.Of<Completion>.Go
      ) {
        self.session = session
        self.task = task
        self.request = request
        self.complete = complete
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionTaskDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:request:complete:))
      }
      public struct Completion {
        public var disposition: URLSession.DelayedRequestDisposition
        public var request: URLRequest?
        public init(
          disposition: URLSession.DelayedRequestDisposition,
          request: URLRequest?
        ) {
          self.disposition = disposition
          self.request = request
        }
        public static func curry(callback: @escaping CallBack) -> Act.Of<Self>.Go {
          return { this in
            callback(
              this.disposition, 
              this.request
            )
          }
        }
        public typealias CallBack = (
          URLSession.DelayedRequestDisposition, 
          URLRequest?
        ) -> Void
      }
      public final class Responder: Conformist.Responder<WillBeginDelayedRequest> {
        @objc(URLSession:task:willBeginDelayedRequest:completionHandler:)
        func respond(
          session: URLSession,
          task: URLSessionTask,
          request: URLRequest,
          complete: @escaping Completion.CallBack
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            request: request,
            complete: Completion.curry(callback: complete)
          ))
        }
      }
    }
    @available(macOS 10.13, *)
    @available(iOS 11.0, *)
    @available(tvOS 11.0, *)
    @available(watchOS 4.0, *)
    public struct IsWaitingForConnectivity: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionTask
      public init(
        session: URLSession,
        task: URLSessionTask
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
        Foundation.URLSessionTaskDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:))
      }
      public final class Responder: Conformist.Responder<IsWaitingForConnectivity> {
        @objc(URLSession:taskIsWaitingForConnectivity:)
        func respond(
          session: URLSession,
          task: URLSessionTask
        ) -> Response {
          handle(.init(
            session: session,
            task: task
          ))
        }
      }
    }
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct WillPerformHTTPRedirection: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionTask
      public var response: HTTPURLResponse
      public var request: URLRequest
      public var complete: Act.Of<Completion>.Go
      public init(
        session: URLSession,
        task: URLSessionTask,
        response: HTTPURLResponse,
        request: URLRequest,
        complete: @escaping Act.Of<Completion>.Go
      ) {
        self.session = session
        self.task = task
        self.response = response
        self.request = request
        self.complete = complete
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionTaskDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:response:request:complete:))
      }
      public struct Completion {
        public var request: URLRequest?
        public init(
          request: URLRequest?
        ) {
          self.request = request
        }
        public static func curry(callback: @escaping CallBack) -> Act.Of<Self>.Go {
          return { this in
            callback(
              this.request
            )
          }
        }
        public typealias CallBack = (
          URLRequest?
        ) -> Void
      }
      public final class Responder: Conformist.Responder<WillPerformHTTPRedirection> {
        @objc(URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:)
        func respond(
          session: URLSession,
          task: URLSessionTask,
          response: HTTPURLResponse,
          request: URLRequest,
          complete: @escaping Completion.CallBack
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            response: response,
            request: request,
            complete: Completion.curry(callback: complete)
          ))
        }
      }
    }
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidReceiveChallenge: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionTask
      public var challenge: URLAuthenticationChallenge
      public var complete: Act.Of<Completion>.Go
      public init(
        session: URLSession,
        task: URLSessionTask,
        challenge: URLAuthenticationChallenge,
        complete: @escaping Act.Of<Completion>.Go
      ) {
        self.session = session
        self.task = task
        self.challenge = challenge
        self.complete = complete
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionTaskDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:challenge:complete:))
      }
      public struct Completion {
        public var disposition: URLSession.AuthChallengeDisposition
        public var credential: URLCredential?
        public init(
          disposition: URLSession.AuthChallengeDisposition,
          credential: URLCredential?
        ) {
          self.disposition = disposition
          self.credential = credential
        }
        public static func curry(callback: @escaping CallBack) -> Act.Of<Self>.Go {
          return { this in
            callback(
              this.disposition, 
              this.credential
            )
          }
        }
        public typealias CallBack = (
          URLSession.AuthChallengeDisposition, 
          URLCredential?
        ) -> Void
      }
      public final class Responder: Conformist.Responder<DidReceiveChallenge> {
        @objc(URLSession:task:didReceiveChallenge:completionHandler:)
        func respond(
          session: URLSession,
          task: URLSessionTask,
          challenge: URLAuthenticationChallenge,
          complete: @escaping Completion.CallBack
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            challenge: challenge,
            complete: Completion.curry(callback: complete)
          ))
        }
      }
    }
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct NeedNewBodyStream: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionTask
      public var complete: Act.Of<Completion>.Go
      public init(
        session: URLSession,
        task: URLSessionTask,
        complete: @escaping Act.Of<Completion>.Go
      ) {
        self.session = session
        self.task = task
        self.complete = complete
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionTaskDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:complete:))
      }
      public struct Completion {
        public var stream: InputStream?
        public init(
          stream: InputStream?
        ) {
          self.stream = stream
        }
        public static func curry(callback: @escaping CallBack) -> Act.Of<Self>.Go {
          return { this in
            callback(
              this.stream
            )
          }
        }
        public typealias CallBack = (
          InputStream?
        ) -> Void
      }
      public final class Responder: Conformist.Responder<NeedNewBodyStream> {
        @objc(URLSession:task:needNewBodyStream:)
        func respond(
          session: URLSession,
          task: URLSessionTask,
          complete: @escaping Completion.CallBack
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            complete: Completion.curry(callback: complete)
          ))
        }
      }
    }
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidSendBodyData: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionTask
      public var sent: Int64
      public var total: Int64
      public var expected: Int64
      public init(
        session: URLSession,
        task: URLSessionTask,
        sent: Int64,
        total: Int64,
        expected: Int64
      ) {
        self.session = session
        self.task = task
        self.sent = sent
        self.total = total
        self.expected = expected
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionTaskDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:sent:total:expected:))
      }
      public final class Responder: Conformist.Responder<DidSendBodyData> {
        @objc(URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:)
        func respond(
          session: URLSession,
          task: URLSessionTask,
          sent: Int64,
          total: Int64,
          expected: Int64
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            sent: sent,
            total: total,
            expected: expected
          ))
        }
      }
    }
    @available(macOS 10.12, *)
    @available(iOS 10.0, *)
    @available(tvOS 10.0, *)
    @available(watchOS 3.0, *)
    public struct DidFinishCollectingMetrics: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionTask
      public var metrics: URLSessionTaskMetrics
      public init(
        session: URLSession,
        task: URLSessionTask,
        metrics: URLSessionTaskMetrics
      ) {
        self.session = session
        self.task = task
        self.metrics = metrics
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionTaskDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:metrics:))
      }
      public final class Responder: Conformist.Responder<DidFinishCollectingMetrics> {
        @objc(URLSession:task:didFinishCollectingMetrics:)
        func respond(
          session: URLSession,
          task: URLSessionTask,
          metrics: URLSessionTaskMetrics
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            metrics: metrics
          ))
        }
      }
    }
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidComplete: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionTask
      public var error: Error?
      public init(
        session: URLSession,
        task: URLSessionTask,
        error: Error?
      ) {
        self.session = session
        self.task = task
        self.error = error
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionTaskDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:error:))
      }
      public final class Responder: Conformist.Responder<DidComplete> {
        @objc(URLSession:task:didCompleteWithError:)
        func respond(
          session: URLSession,
          task: URLSessionTask,
          error: Error?
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            error: error
          ))
        }
      }
    }
  }
}
#endif
