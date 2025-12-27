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
  }

  @Test
  func testPart1() {
    let day = Day03()
    let parsed = day.parse(day3TestInput)
    let result = day.part1(parsed)
    #expect(result == 357)
  }
}
