import Foundation
public enum AnyCodable: Codable, Equatable, CustomDebugStringConvertible {
  case value(Value)
  case list([AnyCodable])
  case map([String: AnyCodable])
  public init(from decoder: Decoder) throws {
    if let value = try? Value(from: decoder) {
      self = .value(value)
    } else if let value = try? [Self](from: decoder) {
        self = .list(value)
    } else if let value = try? [String: Self](from: decoder) {
        self = .map(value)
    } else { throw Thrown("Value can not be decoded") }
  }
  public func encode(to encoder: Encoder) throws {
    switch self {
    case .value(let value): try value.encode(to: encoder)
    case .list(let value): try value.encode(to: encoder)
    case .map(let value): try value.encode(to: encoder)
    }
  }
  public var any: Any? {
    switch self {
    case .value(let value): return value.any
    case .list(let array): return array.map(\.any)
    case .map(let dictionary): return dictionary.mapValues(\.any)
    }
  }
  public var anyObject: AnyObject {
    switch self {
    case .value(let value): return value.anyObject
    case .list(let array): return array.map(\.anyObject) as NSArray
    case .map(let dictionary): return dictionary.mapValues(\.anyObject) as NSDictionary
    }
  }
  public var value: Value? {
    if case .value(let value) = self { return value } else { return nil }
  }
  public var list: [AnyCodable]? {
    if case .list(let value) = self { return value } else { return nil }
  }
  public var map: [String: AnyCodable]? {
    if case .map(let value) = self { return value } else { return nil }
  }
  public init(any: Any?) throws {
    if let value = Value(any: any) {
      self = .value(value)
    } else if let value = any as? [Any?] {
      try self = .list(value.map(Self.init(any:)))
    } else if let value = any as? [String: Any?] {
      try self = .map(value.mapValues(Self.init(any:)))
    } else if let value = any as? [AnyHashable: Any?] {
      try self = .map(value.reduce(into: [:], { $0["\($1.0.base)"] = try Self(any: $1.1) }))
    } else {
      throw Thrown("Invalid object hierarchy")
    }
  }
  public static func == (lhs: Self, rhs: Self) -> Bool {
    switch (lhs, rhs) {
    case (.value(let lhs), .value(let rhs)): return lhs == rhs
    case (.list(let lhs), .list(let rhs)): return lhs == rhs
    case (.map(let lhs), .map(let rhs)): return lhs == rhs
    default: return false
    }
  }
  public var debugDescription: String {
    switch self {
    case .value(let value): return value.debugDescription
    case .list(let list): return "[\(list.map(\.debugDescription).joined(separator: ","))]"
    case .map(let map): return "{\(map.map { "\"\($0)\":\($1.debugDescription)" }.joined(separator: ","))}"
    }
  }
}
