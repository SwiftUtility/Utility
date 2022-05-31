import Foundation
extension AnyCodable {
  public enum Value: Codable, Equatable, CustomDebugStringConvertible {
    case null
    case bool(Bool)
    case int(Int)
    case int64(Int64)
    case int32(Int32)
    case int16(Int16)
    case int8(Int8)
    case uint(UInt)
    case uint64(UInt64)
    case uint32(UInt32)
    case uint16(UInt16)
    case uint8(UInt8)
    case double(Double)
    case float(Float)
    case string(String)
    public init?(any: Any?) {
      if any == nil || any is NSNull {
        self = .null
      } else if let value = any as? Bool {
        self = .bool(value)
      } else if let value = any as? Int {
        self = .int(value)
      } else if let value = any as? Int64 {
        self = .int64(value)
      } else if let value = any as? Int32 {
        self = .int32(value)
      } else if let value = any as? Int16 {
        self = .int16(value)
      } else if let value = any as? Int8 {
        self = .int8(value)
      } else if let value = any as? UInt {
        self = .uint(value)
      } else if let value = any as? UInt64 {
        self = .uint64(value)
      } else if let value = any as? UInt32 {
        self = .uint32(value)
      } else if let value = any as? UInt16 {
        self = .uint16(value)
      } else if let value = any as? UInt8 {
        self = .uint8(value)
      } else if let value = any as? Double {
        self = .double(value)
      } else if let value = any as? Float {
        self = .float(value)
      } else if let value = any as? String {
        self = .string(value)
      } else { return nil }
    }
    public init(decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      if container.decodeNil() {
        self = .null
      } else if let value = try? container.decode(Bool.self) {
        self = .bool(value)
      } else if let value = try? container.decode(Int.self) {
        self = .int(value)
      } else if let value = try? container.decode(Int64.self) {
        self = .int64(value)
      } else if let value = try? container.decode(Int32.self) {
        self = .int32(value)
      } else if let value = try? container.decode(Int16.self) {
        self = .int16(value)
      } else if let value = try? container.decode(Int8.self) {
        self = .int8(value)
      } else if let value = try? container.decode(UInt.self) {
        self = .uint(value)
      } else if let value = try? container.decode(UInt64.self) {
        self = .uint64(value)
      } else if let value = try? container.decode(UInt32.self) {
        self = .uint32(value)
      } else if let value = try? container.decode(UInt16.self) {
        self = .uint16(value)
      } else if let value = try? container.decode(UInt8.self) {
        self = .uint8(value)
      } else if let value = try? container.decode(Double.self) {
        self = .double(value)
      } else if let value = try? container.decode(Float.self) {
        self = .float(value)
      } else if let value = try? container.decode(String.self) {
        self = .string(value)
      } else { throw Thrown("Value can not be decoded") }
    }
    public func encode(to encoder: Encoder) throws {
      var container = encoder.singleValueContainer()
      switch self {
      case .null: try container.encodeNil()
      case .bool(let value): try container.encode(value)
      case .int(let value): try container.encode(value)
      case .int64(let value): try container.encode(value)
      case .int32(let value): try container.encode(value)
      case .int16(let value): try container.encode(value)
      case .int8(let value): try container.encode(value)
      case .uint(let value): try container.encode(value)
      case .uint64(let value): try container.encode(value)
      case .uint32(let value): try container.encode(value)
      case .uint16(let value): try container.encode(value)
      case .uint8(let value): try container.encode(value)
      case .double(let value): try container.encode(value)
      case .float(let value): try container.encode(value)
      case .string(let value): try container.encode(value)
      }
    }
    public var any: Any? {
      switch self {
      case .null: return nil
      case .bool(let value): return value
      case .int(let value): return value
      case .int64(let value): return value
      case .int32(let value): return value
      case .int16(let value): return value
      case .int8(let value): return value
      case .uint(let value): return value
      case .uint64(let value): return value
      case .uint32(let value): return value
      case .uint16(let value): return value
      case .uint8(let value): return value
      case .double(let value): return value
      case .float(let value): return value
      case .string(let value): return value
      }
    }
    public var anyObject: AnyObject {
      switch self {
      case .null: return NSNull()
      case .bool(let value): return value as NSNumber
      case .int(let value): return value as NSNumber
      case .int64(let value): return value as NSNumber
      case .int32(let value): return value as NSNumber
      case .int16(let value): return value as NSNumber
      case .int8(let value): return value as NSNumber
      case .uint(let value): return value as NSNumber
      case .uint64(let value): return value as NSNumber
      case .uint32(let value): return value as NSNumber
      case .uint16(let value): return value as NSNumber
      case .uint8(let value): return value as NSNumber
      case .double(let value): return value as NSNumber
      case .float(let value): return value as NSNumber
      case .string(let value): return value as NSString
      }
    }
    public var isNull: Bool {
      if case .null = self { return true } else { return false }
    }
    public var bool: Bool? {
      if case .bool(let value) = self { return value } else { return nil }
    }
    public var string: String? {
      if case .string(let value) = self { return value } else { return nil }
    }
    public var number: NSNumber? {
      switch self {
      case .int(let value): return value as NSNumber
      case .int64(let value): return value as NSNumber
      case .int32(let value): return value as NSNumber
      case .int16(let value): return value as NSNumber
      case .int8(let value): return value as NSNumber
      case .uint(let value): return value as NSNumber
      case .uint64(let value): return value as NSNumber
      case .uint32(let value): return value as NSNumber
      case .uint16(let value): return value as NSNumber
      case .uint8(let value): return value as NSNumber
      case .double(let value): return value as NSNumber
      case .float(let value): return value as NSNumber
      default: return nil
      }
    }
    public var debugDescription: String {
      switch self {
      case .null: return "nil"
      case .bool(let value): return "\(value)"
      case .int(let value): return "\(value)"
      case .int64(let value): return "\(value)"
      case .int32(let value): return "\(value)"
      case .int16(let value): return "\(value)"
      case .int8(let value): return "\(value)"
      case .uint(let value): return "\(value)"
      case .uint64(let value): return "\(value)"
      case .uint32(let value): return "\(value)"
      case .uint16(let value): return "\(value)"
      case .uint8(let value): return "\(value)"
      case .double(let value): return "\(value)"
      case .float(let value): return "\(value)"
      case .string(let value): return "\"\(value)\""
      }
    }
    public static func == (lhs: Self, rhs: Self) -> Bool {
      switch (lhs, rhs) {
      case (.null, .null): return true
      case (.bool(let lhs), .bool(let rhs)): return lhs == rhs
      case (.int(let lhs), .int(let rhs)): return lhs == rhs
      case (.int64(let lhs), .int64(let rhs)): return lhs == rhs
      case (.int32(let lhs), .int32(let rhs)): return lhs == rhs
      case (.int16(let lhs), .int16(let rhs)): return lhs == rhs
      case (.int8(let lhs), .int8(let rhs)): return lhs == rhs
      case (.uint(let lhs), .uint(let rhs)): return lhs == rhs
      case (.uint64(let lhs), .uint64(let rhs)): return lhs == rhs
      case (.uint32(let lhs), .uint32(let rhs)): return lhs == rhs
      case (.uint16(let lhs), .uint16(let rhs)): return lhs == rhs
      case (.uint8(let lhs), .uint8(let rhs)): return lhs == rhs
      case (.double(let lhs), .double(let rhs)): return lhs == rhs
      case (.float(let lhs), .float(let rhs)): return lhs == rhs
      case (.string(let lhs), .string(let rhs)): return lhs == rhs
      default: return false
      }
    }
  }
}
