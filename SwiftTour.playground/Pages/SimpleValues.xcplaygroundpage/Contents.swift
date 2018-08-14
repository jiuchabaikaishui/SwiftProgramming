/*:
 # Swift之旅
 这行代码是一个完整的程序。无需为输入/输出或字符串处理等功能导入单独的库、在全局范围编写的代码用作程序的入口点，不需要main()函数，也不需要在每个语句的末尾写分号。
 */
print("hello, world!")

/*:
 ## 简单的值
 使用let声明一个常数，var声明一个变量。在编译时不需要知道常量的值，但必须为其分配一次值。这意味着您可以使用常量来命名您确定一次但在许多地方使用的值。
 */
var myVariable = 42
myVariable = 50
let myConstant = 42

//: 如果初始值未提供足够的信息（或者没有初始值），请通过在变量后面写入来指定类型，用冒号分隔。
let intCons: Int
let stringCons: Double = 5

//: 练习:
//: 创建一个Float类型值为4的常量
let exV: Float = 4

//: 值永远不会隐式转换为其他类型。如果需要将值转换为其他类型，请显式创建所需类型的实例。
let label = "宽度是"
let width = 8
var widthLabel = label + String(width)

//: 练习:
//: 尝试删除上面一行的String显式转换，看得到什么错误。
//: widthLabel = label + width//(Binary operator '+' cannot be applied to operands of type 'String' and 'Int')

//: 有一种简单的方法可以在字符串中包含值：在括号中写入值，并在括号前写入\。
let apples = 3
let oranges = 5
let appleSummary = "我有\(apples)个苹果"
let orangeSummary = "我有个\(oranges)橘子"

//: 对于占用多行的字符串，请使用三个双引号，每个引用行开头的缩进都会被删除，只要它与右引号的缩进相匹配即可(字符串必须另起一行，结束的三个引号也必须另起一行)
let quotation = """
我有\(apples)个苹果
我还有\(oranges)个橘子
"""

//: 使用方括号（[]）创建数组和字典，并通过在括号中写入索引或键来访问它们的元素。最后一个元素后面允许逗号。
var shoppingList = ["鱼", "狗", "人", "猪",]
shoppingList[0] = "草鱼"

var occupations = ["张三": "厨师", "李四": "iOS程序员", ]
occupations["lis"] = "前台"

//: 创建空数组或字典，请使用初始化程序语法。
let emptyArray = [String]()
let emptyDictionary = [String: Int]()

//: 如果可以推断类型信息，则可以将空数组写为[]空字典写为[:]
shoppingList = []
occupations = [:]
let emptyStringArray: [String] = []
let emptyStringDictionary: [String: String] = [:]
