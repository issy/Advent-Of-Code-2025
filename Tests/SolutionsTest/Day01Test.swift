import Solutions
import XCTest

import enum Solutions.Instruction

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

class Day01TestTests: XCTestCase {
  func testParsing() {
    let day = Day01()
    let parsed = day.parse(part1TestInput)
    XCTAssertEqual(parsed.count, 10)
    XCTAssertEqual(try! Instruction.parse(from: "L68"), .left(68))
    XCTAssertEqual(try! Instruction.parse(from: "R14"), .right(14))
  }

  func testPart1() {
    let day = Day01()
    let parsed = day.parse(part1TestInput)
    let result = day.part1(parsed)
    XCTAssertEqual(result, 3)
  }

  func testPart2() {
    let day = Day01()
    let parsed = day.parse(part1TestInput)
    let result = day.part2(parsed)
    XCTAssertEqual(result, 5)
  }

  func testInstructionOperation() throws {
    let instruction1 = try Instruction.parse(from: "L10")
    let result1 = instruction1.resultingPoint(from: 50)
    XCTAssertEqual(result1, 40)

    let instruction2 = try Instruction.parse(from: "R20")
    let result2 = instruction2.resultingPoint(from: 90)
    XCTAssertEqual(result2, 10)
  }
}
