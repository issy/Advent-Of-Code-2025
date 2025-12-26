import protocol Lib.AdventDay

public func stringIsRepeatedChunks(_ string: String, chunks numberOfChunks: Int? = nil) -> Bool {
  let length = string.count
  for i in 1...(length / 2) {
    let substring = string.prefix(i)
    let repetitionCount = numberOfChunks ?? length / substring.count
    if String(repeating: String(substring), count: repetitionCount) == string {
      return true
    }
  }
  return false
}

public func stringIsTwoRepeatedChunks(_ string: String) -> Bool {
  return stringIsRepeatedChunks(string, chunks: 2)
}

public struct Day02IdRange: Equatable {
  let a: String
  let b: String

  public init(a: String, b: String) {
    self.a = a
    self.b = b
  }

  public init(from string: Substring) {
    let parts = string.split(separator: "-")
    self.init(a: String(parts[0]), b: String(parts[1]))
  }

  public func getAllIds() -> [String] {
    guard let start = Int(a), let end = Int(b) else {
      return []
    }
    return (start...end).map(String.init)
  }
}

public struct Day02: AdventDay {
  public static let day = 2

  public init() {}

  public func parse(_ input: String) -> [Day02IdRange] {
    input.split(separator: ",").map(Day02IdRange.init)
  }

  public func part1(_ input: [Day02IdRange]) -> Int {
    return input.flatMap {
      $0.getAllIds()
        .filter { $0.count % 2 == 0 }
    }
    .filter { stringIsTwoRepeatedChunks($0) }
    .map { Int.init($0)! }
    .reduce(0, +)
  }

  public func part2(_ input: [Day02IdRange]) -> Int {
    return input.flatMap {
      $0.getAllIds()
        .filter { $0.count > 1 }
    }
    .filter { stringIsRepeatedChunks($0) }
    .map { Int.init($0)! }
    .reduce(0, +)
  }

}
