import Foundation
extension AnyCodable {
  struct ValueEncoder: SingleValueEncodingContainer {
    let writer: Writer
    let depth: Int
    var codingPath: [CodingKey] { writer.codingPath }
    mutating func encodeNil() throws {
      writer.push(to: depth, value: .null)
    }
    mutating func encode(_ value: String) throws {
      writer.push(to: depth, value: .string(value))
    }
    mutating func encode(_ value: Bool) throws {
      writer.push(to: depth, value: .bool(value))
    }
    mutating func encode(_ value: Double) throws {
      writer.push(to: depth, value: .double(value))
    }
    mutating func encode(_ value: Float) throws {
      writer.push(to: depth, value: .float(value))
    }
    mutating func encode(_ value: Int) throws {
      writer.push(to: depth, value: .int(value))
    }
    mutating func encode(_ value: Int8) throws {
      writer.push(to: depth, value: .int8(value))
    }
    mutating func encode(_ value: Int16) throws {
      writer.push(to: depth, value: .int16(value))
    }
    mutating func encode(_ value: Int32) throws {
      writer.push(to: depth, value: .int32(value))
    }
    mutating func encode(_ value: Int64) throws {
      writer.push(to: depth, value: .int64(value))
    }
    mutating func encode(_ value: UInt) throws {
      writer.push(to: depth, value: .uint(value))
    }
    mutating func encode(_ value: UInt8) throws {
      writer.push(to: depth, value: .uint8(value))
    }
    mutating func encode(_ value: UInt16) throws {
      writer.push(to: depth, value: .uint16(value))
    }
    mutating func encode(_ value: UInt32) throws {
      writer.push(to: depth, value: .uint32(value))
    }
    mutating func encode(_ value: UInt64) throws {
      writer.push(to: depth, value: .uint64(value))
    }
    mutating func encode<T>(_ value: T) throws where T : Encodable {
      writer.flush(to: depth)
      try writer.write(value)
    }
  }
}
