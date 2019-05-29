

import Foundation


//: 属性要求始终声明为变量属性，前缀为var关键字。可获取和可设置属性通过在类型声明后写入{ get set }来指示，并且可通过写入{ get }来指示可获取属性：
//protocol SomeProtocol {
//    var mustBeSettable: Int { get set}
//    var doesNotNeedToBeSettable: Int { get }
//}

//: 在协议中定义类型属性始终要求使用关键字static添加前缀。即使在类实现时类型属性要求可以使用class或static关键字作为前缀，此规则也适用：
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

//: 以下是具有单实例属性要求的协议示例：
protocol FullyNamed {
    var fullName: String { get }
}

//: 这是一个遵守FullyNamed协议的简单结构示例：
//struct Person: FullyNamed {
//    let fullName: String
//}
//let john = Person(fullName: "John Appleseed")
//print(john.fullName)

//: 这是一个更复杂的类，它也遵守FullyNamed协议：
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)

//: 与类型属性要求一样，当在协议中定义类型方法时始终要求使用关键字static添加前缀。即使在类实现时类型方法要求以classor static关键字为前缀，也是如此：
//protocol SomeProtocol {
//    static func someTypeMethod()
//}

//: 以下示例使用单个实例方法的需求定义协议：
protocol RandomNumberGenerator {
    func random() -> Double
}

//: 这是一个遵守RandomNumberGenerator协议的类的实现。此类实现的伪随机数生成器算法称为线性同余生成器：
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
//let generator = LinearCongruentialGenerator()
//print("Here's a random number: \(generator.random())")
//print("And another one: \(generator.random())")

//: toggle()方法使用mutating关键字作为Togglable协议定义的一部分进行标记，以指示该方法在调用时会改变实例的状态：
protocol Togglable {
    mutating func toggle()
}

//: 下面的示例定义了一个名为OnOffSwitch的枚举。这个枚举在on和off两个状态之间切换。枚举的toggle实现标记为mutating，以匹配Togglable协议的要求：
enum OnOffSwitch: Togglable {
    case on, off
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        default:
            self = .on
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
print(lightSwitch)

//: 协议可能需要通过遵守的类型来实现特定的初始化程序。可以将这些初始化程序作为协议定义的一部分编写，其方式与普通初始化程序完全相同，但不使用花括号或初始化程序主体：
protocol SomeProtocol {
    init(someParameter: Int)
}

//: 以下是用作类型的协议示例：
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random()*Double(sides)) + 1
    }
}


//: 以下是如何使用Dice类以LinearCongruentialGenerator作为随机数生成器创建六面骰子：
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

//: 以下示例定义了两种用于基于骰子的棋盘游戏的协议：
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

//: 这是最初在控制流中引入的蛇梯棋游戏的一个版本。该版本适用于掷骰子实例; 遵守DiceDice协议; 并通知GameDiceGameDelegate其进展情况：
class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        print(board)
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
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
        delegate?.gameDidEnd(self)
    }
}

//: 示例显示了一个名为DiceGameTracker的类，它遵守DiceGameDelegate协议：
class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

//: 这是DiceGameTracker看起来如何进行：
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

//: TextRepresentable的协议可以通过任何可以表示为文本的方式实现。这可能是对自身的描述，也可能是其当前状态的文本版本：
protocol TextRepresentable {
    var textualDescription: String { get }
}

//: Dice类可以扩展为遵守TextRepresentable协议：
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

//: Dice现在可以将任何实例视为TextRepresentable：
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

//: SnakesAndLadders游戏类可以扩展为遵守TextRepresentable协议：
extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}
print(game.textualDescription)

//: 以下扩展使Array实例TextRepresentable在存储符合的类型的元素时符合协议TextRepresentable。
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
let myDice = [d6, d12]
print(myDice.textualDescription)

//: 如果某个类型已经符合协议的所有要求，但尚未声明它遵守该协议，则可用遵守协议的空扩展：
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

//: Hamster现在可以在需要TextRepresentable类型的任何位置使用实例：
let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)

//: 协议可以用作要存储在诸如数组或字典之类的集合中的类型，如作为类型的协议中所述。这个例子创建了一个TextRepresentable数组：
let things: [TextRepresentable] = [game, d12, simonTheHamster]

//: 在可以迭代数组中的项，并打印每个项目的文本描述：
for thing in things {
    print(thing.textualDescription)
}

//: 以下是继承上述TextRepresentable协议的协议示例：
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

//: SnakesAndLadders类可扩展到遵守PrettyTextRepresentable：
extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

//: prettyTextualDescription属性现在可用于打印任何SnakesAndLadders实例的文本描述
print(game.prettyTextualDescription)

//: 这是一个将两个叫做Named和Aged的协议组合成一个函数参数需要的协议组合的示例：
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

//: 这是一个将前一个示例中的Named协议与Location类组合在一起的示例：
class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}
func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}
let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)

//: HasArea的协议，其中要求包含单个Double类型的gettable属性的属性area：
protocol HasArea {
    var area: Double { get }
}

//: Circle和Country，这两者都遵守HasArea协议：
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi*radius*radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

//: 这是一个名为Animal的类，它不遵守HasArea协议：
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

//: Circle、Country和Animal类没有共享的基类。尽管如此，但它们都是类，因此所有三种类型的实例都可用于初始化存储AnyObject类型值的数组：
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

//: 现在可以迭代objects数组，并且可以检查数组中的每个对象以查看它是否遵守HasArea协议：
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

//: 定义了一个叫做Counter的整数计数类，它使用外部数据源来提供增量。此数据源由CounterDataSource协议定义，该协议有两个可选要求：
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

//: Counter类具有CounterDataSource?类型的可选属性dataSource：
class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

//: 这是一个简单的CounterDataSource实现，其中数据源每次查询时返回常量值3。它通过实现可选fixedIncrement属性要求来实现：
class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

//: 可以使用ThreeSource实例作为新Counter实例的数据源：
var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

//: 这是一个更复杂的数据源TowardsZeroSource，它使Counter实例从其当前count值向上或向下计数到零：
class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

//: 现有可以使用TowardsZeroSourceCounter实例的实例从-4开始计数。一旦计数器达到零，就不再进行计数：
counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

//: RandomNumberGenerator可以扩展协议以提供一种randomBool()方法，该方法使用所需random()方法的结果来返回随机Bool值：
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

//: 通过在协议上创建扩展，所有符合类型的类型自动获得此方法实现，而无需任何其他修改。
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And here's a random Boolean: \(generator.randomBool())")

//: 继承TextRepresentable协议的PrettyTextRepresentable协议可以提供其必需的prettyTextualDescription属性的默认实现，以简单地返回访问textualDescription属性的结果：
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

//: 定义Collection协议的扩展，该扩展适用于其元素遵守Equatable协议的任何集合。通过将集合的元素约束到Equatable协议（标准库的一部分），可以使用==和!=运算符来检查两个元素之间的相等性和不相等。
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

//: 考虑两个整数数组，一个是所有元素都相同，另一个不是：
let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]

//: 因为数组遵守Collection并且Int遵守Equatable，equalNumbers和differentNumbers可以使用allEqual()方法：
print(equalNumbers.allEqual())
print(differentNumbers.allEqual())


//: [Previous](@previous)    [Next](@next)
