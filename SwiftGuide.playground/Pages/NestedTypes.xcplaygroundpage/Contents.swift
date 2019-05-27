

import Foundation

//: 在二十一点中，Ace牌的值为一或十一。此功能由一个名为Values的结构表示，该结构嵌套在Rank枚举中：
struct BlackjackCard {
    enum Suit: Character {
        case spades = "♠️", hearts = "♥️", clubs = "♣️", diamonds = "♦️"
    }
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

//: 因为BlackjackCard是没有自定义初始值设定项的结构，所以它具有隐式成员初始值设定项，如结构类型的成员初始值设定项中所述。可以使用此初始化程序初始化一个名为theAceOfSpades的新常量：
let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")

//: 要在定义上下文之外使用嵌套类型，请在其名称前面加上嵌套在其中的类型的名称：
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
print(heartsSymbol)


//: [Previous](@previous)    [Next](@next)
