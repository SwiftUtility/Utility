import Foundation
extension AnyCodable {
  struct ValueDecoder: SingleValueDecodingContainer {
    let reader: Reader
    init(reader: Reader) { self.reader = reader }
    var codingPath: [CodingKey] { reader.codingPath }
    func decodeNil() -> Bool {
      reader.anyCodable.value?.isNull ?? false
    }
    func decode(_ type: Bool.Type) throws -> Bool {
      try reader.rethrow { try ?!reader.anyCodable.value?.bool }
    }
    func decode(_ type: Int.Type) throws -> Int {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: Int8.Type) throws -> Int8 {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: Int16.Type) throws -> Int16 {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: Int32.Type) throws -> Int32 {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: Int64.Type) throws -> Int64 {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: UInt.Type) throws -> UInt {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: UInt8.Type) throws -> UInt8 {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: UInt16.Type) throws -> UInt16 {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: UInt32.Type) throws -> UInt32 {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: UInt64.Type) throws -> UInt64 {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: Double.Type) throws -> Double {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: Float.Type) throws -> Float {
      try reader.rethrow { try ?!.init(exactly: ?!reader.anyCodable.value?.number) }
    }
    func decode(_ type: String.Type) throws -> String {
      try reader.rethrow { try ?!reader.anyCodable.value?.string }
    }
    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
      try reader.read(type)
    }
  }
}
