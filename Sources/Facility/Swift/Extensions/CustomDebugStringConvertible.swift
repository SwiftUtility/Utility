import Foundation
extension CustomDebugStringConvertible {
  public func debug(file: StaticString = #fileID, line: UInt = #line) -> Self {
    print("debug \(file):\(line) \(String(reflecting: self))")
    return self
  }
}
