import Foundation
public extension String {
  static func make(utf8 data: Data) throws -> Self {
    try String(data: data, encoding: .utf8).get { throw Thrown("Data not utf8") }
  }
  func dropPrefix<T: StringProtocol>(_ prefix: T) throws -> Self { try self
    .hasPrefix(prefix)
    .then(prefix.count)
    .map(dropFirst(_:))
    .map(Self.init(_:))
    .get { throw Thrown("no prefix \(prefix) in \(self)") }
  }
  func dropSuffix<T: StringProtocol>(_ suffix: T) throws -> Self { try self
    .hasSuffix(suffix)
    .then(suffix.count)
    .map(dropLast(_:))
    .map(Self.init(_:))
    .get { throw Thrown("no suffix \(suffix) in \(self)") }
  }
}
