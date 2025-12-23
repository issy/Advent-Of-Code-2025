import Foundation

func readInput(day: Int) throws -> String {
    let filename = "day\(day).txt"
    let url = Bundle.main.url(forResource: filename, withExtension: nil)!
    print("filepath: \(url.absoluteString)")

    return ""
    // return try String(contentsOf: url, encoding: .utf8)
}
