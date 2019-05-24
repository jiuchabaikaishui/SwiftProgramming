

import Foundation


//: 以下是如何表示在游戏中自动售货机操作错误的条件：
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

//: 抛出一个错误，表示自动售货机需要五个额外的硬币：
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//: VendingMachine类具有一个vend(itemNamed:)方法，VendingMachineError如果售卖的物品不存在，缺货或花费超过当前输入的金额，则抛出适当的方法：
struct Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemName name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

//: buyFavoriteSnack(person:vendingMachine:)也是一个Throwing函数，并且该vend(itemNamed:)方法抛出的任何错误都将传播到buyFavoriteSnack(person:vendingMachine:)调用函数的位置：
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemName: snackName)
}

//: PurchasedSnack结构的初始化程序将Throwing函数作为初始化过程的一部分调用，它通过将它们传播给调用者来处理它遇到的任何错误：
struct PurchasedSnack {
    var name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemName: name)
        self.name = name
    }
}

//: 匹配VendingMachineError枚举的所有三种情况：
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Invalid Selection.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}

//: 调用函数捕获任何VendingMachineError错误：
func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemName: item)
    } catch is VendingMachineError {
        print("Invalid selection, out of stock, or not enough money.")
    }
}
do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}


//: [Previous](@previous)    [Next](@next)
