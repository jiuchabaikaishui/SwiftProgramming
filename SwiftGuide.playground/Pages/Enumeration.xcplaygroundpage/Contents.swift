import Foundation

//: 使用enum关键字引入枚举，并将其整个定义放在一对大括号中，使用case关键字来引入新的枚举案例：
enum CompassPoint: CaseIterable {
    case north
    case south
    case east
    case west
}

//: 多个案例可以出现在一行中，以逗号分隔：
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//: 每个枚举定义都定义了一个新类型。与Swift中的其他类型一样：
var directionToHead = CompassPoint.north

//: 当可以推断出枚举类型时可以用较短的点语法将其设置值：
directionToHead = .east

switch directionToHead {
case .north:
    print(directionToHead)
case .south:
    print(directionToHead)
case .east:
    print(directionToHead)
case .west:
    print(directionToHead)
}

//: allCases语法需要枚举遵守CaseIterable协议：
print(CompassPoint.allCases.count)
for item in CompassPoint.allCases {
    print(item)
}

//: 能够在这些案例值旁边存储其他类型的值，此附加信息称为关联值，每次将该案例用作代码中的值时，它都会有所不同：
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 87976, 87669, 3)
productBarcode = .qrCode("asdfkdhfk")

//: 将每个关联值提取为常量（带let前缀）或变量（带var前缀），以便在switch案例的正文中使用。如果枚举案例的所有关联值都被提取为常量，或者所有这些值都被提取为变量，则可以在案例名称前面放置单个var或let注释，以简洁起见：
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("\(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let code):
    print(code)
}

//: 作为关联值的替代方法，枚举情况可以预先填充默认值（称为原始值），它们都是相同的类型：
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//: 当整数用于原始值时，每种情况的隐含值比前一种情况多一个。如果第一种情况没有设置值，则其值为0：
enum num: Int, CaseIterable {
    case one = 1, two, three
}

//: 当字符串用于原始值时，每个案例的隐含值是该案例名称的文本：
enum Direction: String, CaseIterable {
    case Left, Top, Right, Bottom
}

//: 可以使用其rawValue属性访问枚举案例的原始值：
for item in num.allCases {
    print("\(item): \(item.rawValue)")
}
for item in Direction.allCases {
    print("\(item): \(item.rawValue)")
}

//: 并非所有原始值类型的值都能匹配到枚举值，所以原始值初始设定项值始终返回可选的枚举可选类型：
let left = Direction(rawValue: "◁")
let top = Direction(rawValue: "Top")
if left == nil {
    print("left初始化失败！")
} else {
    print(left!.rawValue)
}
if top == nil {
    print("top初始化失败！")
} else {
    print(top!.rawValue)
}

//: 递归枚举是具有枚举作为一个或一个以上的枚举案件关联值的枚举。通过在它之前写入indirect来指示枚举类型是递归的，它告诉编译器插入必要的间接层：
indirect enum ArithmeticExpression {
    case num(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .num(let value):
        return value
    case let .addition(left, right):
        return evaluate(expression: left) + evaluate(expression: right)
    case let .multiplication(left, right):
        return evaluate(expression: left)*evaluate(expression: right)
    }
}
let four = ArithmeticExpression.num(4)
let five = ArithmeticExpression.num(5)
let value = evaluate(expression: ArithmeticExpression.addition(ArithmeticExpression.addition(four, five), five))
print(value)



//: [Previous](@previous)    [Next](@next)
