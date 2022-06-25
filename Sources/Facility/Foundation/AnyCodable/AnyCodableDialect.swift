import Foundation
extension AnyCodable {
  public struct Dialect {
    private var map: [ObjectIdentifier: Any] = [:]
    public subscript<T>(_ meta: T.Type = T.self) -> Try.Of<Decoder>.Do<T>? {
      get { map[.init(meta as Any.Type)] as? Try.Of<Decoder>.Do<T> }
      set { map[.init(meta as Any.Type)] = newValue }
    }
    public static var empty: Self { return .init() }
    public static var json: Self {
      var this = Self()
      this[URL.self] = { decoder in try Lossy
        .init(try decoder.singleValueContainer())
        .reduce(curry: String.self, SingleValueDecodingContainer.decode(_:))
        .map { url in try URL(string: url).get { throw Thrown("bad url: \(url)") }}
        .get()
      }
      this[Data.self] = { decoder in try Lossy
        .init(try decoder.singleValueContainer())
        .reduce(curry: String.self, SingleValueDecodingContainer.decode(_:))
        .map { data in try Data(base64Encoded: data).get { throw Thrown("bad url: \(data)") }}
        .get()
      }
      this[Date.self] = { decoder in try Lossy
        .init(try decoder.singleValueContainer())
        .reduce(curry: Double.self, SingleValueDecodingContainer.decode(_:))
        .map(Date.init(timeIntervalSince1970:))
        .get()
      }
      return this
    }
    public func read<T>(_ value: T.Type, from anyCodable: AnyCodable) throws -> T
    where T: Decodable { try Reader
      .make(dialect: self, anyCodable: anyCodable)
      .read(value)
    }
  }
}
