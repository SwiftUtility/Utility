/// An error to be ignored
public final class Thrown: Error, CustomStringConvertible {
  public let what: String
  public init(_ what: String) { self.what = what }
  public init(file: StaticString = #fileID, line: UInt = #line) { self.what = "\(file):\(line)" }
  public var description: String { what }
  public static func rethrow<T>(
    _ what: @autoclosure Act.Do<String> = "",
    make: Try.Do<T>
  ) throws -> T {
    do { return try make() } catch { throw Thrown(what()) }
  }
}
