import Foundation

let path = Bundle.main.url(forResource: "Day02", withExtension: "txt")!

let content = try! String(contentsOf: path, encoding: .utf8)

let clock = ContinuousClock()

print("Execution Time 1: \(clock.measure { part01(content) })")
print("Execution Time 2: \(clock.measure { part02(content) })")

func part01(_ content: String) {
    var sum = 0
    for line in content.split(whereSeparator: \.isNewline) {
        if let match = line.firstMatch(of: #/(\d+)x(\d+)x(\d+)/#) {

            let l = Int(match.output.1)!
            let w = Int(match.output.2)!
            let h = Int(match.output.3)!
            sum += 2 * l * w + 2 * w * h + 2 * h * l

            let maxSide = max(l, w, h)

            switch maxSide {
            case l:
                sum += w * h
            case w:
                sum += l * h
            case h:
                sum += l * w
            default:
                fatalError("Unexpected max side")
            }
        }
    }
    print(sum)
}

func part02(_ content: String) {
    var sum = 0
    for line in content.split(whereSeparator: \.isNewline) {
        if let match = line.firstMatch(of: #/(\d+)x(\d+)x(\d+)/#) {

            let l = Int(match.output.1)!
            let w = Int(match.output.2)!
            let h = Int(match.output.3)!
            sum += l * w * h

            let maxSide = max(l, w, h)

            switch maxSide {
            case l:
                sum += 2 * w + 2 * h
            case w:
                sum += 2 * l + 2 * h
            case h:
                sum += 2 * l + 2 * w
            default:
                fatalError("Unexpected max side")
            }
        }
    }
    print(sum)
}
