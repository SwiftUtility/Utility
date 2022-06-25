import Foundation
extension AnyCodable {
  public struct Notation {
    private var methods: [ObjectIdentifier: Method] = [:]
    public subscript<T: Encodable>(_ meta: T.Type = T.self) -> Try.By<T>.Of<Encoder>.Go? {
      get { methods[.init(meta as Any.Type)]?.erased as? Try.By<T>.Of<Encoder>.Go }
      set { methods[.init(meta as Any.Type)] = try? .init(encode: ?!newValue) }
    }
    public func write(_ value: Encodable) throws -> AnyCodable {
      try Writer.write(value, notation: self)
    }
    func encode(_ value: Encodable, by encoder: Encoder) throws -> Void? {
      try methods[.init(type(of: value))]?.casted(value)(encoder)
    }
    public static var empty: Self { .init() }
    public static var json: Self {
      var this = Self()
      this[URL.self] = { value in value.absoluteString.encode(to:) }
      this[Data.self] = { value in value.base64EncodedString().encode(to:) }
      this[Date.self] = { value in value.timeIntervalSince1970.encode(to:) }
      return this
    }
    struct Method {
      let erased: Any
      let casted: Try.By<Encodable>.Of<Encoder>.Go
      init<T: Encodable>(encode: @escaping Try.By<T>.Of<Encoder>.Go) {
        self.erased = encode
        self.casted = { ($0 as? T).map(encode) ?? { _ in throw Thrown() } }
      }
    }
  }
}
