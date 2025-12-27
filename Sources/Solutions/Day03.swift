import protocol Lib.AdventDay

public func getAllNumbersFromCharacterArray(_ chars: [Character]) -> [Int] {
  var numbers: [Int] = []
  for index in 0..<chars.count - 1 {
    let firstChar = chars[index]
    for index2 in index + 1..<chars.count {
      let secondChar = chars[index2]
      let numberString = String([firstChar, secondChar])
      let number = Int(numberString)!
      numbers.append(number)
    }
  }
  return numbers
}

struct Day03DigitToggle {
  let value: Int
  let index: Int
}

public func findHighestNumberFromCharacterArray(_ numbers: [Int]) -> Int {
  let allToggles = Array(
    numbers.enumerated().map { index, number in
      (value: number, index: index)
    })
  let highest12 = allToggles.sorted(by: { $0.value > $1.value }).prefix(12)
  let sortedByIndex = highest12.sorted(by: { $0.index < $1.index })
  let joined = sortedByIndex.map { String($0.value) }.joined()
  return Int(joined)!
}

public struct Day03: AdventDay {
  public static let day = 3

  public init() {}

  public func parse(_ input: String) -> [[Int]] {
    input
      .split(separator: "\n")
      .map { line in
        let chars = Array(line)
        let charsAsInts = chars.map { char in
          Int(String(char))!
        }
        return charsAsInts
      }
  }

  public func part1(_ input: [[Int]]) -> Int {
    input
      .map { line in getAllNumbersFromCharacterArray(line.map { Character(String($0)) }) }
      .map { $0.max()! }
      .reduce(0, +)
  }

  public func part2(_ input: [[Int]]) -> Int {
    input.map { findHighestNumberFromCharacterArray($0) }.reduce(0, +)
  }

}
