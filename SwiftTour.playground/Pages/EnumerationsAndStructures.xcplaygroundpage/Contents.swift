//: ## 枚举和结构
//: 用enum创建一个枚举。与类和所有其他命名类型一样，枚举可以具有与之关联的方法。
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

//: 默认情况下，Swift从0开始并每次递增1为枚举分配原始值，但可以通过显式指定值来更改此行为。还可以使用字符串或浮点数作为枚举的原始类型。使用该rawValue属性可以访问枚举实例的原始值。
//: 使用init?(rawValue:)初始化程序从原始值创建枚举的实例。它返回与原始值匹配的枚举，或者返回nil如果没有匹配的情况的话。
if let convertedRank = Rank(rawValue: 3) {
    print(convertedRank.simpleDescription())
}

//: 枚举的值是实际值，而不仅仅是编写其原始值的另一种方式。实际上，在没有有意义的原始值的情况下，不必提供原始值。
enum Suit {
    case spades, hearts, clubs, diamonds
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "黑桃"
        case .hearts:
            return "红心"
        case .clubs:
            return "梅花"
        case .diamonds:
            return "方块"
        }
    }
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
print(hearts.simpleDescription())

//: 如果枚举具有原始值，则这些值将作为声明的一部分确定，这意味着特定枚举实例的具有相同的原始值。再就是可以使值与案例相关联 - 这些值在创建实例时确定，并且对于枚举案例的每个实例它们可以不同。您可以将关联值视为与枚举案例实例的存储属性相似。
enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "7:00 pm")
let failure = ServerResponse.failure("Out of cheese")
switch success {
case let .result(sunrise, sunset):
    print("\(sunrise)太阳升起来啦，\(sunset)太阳下山了")
case let .failure(message):
    print("请求失败了，原因是：\(message)")
}


//: struct创建的结构。结构支持许多与类相同的行为，包括方法和初始化器，但是不能继承。结构和类之间最重要的区别之一是结构在代码中传递时总是被复制通过值传递，但类是通过引用传递的。
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "\(suit.simpleDescription())\(rank.simpleDescription())"
    }
}

//: [上一章](@previous)   [下一章](@next)
