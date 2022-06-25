/// An error to be ignored
public final class Thrown: Error, CustomStringConvertible, CustomDebugStringConvertible {
  public let what: String?
  public let file: StaticString
  public let line: UInt
  public init(_ what: String? = nil, file: StaticString = #fileID, line: UInt = #line) {
    self.what = what
    self.file = file
    self.line = line
  }
  public var description: String { what.get("") }
  public var debugDescription: String { "\(file)@\(line)" + what.map { ": " + $0 }.get("") }
}
