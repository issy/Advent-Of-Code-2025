import AdventOfCode

import protocol Lib.AdventDay

public struct InstructionLine {
  let direction: Character
  let distance: Int

  init?(from string: String) {
    guard let direction = string.first,
      let distance = Int(string.dropFirst())
    else {
      return nil
    }

    self.direction = direction
    self.distance = distance
  }
}

public struct Day01: AdventDay {
  public static let day = 1

  public init() {}

  public func parse(_ input: String) throws -> [String] {
    try input
      .split(separator: "\n")
      .map(String.init)
      .map { return InstructionLine.init(from: $0) }
      .map { _ in "" }
  }

  public func part1(_ input: [String]) -> Int {
    0
  }

  public func part2(_ input: [String]) -> Int {
    0
  }

}
