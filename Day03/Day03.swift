import Foundation

let path = Bundle.main.url(forResource: "Day03", withExtension: "txt")!

let content = try! String(contentsOf: path, encoding: .utf8)

let clock = ContinuousClock()

print("Execution Time 1: \(clock.measure { part01(content) })")
print("Execution Time 2: \(clock.measure { part02(content) })")

func part01(_ content: String) {
    var p = [0, 0]
    var c: Set = [p]

    for char in content {
        switch char {
        case ">":
            p[0] += 1
        case "<":
            p[0] -= 1
        case "v":
            p[1] += 1
        case "^":
            p[1] -= 1
        default:
            fatalError("wrong instruction")
        }
        c.insert(p)
    }
    print(c.count)
}

func part02(_ content: String) {
    var p1 = [0, 0]
    var p2 = [0, 0]
    var c: Set = [p1]

    var type = true
    for char in content {
        if type {
            switch char {
            case ">":
                p1[0] += 1
            case "<":
                p1[0] -= 1
            case "v":
                p1[1] += 1
            case "^":
                p1[1] -= 1
            default:
                fatalError("wrong instruction")
            }
            c.insert(p1)
        } else {
            switch char {
            case ">":
                p2[0] += 1
            case "<":
                p2[0] -= 1
            case "v":
                p2[1] += 1
            case "^":
                p2[1] -= 1
            default:
                fatalError("wrong instruction")
            }
            c.insert(p2)
        }
        type.toggle()
    }

    print(c.count)
}
