//: ## 函数和闭包
//: 使用func声明函数。通过在括号中使用参数列表跟随其名称来调用函数。使用->的参数名称和类型与函数的返回类型分开。
func greet(person: String, day: String) -> String {
    return "你好 \(person)，今天是\(day)"
}
print(greet(person: "张三", day: "星期四"))

//: 默认情况下，函数使用其参数名称作为其参数的标签。在参数名称前写入自定义参数标签，或者写入_不使用参数标签。
func greetOther(_ person: String, on day: String) -> String {
    return "你好 \(person)，今天是\(day)"
}
print(greetOther("李四", on: "星期五"))

//: 使用元组创建复合值 - 例如，从函数返回多个值。元组的元素可以通过名称或数字来引用。
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score < min {
            min = score
        } else {
            max = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
print(calculateStatistics(scores: [1, 2, 5, 19]))

//: 函数可以嵌套。嵌套函数可以访问外部函数中声明的变量。您可以使用嵌套函数来组织长或复杂函数中的代码。
func returnFifteen() -> Int {
    var y = 10
    func add() -> Int {
        return y + 5
    }
    add()
    
    return y
}
print(returnFifteen())

//: 函数可以返回另一个函数作为其返回值
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return number + 1
    }
    
    return addOne
}
print(makeIncrementer()(7))

//: 函数可以将另一个函数作为其参数之一
func hasAnyMatches(list: [Int], condition: ((Int) -> Bool)) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

var numbers = [1, 2, 3, 4]
hasAnyMatches(list: numbers) { (p: Int) -> Bool in
    return p > 5
}

//: 函数实际上是闭包的一种特殊情况：可以在以后调用的代码块。闭包中的代码可以访问创建闭包的作用域中可用的变量和函数，即使闭包在不同作用域执行。使用大括号（{}）来编写没有名称的闭包。使用in分离的参数、返回类型与闭包体。
numbers.map { (number: Int) -> Int in
    return 3*number
}

//: 可以通过几种方式更简洁地编写闭包。当已知闭包的类型（例如委托的回调）时，可以省略其参数的类型，返回类型或两者。单个语句闭包隐式返回其唯一语句的值。
numbers.map({number in number*3 })
numbers.map{number in number*3 }

//: 可以按编号而不是按名称来引用参数 - 这种方法在非常短的闭包中特别有用。作为函数的最后一个参数传递的闭包可以在括号后面立即出现。当闭包是函数的唯一参数时，可以完全省略括号。
numbers.sort { $0 > $1 }

//: [上一章](@previous)   [下一章](@next)
