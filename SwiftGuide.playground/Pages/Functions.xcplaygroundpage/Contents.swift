import Foundation

//: 参数名称前面编写参数标签，用空格分隔：
func someFunc(argumentLabel argumentName: Int) {
    print(argumentName)
}
someFunc(argumentLabel: 1)

//: 不想要参数的参数标签，请为该参数编写下划线（_）而不是显式参数标签:
func otherFunc(_ argumentName1: Int, argumentLabel2 argumentName2: Int) {
    print("\(argumentName1) + \(argumentName2) = \(argumentName1 + argumentName2)")
}
otherFunc(1, argumentLabel2: 2)

//: 在参数的类型之后为参数赋值来为函数中的任何参数定义默认值。如果定义了默认值，则可以在调用函数时省略该参数:
func defaultParameterFunc(argument1: Int = 1, argument2: Int) {
    print("\(argument1) + \(argument2) = \(argument1 + argument2)")
}
defaultParameterFunc(argument2: 3)
defaultParameterFunc(argument1: 2, argument2: 2)

//: 使用可变参数指定在调用函数时可以为参数传递不同数量的输入值。通过在参数的类型名称后面插入三个句点字符（...）来编写可变参数：
func variadicParameterFunc(nums: Int...) {
    let sum = nums.reduce(0) { (result, num) -> Int in
        return result + num
    }
    print("\(nums) 的和: \(sum)")
}
variadicParameterFunc(nums: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

//: 将inout关键字放在参数类型之前来编写输入输出参数。一个输入输出参数传递进函数的值，可以由函数修改并替换原来的值。
func inoutFunc(argument1: inout Int, argument2: inout Int) {
    let temp = argument1
    argument1 = argument2
    argument2 = temp
}
var inout1 = 1
var inout2 = 2
inoutFunc(argument1: &inout1, argument2: &inout2)
print("inout1: \(inout1), inout2: \(inout2)")

//: 像使用Swift中的任何其他类型一样使用函数类型。例如，可以将常量或变量定义为函数类型，并为该变量分配适当的函数：
func addInts(nums: [Int]) -> Int {
    return nums.reduce(0) { (result, item) -> Int in
        return result + item
    }
}
func multiplyInts(nums: [Int]) -> Int {
    return nums.reduce(1, { (result, item) -> Int in
        return result*item
    })
}
var mathFunc: ([Int]) -> Int = addInts(nums:)
print(mathFunc([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
mathFunc = multiplyInts(nums:)
print(mathFunc([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))

//: 可以使用函数类型，作为另一个函数的参数类型。这使得可以为函数调用者保留函数实现的某些方面，以便在调用函数时提供：
func printMathResult(mathFunc: ([Int]) -> Int, nums: Int...) {
    print("用参数\(nums)执行函数\(mathFunc)的结果是：\(mathFunc(nums))")
}
printMathResult(mathFunc: mathFunc, nums: 1, 2, 3, 4, 5)

func chooseFunc(addInts: Bool) -> ([Int]) -> Int {
    return addInts ? addInts(nums: ) : multiplyInts(nums:)
}
print(chooseFunc(addInts: true)([1, 2, 3, 4, 5]))

//: 在函数体内定义的函数称为嵌套函数，嵌套函数对外界是隐藏的，但它们的封闭函数仍然可以调用它们。封闭函数也可以返回其嵌套函数，以允许嵌套函数在另一个范围内使用：
func sumFunc() -> (Int...) -> Int {
    func sumInts(nums: Int...) -> Int {
        return nums.reduce(0) { (result, item) -> Int in
            result + item
        }
    }
    
    return sumInts(nums:)
}
print(sumFunc()(1, 2, 3, 4, 5))


//: [Previous](@previous)    [Next](@next)
