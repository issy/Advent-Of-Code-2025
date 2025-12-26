import Solutions
import Testing

let part2TestInput =
  "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

@Suite("Day02")
struct Day02TestTests {
  @Test
  func testParsing() {
    let day = Day02()
    let parsed = day.parse(part2TestInput)
    #expect(parsed.count == 11)
    #expect(
      parsed == [
        Day02IdRange(a: "11", b: "22"),
        Day02IdRange(a: "95", b: "115"),
        Day02IdRange(a: "998", b: "1012"),
        Day02IdRange(a: "1188511880", b: "1188511890"),
        Day02IdRange(a: "222220", b: "222224"),
        Day02IdRange(a: "1698522", b: "1698528"),
        Day02IdRange(a: "446443", b: "446449"),
        Day02IdRange(a: "38593856", b: "38593862"),
        Day02IdRange(a: "565653", b: "565659"),
        Day02IdRange(a: "824824821", b: "824824827"),
        Day02IdRange(a: "2121212118", b: "2121212124"),
      ])
  }

  @Test
  func testAllIdsFromTestInput() {
    let day = Day02()
    let parsed = day.parse(part2TestInput)
    let allIds = parsed.flatMap { $0.getAllIds() }
    #expect(allIds.count == 106)
    let desiredIds = allIds.filter(stringIsTwoRepeatedChunks)
    #expect(desiredIds.count == 8)
    #expect(
      desiredIds == [
        "11",
        "22",
        "99",
        "1010",
        "1188511885",
        "222222",
        "446446",
        "38593859",
      ])
  }

  @Test
  func testIdRange() {
    let range = Day02IdRange(a: "11", b: "22")
    #expect(
      range.getAllIds() == ["11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"])
    let invalidIds = range.getAllIds().filter(stringIsTwoRepeatedChunks)
    #expect(invalidIds == ["11", "22"])
  }

  @Test(arguments: [
    ("12", false),
    ("1234", false),
    ("1122", false),
    ("123456", false),
    ("111222", false),
    ("123345", false),
    ("1212", true),
    ("123123", true),
  ])
  func testStringIsRepeatedChunks(input: String, expected: Bool) {
    #expect(stringIsTwoRepeatedChunks(input) == expected)
  }

  @Test
  func testPart1() {
    let day = Day02()
    let parsed = day.parse(part2TestInput)
    let result = day.part1(parsed)
    #expect(result == 1_227_775_554)
  }
}
