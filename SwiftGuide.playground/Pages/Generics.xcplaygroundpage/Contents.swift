

import Foundation

//: 这是一个标准的非泛型函数swapTwoInts(_:_:)，它可以交换两个Int值：
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//: swapTwoInts(_:_:)函数交换b的原始值为a和a的原始值为b。可以调用此函数来交换两个Int变量中的值：
//var someInt = 3
//var anotherInt = 107
//swapTwoInts(&someInt, &anotherInt)
//print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//: swapTwoInts(_:_:)函数很有用，但它只能与Int值一起使用。如果要交换两个String值或两个Double值，则必须编写更多函数，例如下面显示的swapTwoStrings(_:_:)和swapTwoDoubles(_:_:)函数：
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}
func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//: 泛型函数可以使用任何类型。这是上面swapTwoInts(_:_:)函数的泛型版本，称为swapTwoValues(_:_:)：
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//: 在下面的两个例子中，T分别被推断为Int和String：
var someInt = 3
var anotherInt = 97
swapTwoValues(&someInt, &anotherInt)
var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

//: 以下是如何编写栈的非泛型版本，在本例中为一Int值的栈：
//struct IntStack {
//    var items = [Int]()
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//}

//: 这是相同代码的泛型版本：
//struct Stack<Element> {
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//}

//: Stack通过在尖括号内写入要存储在栈中的类型来创建新实例。例如，要创建新的字符串栈，编写Stack<String>()：
//var stackOfStrings = Stack<String>()
//stackOfStrings.push("uno")
//stackOfStrings.push("dos")
//stackOfStrings.push("tres")
//stackOfStrings.push("cuatro")

//: 从栈中弹出一个值会删除并返回栈顶值，"cuatro"：
//let fromTheTop = stackOfStrings.pop()

//: 下面的示例扩展泛型Stack类型以添加一个只读的计算属性topItem，该属性返回栈顶部项而不从栈中弹出它：
//extension Stack {
//    var topItem: Element? {
//        return items.isEmpty ? nil : items[items.count - 1]
//    }
//}

//: topItem计算属性可以与任何Stack实例一起使用，以访问和查询栈顶而不删除它。
//if let topItem = stackOfStrings.topItem {
//    print("The top item on the stack is \(topItem).")
//}

func findIndex(ofString valueToFound: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFound {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

//protocol Container {
//    associatedtype Item
//    mutating func append(_ item: Item)
//    var count: Int { get }
//    subscript(i: Int) -> Item { get }
//}

//struct IntStack: Container {
//    var items = [Int]()
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//
//    typealias Item = Int
//    mutating func append(_ item: Int) {
//        self.push(item)
//    }
//    var count: Int { return items.count }
//    subscript(i: Int) -> Int { return items[i] }
//}

//struct Stack<Element>: Container {
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//
//    mutating func append(_ item: Element) {
//        self.push(item)
//    }
//    var count: Int {
//        return items.count
//    }
//    subscript(i: Int) -> Element {
//        return items[i]
//    }
//}

//extension Array: Container { }

protocol Container {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Item { get }
    subscript(i: Int) -> Item { get }
}


//: [Previous](@previous)    [Next](@next)
