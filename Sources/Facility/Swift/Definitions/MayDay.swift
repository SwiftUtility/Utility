/// An error to be handled via sideEffect
public final class MayDay: Error, CustomStringConvertible, CustomDebugStringConvertible {
  public let what: String
  public let file: StaticString
  public let line: UInt
  public init(_ what: String = "", file: StaticString = #fileID, line: UInt = #line) {
    self.what = what
    self.file = file
    self.line = line
    SideEffects.shared.reportMayDay(self)
  }
  public var description: String { what }
  public var debugDescription: String { "MayDay@\(file)@\(line): \(what)" }
  public static func assert(
    _ condition: @autoclosure Act.Do<Bool>,
    _ what: @autoclosure Act.Do<String> = "",
    file: StaticString = #fileID,
    line: UInt = #line
  ) {
    guard !condition() else { return }
    SideEffects.shared.reportMayDay(.init(what(), file: file, line: line))
  }
  public static func report(
    _ what: @autoclosure Act.Do<String> = "",
    file: StaticString = #fileID,
    line: UInt = #line
  ) { SideEffects.shared.reportMayDay(.init(what(), file: file, line: line)) }
}
