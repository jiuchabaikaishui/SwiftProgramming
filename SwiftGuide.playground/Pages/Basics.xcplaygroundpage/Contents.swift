//: # 基础
/*:
 Swift是iOS，macOS，watchOS和tvOS应用程序开发的新编程语言。尽管如此，Swift的许多部分对在C和Objective-C中有开发经验的都很熟悉。

 Swift包含了 C 和 Objective-C 上所有基础数据类型，包括Int为整数，Double和Float为浮点值，Bool为布尔值，String为文本数据。Swift还提供了三种强大的集合类型的Array，Set和Dictionary。

 与C一样，Swift使用变量来存储和通过标识名称引用值。Swift还广泛使用其值无法更改的变量，这些被称为常量，并且比C中的常量更强大。在 Swift 中，当使用不需要更改的值时，那使用常量可以让你的代码更加安全并且更清晰地表达你的意图。

 除了熟悉的类型之外，Swift还引入了Objective-C中没有的高级类型，例如元组。元组可以创建和传递值的分组，可以使用元组将函数中的多个值作为单个复合值返回。

 Swift还引入了可选类型，用于处理值缺失的情况。可选类型要么“有是一个值，它等于X ”要么“有没有一个价值可言”。使用optionals类似于nil在Objective-C中使用指针，但它们适用于任何类型，而不仅仅是类。可选类型对象比Objective-C中的nil指针更安全，更具表现力，它们是许多Swift强大功能的核心。

 Swift是一种类型安全的语言，这意味着该语言可以帮助您清楚代码可以使用的值的类型。如果部分代码需要一个 String，则类型安全会阻止把Int错误地传递它。同样，类型安全性可防止意外地将可选类型的String传递给需要非可选类型的String的代码。类型安全性可帮助在开发过程中尽早捕获并修复错误。
 */



//: ## 变量和常量
//: 常量和变量将名称相关联。常量的值一旦设置就不能更改，而变量可以在将来设置为不同的值。


//: ### 声明常量和变量
//: 常量和变量必须在使用之前声明。使用let关键字声明常量，使用var关键字声明变量。
let  maximumNumberOfLoginAttempts = 10
var  currentLoginAttempt = 0

//: 可以在一行上声明多个常量或多个变量，用逗号分隔：
var x = 0.0, y = 0.0, z = 0.0


//: ### 类型注释
//: 声明常量或变量时，可以提供类型注释，以清楚常量或变量可以存储的值的类型。通过在常量或变量名称后面放置冒号，后跟空格，后跟要使用的类型的名称来编写类型注释。
var welcomeMessage: String
welcomeMessage = "hello"

//: 可以在一行定义相同类型的多个相关变量（以逗号分隔），在最终变量名称后面使用单个类型注释：
var red, green, blue: Double

//: 注意
//: 很少需要在实践中编写类型注释。如果在定义的点处为常量或变量提供初始值，则Swift可以推断出用于该常量或变量的类型，如类型安全和类型推断中所述。在上面的示例中，welcomeMessage没有提供初始值，因此welcomeMessage使用类型注释指定变量的类型，而不是从初始值推断。


//: ### 命名常量和变量
//: 常量和变量名称几乎可以包含任何字符，包括Unicode字符：
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

//: 常量和变量名称不能包含空格字符，数学符号，箭头，专用（或无效）Unicode代码点、行和框绘制字符。也不能以数字开头，但是数字可能包含在名称的其他地方。

//: 一旦声明了某个类型的常量或变量，就不能再使用相同的名称声明，或者将其更改为存储不同类型的值。也不能将常量变为变量或变量变为常量。

//: 注意
//: 如果你需要使用与 Swift 保留关键字相同的名称作为常量或者变量名，你可以使用反引号（`）将关键字包围的方式将其作为名字使用。无论如何，你应当避免使用关键字作为常量或变量名，除非你别无选择。


//: ### 打印常量和变量
//: 可以使用以下print(_:separator:terminator:)函数打印常量或变量的当前值：

//: 该print(_:separator:terminator:)函数是一个全局函数，它将一个或多个值输出到适当的输出。例如，在Xcode中，print(_:separator:terminator:)函数在Xcode的“控制台”窗格中打印其输出。该separator和terminator参数都有默认值，所以当调用这个函数时，可以忽略它们。

//: Swift使用字符串插值将常量或变量的名称包含在较长字符串中作为占位符，并提示Swift将其替换为该常量或变量的当前值。将名称包含在括号中，并在左括号前用反斜杠转义：
print("value:\(welcomeMessage)")


//: ## 注释
//: 使用注释在代码中包含不可执行文本，作为自己的注释或提醒。编译代码时，Swift编译器会忽略注释。
//: Swift中的注释与C中的注释非常相似。单行注释以两个正斜杠开头（//）：
//这是注释。

//: 多行注释以正斜杠开头，后跟星号（/*），并以星号后跟正斜杠（*/）结束：
/* 这也是一个注释
但写的是多行。*/

//: 与C中的多行注释不同，Swift中的多行注释可以嵌套在其他多行注释中。您可以通过启动多行注释块然后在第一个块中开始第二个多行注释来编写嵌套注释。然后关闭第二个块，然后是第一个块：*/
/* 这是第一个多行注释的开始。
 /* 这是第二个嵌套的多行注释。 */
 这是第一个多行注释的结束。 */


//: ## 分号
//: 与许多其他语言不同，Swift不要求在代码中的每个语句之后编写分号（;），但如果愿意，也可以这样做。但是，如果要在一行上写多个单独的语句，则需要使用分号：
let cat = "🐱"; print(cat)


//: ## 整型
//: 整数是没有小数分量的，Swift提供8,16,32和64位格式的有符号和无符号整数。

//: ### 整数界限
//: 可以用min、max来访问每个整数类型的最小值和最大值特性：
let minValue = UInt8.min// minValue等于0，类型为UInt8
let maxValue = UInt8.max// maxValue等于255，类型为UInt8


//: ### Int
/*: 在大多数情况下，无需在代码中使用的特定大小的整数。Swift提供了一个额外的整数类型Int，它与当前平台的本机字大小相同：
_ 在32位平台上，Int大小与之相同Int32。
_ 在64位平台上，Int大小与Int64。
 
除非需要使用特定大小的整数，否则请始终在代码中使用Int整数值。这有助于代码一致性和操作性。即使在32位平台上，Int也可以在-2,147,483,648和2,147,483,647之间存储任何值，并且对于许多整数范围来说足够大。*/


//: ### UInt
//: Swift还提供无符号整数类型，UInt其大小与当前平台的本机字大小相同。


//: ## 浮点数
/*: 浮点数是具有小数部分的数，Swift提供了两种带符号的浮点数类型：
 _ Double 表示64位浮点数。
 _ Float 表示32位浮点数
*/


//: ## 类型安全和类型推断
/*
 Swift是一种类型安全的语言。类型安全语言鼓励您清楚代码可以使用的值的类型。如果你的部分代码需要String，你就不能Int错误地传递它。
 
 因为Swift是类型安全的，所以它在编译代码时执行类型检查，并将任何不匹配的类型标记为错误。这使您可以在开发过程中尽早捕获并修复错误。
 
 当您使用不同类型的值时，类型检查可帮助您避免错误。但是，这并不意味着您必须指定您声明的每个常量和变量的类型。如果未指定所需的值类型，Swift将使用类型推断来计算出适当的类型。类型推断使编译器能够在编译代码时自动推断出特定表达式的类型，只需检查您提供的值即可。
 
 浮点文字指定类型，Swift会推断为Double
 整数和浮点数组合表达式，Swift会推断为Double
 */
let meaningOfLife = 42//Int
let pi = 3.14//Double
let otherPi = 3 + 0.14//Double


//: ## 数值型字面量
/*
 整数字面量可以写成：
 
 _ 十进制数，无前缀
 _ 二进制数，有0b前缀
 _ 八进制数，有0o前缀
 _ 十六进制数，有0x前缀
 */
let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17

/*
 浮点进制可以是十进制（没有前缀）或十六进制（带0x前缀）。它们必须始终在小数点的两边都有一个数字（或十六进制数字）。十进制浮点数也可以有一个可选的指数，用大写或小写表示e; 十六进制浮点数必须有一个指数，用大写或小写表示p
 
 对于指数为的十进制数exp，基数乘以10 exp：
 
 1.25e2表示1.25 x 10 2，或125.0。
 1.25e-2表示1.25 x 10 -2，或0.0125。
 对于指数为16的十六进制数exp，基数乘以2 exp：
 
 0xFp2指15 x 2 2，或60.0。
 0xFp-2表示15 x 2 -2，或3.75。
 */
let dDouble = 12.3
let eDouble = 1.23e1
let xDouble = 0xc.23p0

//: 整数和浮点数都可以用额外的零填充，并且可以包含下划线以帮助提高可读性。这两种格式都不会影响文字的基础值：
let pDouble = 000123.456
let million = 1_000_000
let overMillion = 1_000_000.000_000_1

//: ## 数字类型转换
//: ### 整数转换
/*
 每种数字类型，可以存储在整数常量或变量中的数字范围是不同的。在编译代码时，超出数据类型大小的常量或变量报错。
 
 SomeType(ofInitialValue)是调用Swift类型的初始值设定项并传入初始值的默认方式
 */
//let couldBeNegative: UInt8 = -1//UInt8无法存储负数
//let tooBig: UInt8 = UInt8.max + 1//Int8无法存储大于其最大值的数字
let oneN: UInt8 = 1
let otherN: UInt16 = 2000
let sumN: UInt16 = UInt16(oneN) + otherN

//: ### 整数和浮点转换
//: 必须明确表示整数和浮点数字类型之间的转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
let myPi = Double(three) + pointOneFourOneFiveNine
let intPi = Int(myPi)


//: ## 键入别名
//: 类型别名定义现有类型的备用名称。使用typealias关键字定义类型别名。
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.max
print(maxAmplitudeFound)

//: 布尔值
//: 布尔值被称为逻辑，因为它们只能是true或false。
let orangesAreOrange = true
let turnipsAreDelicious = false
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible")
}
let i = 1
//if i {
//
//}
if i == 1 {
    
}


//: ## 元组
/*
 元组将多个值分组为单个复合值。元组中的值可以是任何类型，并且不必彼此具有相同的类型。
 可以将元组的内容分解为单独的常量或变量，然后像往常一样访问它们。
 分解元组时忽略元组的_部分。
 从零开始的索引号访问元组中的各个元素值。
 在元组中命名元素，则可以使用元素名称来访问这些元素的值。
 可以在定义元组的时候给单个元素命名，给元组中的元素命名后，你可以通过名字来获取这些元素的值。
 */
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("code:\(statusCode)")
print("message:\(statusMessage)")
let (code, _) = http404Error
print("code:\(code)")
print("code:\(http404Error.0), message:\(http404Error.1)")
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")


//: ## 可选值
/*
 可选的代表两种可能性：要么有是一个值，可以解开可选的访问值，或者没有价值可言。
 可选变量默认为nil。
 */
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)// 可选的Int

// 可以给可选变量赋值为 nil 来表示它没有值：
var serverResponseCode: Int? = 404
// serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil
// serverResponseCode 现在不包含值

// 如果声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil：
var surveyAnswer: String?
// surveyAnswer 被自动设置为 nil

//: ### 解包
/*
 _ 使用if语句通过比较可选项来查找可选项是否包含值nil。使用“等于”运算符（==）或“不等于”运算符（!=）执行此比较。
 _ 通过在可选项名称的末尾添加感叹号（!）来访问其基础值。感叹号说明：“这个选项肯定有价值。“，这被称为强制解包可选的值。
 尝试使用!访问不存在的可选值会触发运行时错误。在使用!强制解包其值之前，请务必确保可选项包含值。
 */
if convertedNumber == nil {
    print("没有值")
} else {
    print("\(convertedNumber!)")
}

//: ### 可选绑定
//: 使用可选绑定来确定可选项是否包含值，如果是，则使该值可用作临时常量或变量。可选绑定可与if和while语句一起使用，以检查可选内部的值，并将该值提取为常量或变量，作为单个操作的一部分。
if let actualNumber = Int(possibleNumber) {
    print(actualNumber)
} else {
    print("没有值")
}
if let firstNumber = Int("4"), let secondNumber = Int("42") {
    print("firstNumber:\(firstNumber), secondNumber:\(secondNumber)")
}

//: ### 隐式解包可选值
//: 通过在要使其成为可选的类型之后放置感叹号来编写隐式解包的可选值。
//: 隐式解包的可选值是常规可选项，但也可以像非可选值一样使用，而无需在每次访问时解包可选值。
let possibleString: String? = "可选字符串"
let forcedString: String = possibleString!
let assumeString: String! = "隐式解包字符串"
let implicitString: String = assumeString
if assumeString != nil {
    print(assumeString)
}
if let definiteString = assumeString {
    print(definiteString)
}

/*
 仍然可以把隐式解析可选类型当做普通可选类型来判断它是否包含值：
 也可以在可选绑定中使用隐式解析可选类型来检查并解析它的值：
 */
if assumeString != nil {
    print(assumeString!)
}
if let definiteString = assumeString {
    print(definiteString)
}


//: ## 错误处理
/*
 使用错误处理来响应程序在执行期间可能遇到的错误情况。与可以使用值的存在或不存在来传递函数成功或失败的选项相比，错误处理允许您确定失败的根本原因，并在必要时将错误传播到程序的另一部分。
 通过在其声明中包含关键字throws来声明函数表示它可以引发错误。当调用可以抛出错误的函数时，请将try关键字添加到表达式中。
 
 Swift会自动将错误传播出当前作用域，直到它们被catch子句处理。
 一个do语句创建一个新的包含范围，允许误差传播到一个或多个catch子句。
 */
func canThrowAnError() throws {
    // 此函数可能会引发错误
}
do {
    try canThrowAnError()
    // 没有抛出任何错误
} catch {
    // 抛出了一个错误
}
enum SandwichError: Error {
    case outOfCleanDishes
    case missingIngredients
}
func makeSandwich() throws {
    // ……
}
do {
    try makeSandwich()
} catch SandwichError.outOfCleanDishes {
    
} catch SandwichError.missingIngredients {
    
}

//: ## 断言和条件
/*
 断言和条件是在运行时发生的检查。在执行任何进一步的代码之前，可以使用它们来确保满足基本条件。如果断言或条件中的布尔条件求值为true，则代码执行将照常继续。如果条件为false，则程序的当前状态无效; 代码执行结束，您的应用程序终止。断言和前置条件不用于可恢复或预期的错误。因为失败的断言或条件表明程序状态无效，所以无法捕获失败。
 断言和条件之间的区别在于它们的检查时间：仅在调试版本中检查断言，但在调试和生成版本中都会检查前置条件。在生产版本中，不会评估断言中的条件。这意味着您可以在开发过程中使用任意数量的断言，而不会影响生产中的性能。
 */

//: ### 使用断言进行调试
/*
 可以通过从Swift标准库中调用assert(_:_:file:line:)函数来编写断言。将一个表达式传递给此函数，该表达式求值为true或者false，如果条件的结果为false，则显示一条消息。
 也可以省略断言消息
 如果代码已经检查了条件，则使用该assertionFailure(_:file:line:)函数指示断言失败。
 */
let age = 3
assert(age > 0, "年龄不能小于0")
assert(age > 0)
if age < 0 {
    assertionFailure("年龄不能小于0")
}

//: ## 执行条件
/*
 只要条件可能为false，就使用条件，但对于代码继续执行必须确实为真。
 通过调用precondition(_:_:file:line:)函数来编写前提条件。将一个表达式传递给此函数，该表达式求值为true或者false，如果条件的结果为false，则显示一条消息。也可以省略断言消息。
 也可以调用该preconditionFailure(_:file:line:)函数来指示发生了故障。
 */
let index = 2
precondition(index > 0, "索引必须大于0哦！")
precondition(index > 0)
if index < 0 {
    preconditionFailure("索引必须大于0哦！")
}
/*
 注意
 如果以unchecked 模式（-Ounchecked）编译，则不检查条件。编译器假定前置条件始终为true，并相应地优化代码。但是，fatalError(_:file:line:)无论优化设置如何，该功能始终会执行暂停。
 */

//: [下一章](@next)
