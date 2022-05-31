#if canImport(Foundation)
import Foundation
import Facility
extension Conformist {
  @available(macOS 10.9, *)
  @available(iOS 7.0, *)
  @available(tvOS 9.0, *)
  @available(watchOS 2.0, *)
  public enum URLSessionDelegate {
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidBecomeInvalid: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var error: Error?
      public init(
        session: URLSession,
        error: Error?
      ) {
        self.session = session
        self.error = error
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:error:))
      }
      public final class Responder: Conformist.Responder<DidBecomeInvalid> {
        @objc(URLSession:didBecomeInvalidWithError:)
        func respond(
          session: URLSession,
          error: Error?
        ) -> Response {
          handle(.init(
            session: session,
            error: error
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
      public var challenge: URLAuthenticationChallenge
      public var complete: Act.Of<Completion>.Go
      public init(
        session: URLSession,
        challenge: URLAuthenticationChallenge,
        complete: @escaping Act.Of<Completion>.Go
      ) {
        self.session = session
        self.challenge = challenge
        self.complete = complete
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:challenge:complete:))
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
        @objc(URLSession:didReceiveChallenge:completionHandler:)
        func respond(
          session: URLSession,
          challenge: URLAuthenticationChallenge,
          complete: @escaping Completion.CallBack
        ) -> Response {
          handle(.init(
            session: session,
            challenge: challenge,
            complete: Completion.curry(callback: complete)
          ))
        }
      }
    }
    @available(macOS 11.0, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidFinishEventsForBackgroundURLSession: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public init(
        session: URLSession
      ) {
        self.session = session
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:))
      }
      public final class Responder: Conformist.Responder<DidFinishEventsForBackgroundURLSession> {
        @objc(URLSessionDidFinishEventsForBackgroundURLSession:)
        func respond(
          session: URLSession
        ) -> Response {
          handle(.init(
            session: session
          ))
        }
      }
    }
  }
}
#endif
