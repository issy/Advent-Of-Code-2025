import class Foundation.FileManager
import struct Foundation.URL
import ArgumentParser
import Aoc2025

enum DayRegistry {
    public static let all: [any AdventDay] = [
        Day01.init(),
    ]
    .sorted { type(of: $0).day < type(of: $1).day }
}

struct InputCache {
    private let fm: FileManager = .default
    private var baseURL: URL

    init() {
        self.baseURL = fm.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("AdventOfCode", isDirectory: true)
    }

    func input(for day: Int) throws -> String? {
        try fm.createDirectory(at: self.baseURL, withIntermediateDirectories: true)

        let fileURL = self.baseURL.appendingPathComponent("day\(day).txt")

        guard fm.fileExists(atPath: fileURL.path) else {
            print("Input file not found at path: \(fileURL.path)")
            return nil
        }

        print("Loading input from file: \(fileURL.path)")

        return try String(contentsOf: fileURL)
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
            let input = try inputCache.input(for: type(of: day).day)
            guard input != nil else {
                print("No input found for day \(type(of: day).day). Exiting.")
                return
            }

            day.run(with: input!)
            print()
        }
    }

    func resolveDays() -> [any AdventDay] {
        if let day {
            return DayRegistry.all.filter { type(of: $0).day == day }
        }

        if latest {
            return DayRegistry.all.suffix(1)
        }

        // default: all
        return DayRegistry.all
    }
}
