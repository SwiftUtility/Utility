import Foundation
extension AnyCodable {
  struct MapEncoder<Key: CodingKey>: KeyedEncodingContainerProtocol {
    let writer: Writer
    let depth: Int
    var codingPath: [CodingKey] { writer.codingPath }
    mutating func encodeNil(forKey key: Key) throws {
      writer.push(to: depth, value: .null, key: key.stringValue)
    }
    mutating func encode(_ value: Bool, forKey key: Key) throws {
      writer.push(to: depth, value: .bool(value), key: key.stringValue)
    }
    mutating func encode(_ value: String, forKey key: Key) throws {
      writer.push(to: depth, value: .string(value), key: key.stringValue)
    }
    mutating func encode(_ value: Double, forKey key: Key) throws {
      writer.push(to: depth, value: .double(value), key: key.stringValue)
    }
    mutating func encode(_ value: Float, forKey key: Key) throws {
      writer.push(to: depth, value: .float(value), key: key.stringValue)
    }
    mutating func encode(_ value: Int, forKey key: Key) throws {
      writer.push(to: depth, value: .int(value), key: key.stringValue)
    }
    mutating func encode(_ value: Int8, forKey key: Key) throws {
      writer.push(to: depth, value: .int8(value), key: key.stringValue)
    }
    mutating func encode(_ value: Int16, forKey key: Key) throws {
      writer.push(to: depth, value: .int16(value), key: key.stringValue)
    }
    mutating func encode(_ value: Int32, forKey key: Key) throws {
      writer.push(to: depth, value: .int32(value), key: key.stringValue)
    }
    mutating func encode(_ value: Int64, forKey key: Key) throws {
      writer.push(to: depth, value: .int64(value), key: key.stringValue)
    }
    mutating func encode(_ value: UInt, forKey key: Key) throws {
      writer.push(to: depth, value: .uint(value), key: key.stringValue)
    }
    mutating func encode(_ value: UInt8, forKey key: Key) throws {
      writer.push(to: depth, value: .uint8(value), key: key.stringValue)
    }
    mutating func encode(_ value: UInt16, forKey key: Key) throws {
      writer.push(to: depth, value: .uint16(value), key: key.stringValue)
    }
    mutating func encode(_ value: UInt32, forKey key: Key) throws {
      writer.push(to: depth, value: .uint32(value), key: key.stringValue)
    }
    mutating func encode(_ value: UInt64, forKey key: Key) throws {
      writer.push(to: depth, value: .uint64(value), key: key.stringValue)
    }
    mutating func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
      writer.flush(to: depth, key: key.stringValue)
      try writer.write(value)
    }
    mutating func nestedContainer<NestedKey>(
      keyedBy keyType: NestedKey.Type,
      forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
      writer.flush(to: depth, key: key.stringValue)
      return writer.container(keyedBy: keyType)
    }
    mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
      writer.flush(to: depth, key: key.stringValue)
      return writer.unkeyedContainer()
    }
    mutating func superEncoder() -> Encoder {
      writer.flush(to: depth, key: "super")
      return writer
    }
    mutating func superEncoder(forKey key: Key) -> Encoder {
      writer.flush(to: depth, key: key.stringValue)
      return writer
    }
  }
}
