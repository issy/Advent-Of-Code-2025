import AdventOfCode
import ArgumentParser
import Foundation

import struct ArgumentParser.CommandConfiguration
import protocol ArgumentParser.ParsableCommand
import struct SystemPackage.FileDescriptor

struct InputCache {
    private let fm: FileManager = .default
    private var baseURL: URL

    init() {
        self.baseURL = fm.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("AdventOfCode", isDirectory: true)
    }

    func input(for day: Int, loader: () throws -> String) throws -> String {
        try fm.createDirectory(at: self.baseURL, withIntermediateDirectories: true)

        let fileURL = self.baseURL.appendingPathComponent("day\(day).txt")

        if fm.fileExists(atPath: fileURL.path) {
            return try String(contentsOf: fileURL)
        }

        let input = try loader()
        try input.write(to: fileURL, atomically: true, encoding: .utf8)
        return input
    }
}

func loadInput(day: Int) throws -> String {
    let url = Bundle.main.url(
        forResource: "day\(day)",
        withExtension: "txt"
    )!

    return try String(contentsOf: url)
}

struct AnyDay: Sendable {
    let day: Int
    let run: @Sendable (String) -> Void
}

extension AnyDay {
    init<D: AdventDay>(_ dayType: D.Type) {
        self.day = dayType.day
        self.run = { input in
            let instance = dayType.init()
            let parsed = instance.parse(input)

            print("Day \(dayType.day)")
            print("  Part 1:", instance.part1(parsed))
            print("  Part 2:", instance.part2(parsed))
        }
    }
}

enum DayRegistry {
    static let all: [AnyDay] = [
        AnyDay(Day01.self)
    ]
    .sorted { $0.day < $1.day }
}

enum Runner {
    static func run(_ day: any AdventDay.Type, input: String) {
        day.run(with: input)
    }
}

@main
struct AoCCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "aoc",
        abstract: "Run Advent of Code solutions"
    )

    @Option(
        name: [.customLong("day")],
        help: "Run a specific day"
    )
    var day: Int?

    @Flag(
        name: [.customLong("latest")],
        help: "Run the latest implemented day"
    )
    var latest = false

    @Flag(
        name: [.customLong("all")],
        help: "Run all implemented days (default)"
    )
    var all = false

    func run() throws {
        let daysToRun = resolveDays()

        guard !daysToRun.isEmpty else {
            print("No matching days found.")
            return
        }

        let inputCache = InputCache()

        for day in daysToRun {
            let input = try inputCache.input(for: day.day) {
                try loadInput(day: day.day)
            }

            day.run(input)
            print()
        }
    }
}

extension AoCCommand {
    func resolveDays() -> [AnyDay] {
        if let day {
            return DayRegistry.all.filter { $0.day == day }
        }

        if latest {
            return DayRegistry.all.suffix(1)
        }

        // default: all
        return DayRegistry.all
    }
}
