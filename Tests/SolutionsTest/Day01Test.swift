import XCTest
import Solutions

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
        XCTAssertEqual(parsed[0], "L68")
        XCTAssertEqual(parsed[9], "L82")
    }

    func testPart1() {
        let day = Day01()
        let parsed = day.parse(part1TestInput)
        let result = day.part1(parsed)
        XCTAssertEqual(result, 3)
    }
}
