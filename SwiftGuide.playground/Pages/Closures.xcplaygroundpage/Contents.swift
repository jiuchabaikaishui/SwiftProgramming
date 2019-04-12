import Foundation

var intArray = [7, 1, 4, 5, 9, 10, 6, 3, 8, 2]
//: 闭包的主体的开头由in关键字引入。这个关键字表示闭包的参数和返回类型的定义已经完成，闭包的主体开始：
//intArray.sort(by: { (a, b) -> Bool in
//    return a < b
//})

//: Swift可以推断出它的参数类型以及它返回的值的类型，所以也可以省略返回箭头（->）和参数名称周围的括号：
//intArray.sort(by: { a, b in
//    return a < b
//})

//: 单表达式闭包可以省略return关键字来隐式返回单个表达式的结果：
//intArray.sort(by: { a, b in
//    a < b
//})

//: 在闭包表达式中使用这些简写参数名称，则可以从其定义中省略闭包的参数列表，并且将从期望的函数类型推断缩写参数名称的数量和类型。in关键字也可以被省略，因为闭包表达是由完全其自身的：
//intArray.sort(by: { $0 < $1 })

//: 有一种更短的方式来编写闭包表达式，Swift将小于运算符实现为具有两个Int类型的参数的方法，并返回Bool类型值。这与sorted(by:)方法所需要的参数类型是相符合的，所以可以简单的使用一个小于符号，Swift将推断出其实现：
//intArray.sort(by: <)

//: 在函数调用的括号之后写入尾随闭包，即使它仍然是函数的参数。使用尾随闭包语法时，不要将闭包的参数标签写为函数调用的一部分。
//intArray.sort() <

//: 提供闭包表达式作为函数或方法的唯一参数，并且将该表达式作为尾随闭包提供，则在调用函数时，不需要在函数或方法的名称后面写一对括号()：
intArray.sort { $0 < $1 }
print(intArray)

//: 嵌套函数可以捕获其外部函数的任何参数，还可以捕获外部函数中定义的任何常量和变量：
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementer() -> Int {
        runningTotal += amount
        
        return runningTotal
    }
    
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())
print(incrementBySeven())

//: 将函数或闭包赋值给常量或变量，实际上都是将该常量或变量设置为对函数或闭包的引用。也意味着如果为两个不同的常量或变量分配闭包，那么这两个常量或变量都引用相同的闭包：
let otherIncrementByTen = incrementByTen
print(otherIncrementByTen())
print(otherIncrementByTen())

//: 在参数的类型之前写入@escaping，以指示允许闭包逃逸。逃逸闭包的一种方法是存储在函数外部定义的变量中：
var completions = [() -> Void]()
func escapingClosureFunc(completion: @escaping () -> Void) {
    completions.append(completion)
}

//: 逃逸闭包是指当闭包作为参数传递给函数，但在函数返回之后被调用的闭包。逃逸闭包需要显式的引用self：
func nonescapingClosureFunc(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 0
    func someThing() {
        escapingClosureFunc {
            self.x = 100
        }
        nonescapingClosureFunc {
            x = 200
        }
    }
}
let instance = SomeClass()
instance.someThing()
print(instance.x)
completions.first!()
print(instance.x)

//: autoclosure允许延迟执行，因为在调用闭包之前，内部代码不会运行：
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
func autoclosureFunc(closure: @escaping @autoclosure () -> Int) -> () -> Int {
    return closure
}
print(array.count)
let closure = autoclosureFunc(closure: array.removeFirst())
print(array.count)
closure()
print(array.count)


//: [Previous](@previous)    [Next](@next)
