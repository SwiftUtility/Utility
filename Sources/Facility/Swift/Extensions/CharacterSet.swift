import Foundation
public extension CharacterSet {
  static var hexadecimalDigits: Self { .init(charactersIn: "abcdefABCDEF01234567890") }
}
