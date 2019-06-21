
import Foundation

//: 使用for-in循环迭代序列，比如数组的中的项、数字范围、字符串中的字符：
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

//: 字典的键被分解为一个animalName常量，并且字典的值被分解为一个legCount常量：
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

//: 可以使用for-in实现具有数字范围的循环。此示例打印五次表中的前几个条目：
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//: 如果不需要序列中的每个值，则可以使用下划线代替变量名来忽略这些值：
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")


//: 蛇梯棋
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}
print("Game over!")


board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
square = 0
diceRoll = 0

repeat {
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    square += diceRoll
} while square < finalSquare
print("Game over!")


//: 在最简单的形式中，if语句只有一个if条件。它仅在该条件为true时才执行一组语句。
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

//: if语句对于条件false为的情况，if语句可以提供另一组语句，称为else子句。这些语句由关键字else指示。
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

//: 可以将多个if语句链接在一起以考虑其他子句。
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

//: 最后一个else子句是可选的，如果不需要完成条件集，则可以不要该子句。
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}

//: 每个switch声明都必须详尽无遗。也就是说，所考虑类型的每个可能值必须与其中一个switch案例相匹配。
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

//: 每个案例的主体必须包含至少一个可执行语句。编写以下代码无效，因为第一种情况是空的：
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

//: switch可以检查案例中的值是否包含在间隔中。此示例使用数字间隔为任何大小的数字提供自然计数：
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

//: 可以使用元组在同一switch语句中测试多个值。可以针对不同的值或值的间隔来测试元组的每个元素。或者，使用下划线（_）（也称为通配符模式）来匹配任何可能的值。
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

//: 一个switch情况下，可以将其命名为临时常量或变量，情况下使用相匹配的一个或多个值。此行为称为值绑定，因为值绑定到案例正文中的临时常量或变量。
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

//: 一个switch情况下可以使用where子句来检查附加条件
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//: 共享相同主体的多个Switch案例可以通过在每个模式之间用逗号分隔写几个模式来组合。如果任何模式匹配，则认为该情况匹配。
let someCharacter1: Character = "e"
switch someCharacter1 {
case "a", "e", "i", "o", "u":
    print("\(someCharacter1) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter1) is a consonant")
default:
    print("\(someCharacter1) is not a vowel or a consonant")
}

//: 复合案例还可以包括值绑定。复合案例的所有模式都必须包含同一组值绑定，并且每个绑定必须从复合案例中的所有模式中获取相同类型的值。这确保了，无论复合案例的哪个部分匹配，案例正文中的代码总是可以访问绑定的值，并且值始终具有相同的类型。
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

//: 从小写字符串中删除所有元音和空格
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)

//: 打开一个Character值，并确定它是否表示四种语言之一的数字符号。为简洁起见，单个switch案例涵盖了多个值
let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

//: 如果需要C样式的直通行为，则可以使用fallthrough关键字逐个选择加入此行为。以下示例fallthrough用于创建数字的文本描述。
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

//: finalSquare，board，square，diceRoll的值以同样的方式初始化：
board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
square = 0
diceRoll = 0

//: while循环的条件为square != finalSquare，以反映您必须准确降落在25号方格。
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")

//: guard语句，像if语句，执行以布尔值表达式为条件的语句。使用guard语句要求条件必须为true才能执行guard语句后的代码。与if语句不同，guard语句总是有一个else子句 - 如果条件不为真，则执行else子句中的代码。
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])

//: 可以在if或guard语句中使用可用性条件来有条件地执行代码块，具体决定要使用的API是否在运行时可用。
if #available(iOS 10, *) {
    
}


//: [Previous](@previous)    [Next](@next)
