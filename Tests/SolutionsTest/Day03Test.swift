import Solutions
import Testing

let day3TestInput = """
  987654321111111
  811111111111119
  234234234234278
  818181911112111
  """

@Suite("Day03")
struct Day03Tests {
  @Test
  func testParsing() {
    let day = Day03()
    let parsed = day.parse(day3TestInput)
    #expect(parsed.count == 4)
    #expect(
      parsed == [
        [9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1],
        [8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9],
        [2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 7, 8],
        [8, 1, 8, 1, 8, 1, 9, 1, 1, 1, 1, 2, 1, 1, 1],
      ])
  }

  @Test
  func testPart1() {
    let day = Day03()
    let parsed = day.parse(day3TestInput)
    let result = day.part1(parsed)
    #expect(result == 357)
  }

  @Test
  func testPart2() {
    let day = Day03()
    let parsed = day.parse(day3TestInput)
    let result = day.part2(parsed)
    #expect(result == 3_121_910_778_619)
  }
}
