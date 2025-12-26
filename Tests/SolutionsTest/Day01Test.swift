import Testing

import struct Solutions.Day01
import enum Solutions.Day01Instruction

let part1TestInput = """
  L68
  L30
  R48
  L5
  R60
  L55
  L1
  L99
  R14
  L82
  """

@Suite("Day01")
struct Day01TestTests {
  @Test
  func testParsing() {
    let day = Day01()
    let parsed = day.parse(part1TestInput)
    #expect(parsed.count == 10)
    #expect(try! Day01Instruction.parse(from: "L68") == .left(68))
    #expect(try! Day01Instruction.parse(from: "R14") == .right(14))
  }

  @Test
  func testPart1() {
    let day = Day01()
    let parsed = day.parse(part1TestInput)
    let result = day.part1(parsed)
    #expect(result == 3)
  }

  @Test
  func testPart2() {
    return
    let day = Day01()
    let parsed = day.parse(part1TestInput)
    let result = day.part2(parsed)
    #expect(result == 6)
  }

  @Test
  func testInstructionOperation() throws {
    let instruction1 = try Day01Instruction.parse(from: "L10")
    let result1 = instruction1.resultingPoint(from: 50)
    #expect(result1 == 40)

    let instruction2 = try Day01Instruction.parse(from: "R20")
    let result2 = instruction2.resultingPoint(from: 90)
    #expect(result2 == 10)
  }
}
