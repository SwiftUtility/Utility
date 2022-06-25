import Foundation
extension CustomDebugStringConvertible {
  @discardableResult
  public func debug(
    _ chips: String? = nil,
    file: StaticString = #fileID,
    line: UInt = #line
  ) -> Self {
    SideEffects.shared.printDebug("\(chips.get("\(file)@\(line)")): \(String(reflecting: self))")
    return self
  }
}
