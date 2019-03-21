

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

//: 字符串插值是String一种通过在字符串文字中包含常量，变量，文字和表达式的值混合构造新值的方法。可以在单行和多行字符串文字中使用字符串插值。插入到字符串文字中的每个项目都包含在一对括号中，前缀为反斜杠（\）：
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier)*2.5)"

//: 在这两种情况下，字母é都表示为单个Swift中表示扩展字形集群的Character值。在第一种情况下，集群包含单个标量; 在第二种情况下，它是两个标量的集群：
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

//: 扩展的字形集群是将许多复杂的脚本字符表示为单个Character值的灵活方式。例如，韩语字母表中的韩语音节可以表示为预先组合或分解的序列。这两个表示在Swift中都符合Character的单个值：
let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

//: 扩展的字形集群使可以封闭标记标量（例如COMBINING ENCLOSING CIRCLE，或U+20DD）以将其他Unicode标量作为单个Character值的一部分包含在内：
let enclosedEAcute: Character = "\u{E9}\u{20DD}"

//: 地区标志符号的Unicode标量可以成对组合以形成单个Character值，例如REGIONAL INDICATOR SYMBOL LETTER U（U+1F1FA）和REGIONAL INDICATOR SYMBOL LETTER S（U+1F1F8）的这种组合：
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

//: 要检索字符串中Character值的个数，请使用字符串的count属性：
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

//: 如果使用四个字符的单词初始化一个新字符串cafe，然后在字符串的末尾附加一个COMBINING ACUTE ACCENT（U+0301），则结果字符串的字符数仍为4第四个字符，第四个字符是é而不是e：
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.count)")

//: 可以使用下标语法来访问String特定Character索引:
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

//: 尝试访问字符串范围之外的索引或字符串范围的之外索引的Character将触发运行时错误:
//greeting[greeting.endIndex]
//greeting.index(after: greeting.endIndex)

//: 使用indices属性可以访问字符串中单个字符的所有索引:
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

//: 要将单个字符插入到字符串的指定索引处中，请使用insert(_:at:)方法；在指定索引处插入另一个字符串的内容，请使用该insert(contentsOf:at:)方法:
var welcom = "hello"
welcom.insert("!", at: welcom.endIndex)

welcom.insert(contentsOf: " there", at: welcom.index(before: welcom.endIndex))

//: 要从指定索引处的字符串中删除单个字符，请使用该remove(at:)方法；删除指定范围内的子字符串，请使用以下removeSubrange(_:)方法：
welcom.remove(at: welcom.index(before: welcom.endIndex))

let range = welcom.index(welcom.endIndex, offsetBy: -6)..<welcom.endIndex
welcom.removeSubrange(range)

//: 从字符串中获取子字符串时 - 例如，使用下标或类似方法prefix(_:) - 结果是一个Substring的实例，而不是另一个字符串。Swift中的子字符串与字符串具有大多数相同的方法，这意味着您可以像处理字符串一样使用子字符串。但是，与字符串不同的是在对字符串执行操作时使用的子字符串仅有很短时间。当您准备好将结果存储更长时间时，将子字符串转换为String实例。例如：
let greetin = "hello, world!"
let inde = greetin.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greetin[..<inde]

let newString = String(beginning)

let quotation1 = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation1 == sameQuotation {
    print("These two strings are considered equal")
}






//: [Previous](@previous)   [Next](@next)
