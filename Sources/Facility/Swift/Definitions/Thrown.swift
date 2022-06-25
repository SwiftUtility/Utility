/// An error to be ignored
public final class Thrown: Error, CustomStringConvertible {
  public let what: String
  public init(_ what: String) { self.what = what }
  public init(file: StaticString = #fileID, line: UInt = #line) { self.what = "\(file):\(line)" }
  public var description: String { what }
}
