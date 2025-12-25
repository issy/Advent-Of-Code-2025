public protocol AdventDay : Sendable {
    associatedtype Input

    static var day: Int { get }

    func parse(_ input: String) -> Input
    func part1(_ input: Input) -> Int
    func part2(_ input: Input) -> Int
}

public extension AdventDay {
    func run(with input: String) {
        let parsed = self.parse(input)

        let p1 = self.part1(parsed)
        let p2 = self.part2(parsed)

        print("Day \(Self.day)")
        print("  Part 1:", p1)
        print("  Part 2:", p2)
    }
}
