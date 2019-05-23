

import Foundation

//: Bank游戏中只能有一个，因此Bank被实现为具有类型属性和方法的类来存储和管理其当前状态：
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

//: Player类描述了游戏中的玩家。每个玩家在任何时候都有一定数量的硬币存放在他们的钱包里。这由玩家的coinsInPurse财产代表：
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

//: 这里使用可选变量，因为玩家可以随时离开游戏。可选项可跟踪游戏中当前是否有玩家：
var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")

//: 因为playerOne它是可选的，当访问其coinsInPurse属性以打印其默认硬币数时，调用win(coins:)方法时，都会被感叹号（!）限定：
playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("The bank now only has \(Bank.coinsInBank) coins left")

//: 通过将可选playerOne变量设置为nil表示“无Player实例” 来指示。在发生这种情况时，playerOne变量对Player实例的引用被破坏。没有其他属性或变量仍然引用该Player实例，因此它被释放以释放其内存。就在这种情况发生之前，它的自动调节器会自动调用，并将其硬币返还给银行：
playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")


//: [Previous](@previous)    [Next](@next)
