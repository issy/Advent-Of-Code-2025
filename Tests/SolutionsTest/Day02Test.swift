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
  func testIdRange() {
    let range = Day02IdRange(a: "11", b: "22")
    #expect(
      range.getAllIds() == ["11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"])
    let invalidIds = range.getAllIds().filter(stringIsRepeatedChunks)
    #expect(invalidIds == ["11", "22"])
  }

  @Test
  func testIdValidation() {
    print("Executing...")
    #expect(stringIsRepeatedChunks("12") == false)
    print("Executed.")
    #expect(stringIsRepeatedChunks("1234") == false)
    #expect(stringIsRepeatedChunks("1122") == true)
    #expect(stringIsRepeatedChunks("123456") == false)
    #expect(stringIsRepeatedChunks("111222") == true)
    #expect(stringIsRepeatedChunks("123345") == false)
  }
}
