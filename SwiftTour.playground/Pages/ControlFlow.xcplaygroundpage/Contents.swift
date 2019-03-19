//: ## 控制流
//: 使用if和switch制作条件语句和使用for- in，while和repeat- while进行循环。条件或循环变量周围的小括号是可选的，身体周围的大括号是必需的。
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
//: 在if语句中，条件必须是布尔表达式 - 这意味着代码例如if score { ... }是错误的。
//for score in individualScores {
//    if score {//('Int' is not convertible to 'Bool')
//        teamScore += 2
//    }
//}

//: 类型后面写一个问号，将值标记为可选。可选值包含值或包含nil，ke以使用if和let一起处理可能缺少的值。
var optionalString: String? = "你好"
print(optionalString == nil)

var optionalName: String? = "张三"
var greeting = "你好！"
if let name = optionalName {
    print("你好, \(name)")
} else {
    print("不存在这个人")
}
//: 如果是可选值nil，则条件为false执行else中的代码。否则，将解包可选值并将其分配给let常量，成为在代码块内可用的展开值。

//: 处理可选值的另一种方法是使用??运算符提供默认值。如果缺少可选值，则使用默认值。
let nickName: String? = nil
let fullName = "张三"
let informalGreeting = "你好，\(nickName ?? fullName)"

//: Switches支持任何类型的数据和各种各样的比较操作
let vegetable = "辣椒"
switch vegetable {
case "土豆":
    print("今天吃土豆丝")
case "辣椒", "肉":
    print("今天吃辣椒炒肉")
case let x where x.hasPrefix("剁")://注意可以使用let where将匹配条件的值赋给常量
    print("剁辣椒很辣的")
default:
    print("今天没吃东西")
}
//: 如果移除default分支，会得到错误：Switch must be exhaustive（Switch语句必须是完整的）
//: switch case中执行代码后，程序退出switch语句。不会继续执行下一种情况，因此不需要在每个案例代码的末尾添加break

//: 如果移除default分支，会得到错误：Switch must be exhaustive（Switch语句必须是完整的）
//: switch case中执行代码后，程序退出switch语句。不会继续执行下一种情况，因此不需要在每个案例代码的末尾添加break

//: 可以使用for- in通过提供一对放在（）中用于表示每个键值对的名称来迭代字典中的项目。字典是无序集合，因此它们的键和值以任意顺序迭代。
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 9, 11],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var name = ""
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            name = kind
            largest = number
        }
    }
}
print("最大的数在\(name)中，最大数为\(largest)")

//: 使用while可以循环一个代码块直到条件不成立。也可以用repeat {} while 形式将条件放在后面，来确保循环体至少被执行一次
var n = 2
while n < 2 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 2
print(m)

//: 使用..<表示范围内
var total = 0
for index in 0..<4 {
    total += index
}
print(total)
//: 使用...表示包涵的所有范围
total = 0
for index in 0...10 {
    total += index
}
print(total)

//: [上一章](@previous)   [下一章](@next)


