

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

//: findIndex(ofString:in:)函数返回一个可选Int值，该值将是数组中第一个匹配字符串的索引（如果已找到），或者找不到该字符串就返回nil：
func findIndex(ofString valueToFound: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFound {
            return index
        }
    }
    return nil
}

//: findIndex(ofString:in:)函数可用于在字符串数组中查找字符串值：
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

//: Equatable在定义函数时，将类型约束写为类型参数定义的一部分：
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

//: findIndex(of:in:)函数现在可以成功编译，并且可以与任何遵守Equatable协议的类型使用，例如：Double或String：
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

//: 一个名为Container的协议示例，它声明了一个名为Item的关联类型：
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//: 从上方的泛型类型的非泛型的版本IntStack，遵守Container协议：
struct IntStack: Container {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }

    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int { return items.count }
    subscript(i: Int) -> Int { return items[i] }
}

//: 可以使泛型Stack类型遵守Container协议：
struct Stack<Element>: Container {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }

    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

//: 使用空扩展名执行此操作，如使用扩展名声明协议采用中所述：
extension Array: Container { }

//: 定义了一个版本Container要求容器中的项遵守equatable协议
//protocol Container {
//    associatedtype Item: Equatable
//    mutating func append(_ item: Item)
//    var count: Item { get }
//    subscript(i: Int) -> Item { get }
//}

//: 改善的Container协议，增加了suffix(_:)方法的要求。suffix(_:)方法从容器的末尾返回给定数量的元素，并将它们存储在Suffix类型的实例中：
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

//: Stack类型扩展，它增加了遵守SuffixableContainer协议：
extension Stack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        for index in count - size..<count {
            result.push(self[index])
        }
        
        return result
    }
}
var stackOfInts = Stack<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)

//: 遵守SuffixableContainer协议的非泛型类型IntStack的扩展，使用Stack<Int>作为suffix类型代替IntStack：
extension IntStack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack<Int> {
        var result = Stack<Int>()
        for index in count - size..<count {
            result.push(self[index])
        }
        
        return result
    }
}

//: 通过类型约束和泛型where子句组合表示：
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    if someContainer.count != anotherContainer.count {
        return false
    }
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

//: allItemsMatch(_:_:)函数的实际运行方式：
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
var arrayOfStrings = ["uno", "dos", "tres"]
if allItemsMatch(stackOfStrings, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}

//: 扩展了前面示例中的Stack泛型结构以添加isTop(_:)方法：
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        
        return topItem == item
    }
}

//: isTop(_:)方法的实际应用方式：
if stackOfStrings.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}

//: 在其元素不相等的栈上调用isTop(_:)方法，则会出现编译时错误：
struct NotEquatable { }
var notEquatableStack = Stack<NotEquatable>()
let notEquatableValue = NotEquatable()
notEquatableStack.push(notEquatableValue)
//notEquatableStack.isTop(notEquatableValue) // 错误

//: 下面的示例扩展了前面示例中的Container协议以添加startsWith(_:)方法：
extension Container where Item: Equatable {
    func startWith(_ item: Item) -> Bool {
        return count >= 1 && item == self[0]
    }
}

//: 只要容器的项是可比较的，这个新startsWith(_:)方法可以用于符合Container协议的任何类型，包括上面使用的堆栈和数组：
if [9, 9, 9].startWith(42) {
    print("Starts with 42.")
} else {
    print("Starts with something else.")
}

//: 上例中的泛型where子句要求Item符合协议，但也可以编写特定Item类型的泛型where子句。例如：
extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        
        return sum / Double(count)
    }
}

//: 要创建Container包含迭代器的版本，就像使用Sequence协议在标准库中的那样：
protocol ContainerA {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(_ index: Int) -> Item { get }
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

//: 以下代码声明了一个ComparableContainer需要Item符合以下内容的Comparable协议：
protocol ComparableContainer: Container where Item: Comparable { }

//: 下标可以是泛型的，也可以包含泛型where子句。在subscript之后的尖括号内写入占位符类型名称，并在下标主体的左大括号前写一个泛型where子句。例如：
extension ContainerA {
    subscript<Indices: Sequence>(indices: Indices) -> [Item] where Indices.Iterator.Element == Int {
        var result = [Item]()
        for index in indices {
            result.append(self[index])
        }
        
        return result
    }
}


//: [Previous](@previous)    [Next](@next)
