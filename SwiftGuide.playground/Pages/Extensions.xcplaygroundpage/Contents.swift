

import Foundation


//: 扩展可以将计算实例属性和计算类型属性添加到现有类型。此示例将五个计算实例属性添加到Swift的内置Double类型，以便为使用距离单位提供基本支持：
extension Double {
    var km: Double { return self*1_000.0 }
    var m: Double { return self }
    var cm: Double { return self/100.0 }
    var mm: Double { return self/1_000.0}
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

//: 这些属性是只读的计算属性，因此get为了简洁起见，它们在没有关键字的情况下表示。它们的返回值是Double类型，并且可以在接受Double数学计算的任何地方使用：
let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

//: 下面的示例定义了一个Rect表示几何矩形的自定义结构。该示例还定义了两个称为Size和Point支撑结构，两者都为所有其属性提供的默认值0.0：
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

//: 由于Rect结构为其所有属性提供默认值，因此它会自动接收默认初始化程序和成员初始化程序，如默认初始化程序中所述。这些初始化程序可用于创建新Rect实例：
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

//: 可以扩展Rect结构以提供附加的初始化程序，该初始化程序采用特定的中心点和大小：
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

//: 这个新的初始化程序首先根据提供的center点和size值计算适当的原点。初始化程序然后调用结构的自动成员初始化程序init(origin:size:)，它将新的原点和大小值存储在适当的属性中：
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

//: 扩展可以向现有类型添加新的实例方法和类型方法。以下示例为Int类型添加了一个叫做repetitions的新实例方法：
extension Int {
    func repetitions(tarsk: () -> Void) {
        for _ in 0..<self {
            tarsk()
        }
    }
}

//: 定义此扩展后，可以在任何整数上调用repetitions(task:)方法以执行多次任务：
3.repetitions {
    print("Hello!")
}

//: 下面的例子为Int类型添加了一个名为squareSwift的新Mutating方法，它将原始值平方：
extension Int {
    mutating func squareSwift() {
        self = self*self
    }
}
var someInt = 3
someInt.squareSwift()
print(someInt)

//: 此示例向Swift的内置Int类型添加整数下标。此下标[n]返回从右侧开始n位后的十进制数：
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self/decimalBase)%10
    }
}
print(746381295[0])
print(746381295[1])
print(746381295[2])
print(746381295[8])

//: 如果Int值没有足够的数字用于请求的索引，则下标实现将返回0，就好像该数字已用零填充到左侧：
print(746381295[9])
print(0746381295[9])

//: 扩展可以向现有的类，结构和枚举添加新的嵌套类型：
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

//: 嵌套枚举现在可以与任何Int值一起使用：
func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])


//: [Previous](@previous)    [Next](@next)
