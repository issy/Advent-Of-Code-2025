public protocol AdventDay : Sendable {
    associatedtype Input

    static var day: Int { get }

    init()

    func parse(_ input: String) -> Input
    func part1(_ input: Input) -> Int
    func part2(_ input: Input) -> Int
}

public extension AdventDay {
    static func run(with input: String) {
        let day = Self.init()
        let parsed = day.parse(input)

        let p1 = day.part1(parsed)
        let p2 = day.part2(parsed)

        print("Day \(Self.day)")
        print("  Part 1:", p1)
        print("  Part 2:", p2)
    }
}

struct AnyDay {
    let day: Int
    let run: (String) -> Void
}
