#if canImport(Foundation)
import Foundation
import Facility
extension Conformist {
  @available(macOS 10.9, *)
  @available(iOS 7.0, *)
  @available(tvOS 9.0, *)
  @available(watchOS 2.0, *)
  public enum URLSessionDownloadDelegate {
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidFinishDownloading: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionDownloadTask
      public var location: URL
      public init(
        session: URLSession,
        task: URLSessionDownloadTask,
        location: URL
      ) {
        self.session = session
        self.task = task
        self.location = location
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionDownloadDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:location:))
      }
      public final class Responder: Conformist.Responder<DidFinishDownloading> {
        @objc(URLSession:downloadTask:didFinishDownloadingToURL:)
        func respond(
          session: URLSession,
          task: URLSessionDownloadTask,
          location: URL
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            location: location
          ))
        }
      }
    }
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidWriteData: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionDownloadTask
      public var written: Int64
      public var total: Int64
      public var expected: Int64
      public init(
        session: URLSession,
        task: URLSessionDownloadTask,
        written: Int64,
        total: Int64,
        expected: Int64
      ) {
        self.session = session
        self.task = task
        self.written = written
        self.total = total
        self.expected = expected
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionDownloadDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:written:total:expected:))
      }
      public final class Responder: Conformist.Responder<DidWriteData> {
        @objc(URLSession:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:)
        func respond(
          session: URLSession,
          task: URLSessionDownloadTask,
          written: Int64,
          total: Int64,
          expected: Int64
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            written: written,
            total: total,
            expected: expected
          ))
        }
      }
    }
    @available(macOS 10.9, *)
    @available(iOS 7.0, *)
    @available(tvOS 9.0, *)
    @available(watchOS 2.0, *)
    public struct DidResume: ConformistRequest {
      public typealias Response = Void
      public var session: URLSession
      public var task: URLSessionDownloadTask
      public var offset: Int64
      public var expected: Int64
      public init(
        session: URLSession,
        task: URLSessionDownloadTask,
        offset: Int64,
        expected: Int64
      ) {
        self.session = session
        self.task = task
        self.offset = offset
        self.expected = expected
      }
      public static func makeResopnder(
        handle: @escaping Act.Of<Self>.Do<Self.Response>
      ) -> Conformist.Responder<Self> {
        Responder(handle: handle)
      }
      public static var conforms: Protocol {
        Foundation.URLSessionDownloadDelegate.self
      }
      public static var responds: Selector {
        #selector(Responder.respond(session:task:offset:expected:))
      }
      public final class Responder: Conformist.Responder<DidResume> {
        @objc(URLSession:downloadTask:didResumeAtOffset:expectedTotalBytes:)
        func respond(
          session: URLSession,
          task: URLSessionDownloadTask,
          offset: Int64,
          expected: Int64
        ) -> Response {
          handle(.init(
            session: session,
            task: task,
            offset: offset,
            expected: expected
          ))
        }
      }
    }
  }
}
#endif
