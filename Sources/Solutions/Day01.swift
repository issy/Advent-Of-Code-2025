import protocol Lib.AdventDay

enum Day01Error: Swift.Error {
  case invalidInstruction
}

public enum Day01Instruction: Equatable {
  case left(Int)
  case right(Int)

  public static func parse(from string: String) throws -> Day01Instruction {
    guard let direction = string.first,
      let distance = Int(string.dropFirst())
    else {
      throw Day01Error.invalidInstruction
    }

    switch direction {
    case "L":
      return .left(distance)
    case "R":
      return .right(distance)
    default:
      throw Day01Error.invalidInstruction
    }
  }

  public func resultingPoint(from start: Int) -> Int {
    let actualPoint =
      switch self {
      case .left(let distance): start - distance
      case .right(let distance): start + distance
      }
    return actualPoint % 100
  }
}

public struct Day01: AdventDay {
  public static let day = 1

  public init() {}

  public func parse(_ input: String) -> [Day01Instruction] {
    input
      .split(separator: "\n")
      .map(String.init)
      .map { return try! Day01Instruction.parse(from: $0) }
  }

  public func part1(_ input: [Day01Instruction]) -> Int {
    var startPosition = 50
    var zeroCounter = 0
    for instruction in input {
      startPosition = instruction.resultingPoint(from: startPosition)
      if startPosition == 0 {
        zeroCounter += 1
      }
    }
    return zeroCounter
  }

  public func part2(_ input: [Day01Instruction]) -> Int {
    var startPosition = 50
    var zeroCounter = 0
    for instruction in input {
      let distance =
        switch instruction {
        case .left(let distance): -distance
        case .right(let distance): distance
        }
      let passedZeroTimes = abs(distance + startPosition) / 100
      zeroCounter += passedZeroTimes
      startPosition = instruction.resultingPoint(from: startPosition)
      if startPosition == 0 {
        zeroCounter += 1
      }
    }
    return zeroCounter
  }

}
