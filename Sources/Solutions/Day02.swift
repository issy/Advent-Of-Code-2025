import protocol Lib.AdventDay

extension String {
  func chunk(size: Int) -> [String] {
    var chunks: [String] = []
    for i in stride(from: 0, to: self.count, by: size) {
      let start = self.index(self.startIndex, offsetBy: i)
      let end = self.index(start, offsetBy: size, limitedBy: self.endIndex) ?? self.endIndex
      chunks.append(String(self[start..<end]))
    }
    return chunks
  }
}

func isValidId(_ id: String) -> Bool {
  // Chop string into equal sized chunks
  for i in 2...(id.count / 2) + 1 {
    let chunks = id.chunk(size: i)
    // Check for adjacent matching chunks
    for chunkIndex in 0..<(chunks.count - 1) {
      if chunks[chunkIndex] == chunks[chunkIndex + 1] {
        return false
      }
    }
  }
  return true
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

  public func getAllInvalidIds() -> [String] {
    return getAllIds().filter { Day02IdRange.idIsInvalid($0) }
  }

  public static func idIsInvalid(_ id: String) -> Bool {
    return !isValidId(id)
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
      $0.getAllIds().filter { !isValidId($0) }
    }
    .map { Int.init($0)! }
    .reduce(0, +)
  }

  public func part2(_ input: [Day02IdRange]) -> Int {
    0
  }

}
