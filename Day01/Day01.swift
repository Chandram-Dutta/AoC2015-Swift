import Foundation

let path = Bundle.main.url(forResource: "Day01", withExtension: "txt")!

let content = try! String(contentsOf: path, encoding: .utf8)

let clock = ContinuousClock()

print("Execution Time 1: \(clock.measure { part01(content) })")
print("Execution Time 2: \(clock.measure { part02(content) })")

func part01(_ content: String) {
    var floor = 0
    for char in content {
        if char == "(" {
            floor += 1
            continue
        }
        floor -= 1
    }
    print("Answer 1: \(floor)")
}

func part02(_ content: String) {
    var floor = 0

    for (currentIndex, char) in content.enumerated() {
        if floor < 0 {
            print("Answer 2: \(currentIndex)")
            return
        }

        switch char {
        case "(":
            floor += 1
        case ")":
            floor -= 1
        default:
            continue
        }
    }
}
