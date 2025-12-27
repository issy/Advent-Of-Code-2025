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

public struct Day03: AdventDay {
  public static let day = 3

  public init() {}

  public func parse(_ input: String) -> [[Int]] {
    input
      .split(separator: "\n")
      .map { getAllNumbersFromCharacterArray(Array($0)) }
  }

  public func part1(_ input: [[Int]]) -> Int {
    input.map { $0.max()! }.reduce(0, +)
  }

  public func part2(_ input: [[Int]]) -> Int {
    0
  }

}
