import XCTest
import Solutions

class Day01TestTests: XCTestCase {
    func testPart1() {
        let day = Day01()
        let input = """
        """
        let parsed = day.parse(input)
        let result = day.part1(parsed)
        XCTAssertEqual(result, 24000)
    }
}
