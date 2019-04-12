
import Foundation

//: 使用for-in循环迭代序列，比如数组的中的项、数字范围、字符串中的字符：
let names = ["张三", "李四", "王五", "赵六"]
for name in names {
    print(name)
}
for i in 0...1 {
    print(i)
}
for c in "abc" {
    print(c)
}

//: 迭代字典反问键值对：
let scores = ["张三": 97, "李四": 85, "王五": 76, "赵六": 94]
for (name, score) in scores {
    print("\(name): \(score)")
}

//: 不需要序列中的值可以使用_来忽略：
for _ in 0...1 {
    print("----------")
}

//: 使用stride(from:to:by:)、stride(from:through:by:)能跳过不需要的标记：
for i in stride(from: 0, to: 10, by: 5) {
    print(i)
}
for i in stride(from: 0, through: 10, by: 5) {
    print(i)
}


/*:
 while循环一直执行知道条件为false，适合在不知道迭代次数的情况下使用，Swift提供了如下两种while循环：
 - while每次循环开始时判断条件
 - repeat-while每次循环结束后判断条件
 */
var i = 0
while i < 1 {
    print(i)
    i += 1
}
repeat {
    print(i)
    i -= 1
} while i > 0

//: switch语句只要一个匹配的情况完成，整个switch语句就完成了，因此不需要使用break来避免错误的执行多个分支：
let c = "a"
switch c {
case "a":
    print(c)
default:
    print("其他字符")
}

//: switch可以检查案例中的值是否包含在间隔中：
let speed = 50
switch speed {
case 0...60:
    print("低速")
case 60..<90:
    print("中速")
case 90...:
    print("高速")
default:
    break
}

//: 可以使用元组在Swift语句中测试多个值。使用(_)来匹配任何可能的值：
let point = (1, 1)
switch point {
case (0, 0):
    print("原点")
case (_, 0):
    print("X轴")
case (0, _):
    print("Y轴")
default:
    break
}

//: 一个switch分支下可以将其值命名为常量或者变量，此行为称为值绑定：
switch point {
case (let x, 0):
    print("x轴：\(x)")
case (0, let y):
    print("y轴：\(y)")
default:
    break
}

//: switch语句可以通过where来添加附加条件：
switch point {
case (let x, let y) where x == y:
    print("在直线y = x上")
default:
    break
}

//: 复合案例
switch c {
case "a", "e", "i", "o", "u":
    print("元音")
default:
    break
}
switch point {
case (let distance, 0), (0, let distance):
    print("坐标轴距原点：\(distance)")
default:
    print("非坐标轴")
}

//: 使用带语句标签的break来结束带标签语句的执行。使用循环语句可以使用带有语句标签的break或者continue语句来结束或继续执行带标签的语句:
a: for i in 1...10 {
    b: for j in 1...10 {
        if (i == 1 && j == 2) {
            break a
        }
        print("(\(i), \(j))")
    }
}

//: guard语句，像if语句。与if语句不同，guard语句总是有一个else子句 - 如果条件不为真，则执行else子句中的代码:
func optionValue() {
    let i: Int? = 1
    guard let c = i else {
        print("-----------")
        return
    }
    
    print("\(c)")
}
optionValue()

//: 可用性条件采用平台名称和版本的列表。您可以使用平台的名称，如iOS，macOS，watchOS，和tvOS:
if #available(iOS 10, macOS 10.12, *) {
    
} else {
    
}



//: [Previous](@previous)    [Next](@next)
