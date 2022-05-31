import Foundation
extension AnyCodable {
  public struct MapDecoder<Key: CodingKey>: KeyedDecodingContainerProtocol {
    private let reader: Reader
    public init(reader: Reader) {
      self.reader = reader
    }
    public var codingPath: [CodingKey] {
      reader.codingPath
    }
    public var allKeys: [Key] {
      reader.anyCodable.map.or([:]).keys.compactMap(Key.init(stringValue:))
    }
    public func contains(_ key: Key) -> Bool {
      reader.anyCodable.map.or([:])[key.stringValue] != nil
    }
    public func decodeNil(forKey key: Key) throws -> Bool {
      try reader.rethrow(what: "not a map", chip: .hash(key.stringValue)) {
        let map = try ?!reader.anyCodable.map
        return map[key.stringValue]?.value?.isNull ?? false
      }
    }
    public func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
      try value(forKey: key) { try ?!$0.value?.bool }
    }
    public func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
      try value(forKey: key) { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public func decode(_ type: String.Type, forKey key: Key) throws -> String {
      try value(forKey: key) { try ?!$0.value?.string }
    }
    public func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T : Decodable {
      try value(forKey: key) {
        try reader.make(anyCodable: $0, chip: .hash(key.stringValue)).read(type)
      }
    }
    public func nestedContainer<NestedKey>(
      keyedBy type: NestedKey.Type,
      forKey key: Key
    ) throws -> KeyedDecodingContainer<NestedKey>
    where NestedKey : CodingKey {
      let map = try reader.rethrow(what: "not a map") {
        try ?!reader.anyCodable.map?[key.stringValue]
      }
      return try reader
        .make(anyCodable: map, chip: .hash(key.stringValue))
        .container(keyedBy: type)
    }
    public func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
      let map = try reader.rethrow(what: "not a map") {
        try ?!reader.anyCodable.map?[key.stringValue]
      }
      return try reader
        .make(anyCodable: map, chip: .hash(key.stringValue))
        .unkeyedContainer()
    }
    public func superDecoder() throws -> Decoder { throw Thrown("supper not supported") }
    public func superDecoder(forKey key: Key) throws -> Decoder {
      throw Thrown("supper not supported")
    }
    private func value<T>(forKey key: Key, make: Try.Of<AnyCodable>.Do<T>) throws -> T {
      let map = try reader.rethrow(what: "not a map") {
        try ?!reader.anyCodable.map?[key.stringValue]
      }
      return try reader.rethrow(chip: .hash(key.stringValue)) {
        try make(map)
      }
    }
  }
}
