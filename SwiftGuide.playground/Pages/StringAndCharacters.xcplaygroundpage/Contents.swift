

import Foundation

//: 使用字符串文字作为常量或变量的初始值：
let someString = "Some string literal value"

//: 如果需要跨越多行的字符串，请使用多行字符串文字 - 由三个双引号括起来的字符序列：
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

//: 多行字符串文字包括其开始和结束引号之间的所有行。该字符串从开始引号（"""）后面的第一行开始，到结束引号之前的行结束，这意味着下面的字符串都不会以换行符开头或结尾：
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

//: 当源代码在多行字符串文字中包含换行符时，该换行符也会出现在字符串的值中。如果您想使用换行符来使源代码更容易阅读，但是您不希望换行符成为字符串值的一部分，请在这些行的末尾写一个反斜杠（\）：
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

//: 要创建以换行符开头或结尾的多行字符串文字，请将空行写为第一行或最后一行。例如：
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.


"""

//: 下面的代码显示了这些特殊字符的四个示例。wiseWords常量包含两个转义双引号。dollarSign，blackHeart和sparklingHeart常量包含Unicode标量格式展示：
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

//: 因为多行字符串文字使用三个双引号而不是一个，所以您可以在多行字符串文字中包含双引号（"）而不转义它。要将文本"""包含在多行字符串中，请至少转义其中一个引号。例如：
let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""

//: 要创建空String值作为构建更长字符串的起点，请将空字符串文字指定给变量，或使用String初始化语法初始化新实例：
let emptyString = ""
let anotherEmptyString = String()

//: String通过检查其布尔isEmpty属性来确定值是否为空：
if emptyString.isEmpty {
    print("Nothing to see here")
}

//: 您可以通过将String分配给特定变量（在这种情况下可以修改）或常量（在这种情况下不能修改）来指定是否可以修改（或可变）：
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"

//: 您可以通过使用for-in循环遍历字符串来访问String的各个Character值：
for character in "Dog!🐶" {
    print(character)
}

//: 然而，可以通过提供Character类型从单字符字符串文字创建独立Character常量或变量：
let exclamationMark: Character = "!"

//: String可以通过用Character值数组作为初始化参数：
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

//: 还可以使用加号赋值运算符（+=）将String值附加到现有String变量：
var instruction = "look over"
instruction += string2

//: 可以使用String类型的方法append()将Character值附加到String变量：
welcome.append(exclamationMark)

//: 如果使用多行字符串文字来构建较长的字符串，则希望字符串中的每一行都以换行符结束，包括最后一行。例如：
let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)

let goodStart = """
one
two

"""
print(goodStart + end)
//: 在上面的代码中，连接badStart与end产生两行字符串，这是不期望的结果。因为badStart最后一行不以换行符结束，所以该行与end第一行结合。相比之下，goodStart两行都以换行符结束，所以当它与end结合时有三行，正如预期的那样。





//: [Previous](@previous)   [Next](@next)
