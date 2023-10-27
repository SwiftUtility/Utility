import Foundation
extension AnyCodable {
  class Writer: Encoder {
    private var notation: Notation
    private var items: [AnyCodable] = []
    private var keys: [AnyCodable.Chip] = []
    private init(notation: Notation) {
      self.notation = notation
    }
    var codingPath: [CodingKey] { keys }
    var userInfo: [CodingUserInfoKey : Any] { [:] }
    static func write(_ value: Encodable, notation: Notation) throws -> AnyCodable {
      let writer = Writer(notation: notation)
      try writer.write(value)
      writer.flush(to: 1)
      return try writer.items.first.get { throw Thrown("Encoder precondition broken") }
    }
    func write(_ value: Encodable) throws {
      try notation.encode(value, by: self).get { try value.encode(to: self) }
    }
    func container<Key>(
      keyedBy type: Key.Type
    ) -> KeyedEncodingContainer<Key> where Key : CodingKey {
      items.append(.map([:]))
      keys.append(.hash(""))
      return KeyedEncodingContainer(AnyCodable.MapEncoder(writer: self, depth: items.count))
    }
    func unkeyedContainer() -> UnkeyedEncodingContainer {
      items.append(.list([]))
      keys.append(.index(0))
      return ListEncoder(writer: self, depth: items.count)
    }
    func singleValueContainer() -> SingleValueEncodingContainer {
      return ValueEncoder(writer: self, depth: items.count)
    }
    func flush(to depth: Int, key: String? = nil) {
      guard depth > 0 else { return }
      while items.count > depth {
        let item = items.end
        items = items.dropLast()
        if case .value = item {} else { keys = keys.dropLast() }
        switch items.end {
        case .list(var list):
          list.append(item)
          items.end = .list(list)
          keys.end = .index(list.count)
        case .map(var map):
          map[keys.end.stringValue] = item
          items.end = .map(map)
        default: break
        }
      }
      try? keys[depth-1] = .hash(?!key)
    }
    func push(to depth: Int, value: AnyCodable.Value, key: String? = nil) {
      flush(to: depth, key: key)
      items.append(.value(value))
    }
  }
}
