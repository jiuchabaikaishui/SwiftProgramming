//: # 基本运算符
/*:
 一个运算符是一个特殊的符号，或者你使用来检查，更改或合并值的短语。例如，加法运算符（+）对两个数字相加，如：let i = 1 + 2，和AND逻辑运算符（&&）组合两个布尔值，如：&if enteredDoorCode && passedRetinaScan
 
 Swift支持大多数标准C运算符，并改进了几种消除常见编码错误的功能。赋值运算符（=）不返回值，以防止在相等运算（==）意图时错误地使用它。算术运算符（+，-，*，/，%等等）检测和禁止值溢出，来避当工作时数据比存储它们的类型所允许范围更大或更小而发生免意外的结果。在面对数值溢出行为可以选择使用溢出运算符，在溢出运算符中描述。
 
 Swift还提供了在C中不存在的范围运算符，例如a..<b和a...b表示一系列值范围的快捷方式。
 
 本章介绍Swift中的常用运算符。高级运算符涵盖了Swift的高级运算符，并描述了如何定义自定义运算符并为自定义类型实现标准运算符。
 */



//: ## 术语
/*:
 运算符是一元的，二元的或三元的：
 - 一元运算符作用于单个目标上（例如-a）。一元前缀运算符出现在它们的目标之前（例如!b），而一元后缀运算符紧跟在它们的目标之后（例如c!）。
 - 二元运算符作用于两个目标（例如2 + 3），并且是中缀，因为它们出现在两个目标之间。
 - 三元运算符在三个目标上操作。与C一样，Swift只有一个三元运算符，即三元条件运算符（a ? b : c）。
 
 运算符影响的值是操作数。在表达式1 + 2中，符号+是二元运算符，它的两个操作数是值1和2。
 */


//: ## 赋值运算符
/*:
 该赋值运算符（a = b）用b的值初始化或更新a的值
 */
let b = 10
var a = 5
a = b//a的值为10

//: 如果赋值的右侧是具有多个值的元组，则其元素可以一次分解为多个常量或变量：
let (x, y) = (1, 2)

//: 与C和Objective-C中的赋值运算符不同，Swift中的赋值运算符本身不返回值。以下声明无效：
//if let x = y {
//    //这是无效的，因为x = y不返回值
//}
//: 此功能可防止在实际使用等于运算符（==）时意外使用赋值运算符（=）。通过使if x = y无效，Swift可以帮助您避免代码中的这类错误。


//: ## 算术运算符
/*: Swift支持所有数字类型的四个标准算术运算符：
- 加法（+）
- 减法（-）
- 乘法（*）
- 除法（/）
 */
1 + 2
5 - 3
2*3
10.0/2.5

//: 与C和Objective-C中的算术运算符不同，Swift算术运算符默认情况下不允许值溢出。您可以通过使用Swift的溢出运算符来选择值溢出行为（例如 a &+ b）。请参阅溢出运算符。

//: 加法运算符也支持String连接：
"hello, " + "world"//等于"hello, world"


//: ### 取余运算符
/*: 取余运算符（a % b）a的多少倍适合b，并返回剩下值（被称为剩余部分）。

**注意：取余运算符（%）在其他语言也称为模运算符。然而，它在Swift中对负数的行为意味着，严格来说，它是一个余数而不是模运算**。

 以下是取余运算符的工作原理。要计算9 % 4，你首先计算出4的多少倍适合9：

 你可以在9里面放两个4，其余的是1。
 
 在Swift中，这将写成：
*/
9%4//等于1

/*: 为确定a % b的答案，%运算符计算以下等式并将remainder作为其输出返回

a = (b x some multiplier) + remainder

some multiplierba是最适合的内部倍数。

插入9和4输入此等式可得出：

9=（4x 2）+1

在计算负值a的余数时应用相同的方法：
 */
-9%4//等于-1

/*: 插入-9和4输入等式产生：

-9=（4x -2）+-1

给出余数值-1。

对于负值b，忽略符号b。这意味着a % b和a % -b的结果相同。
 */


//: ### 一元减运算符
/*: 可以使用前缀-（称为一元减运算符）来切换数值的符号：
 */
let three = 3
let minusThree = -three//-3
let plusThree = -minusThree//3
//: 一元减运算符（-）直接位于它作用的值之前，没有任何空格。

 
 
//: ### 一元加运算符
/*: 一元加运算符（+）只返回其所作用的值，没有任何变化：
 */
let minusSix = -6
let alsoMinusSix = +minusSix//6
//: 虽然一元加运算符实际上没有做任何事情，但是当使用一元减运算符作为负数时，您可以使用它来为代码提供正数的对称性。

//: ## 复合赋值运算符
/*: 与C一样，Swift提供了将赋值运算符（=）与另一个操作相结合的复合赋值运算符。一个例子是加法赋值运算符（+=）：
 */
a = 1
a += 2//3
/*: 表达式a += 2是a = a + 2的简写。实际上，相加和赋值组合成一个同时执行两个任务的运算符。

**注意：    复合赋值运算符不返回值。例如，你不能写let b = a += 2。**

有关Swift标准库提供的运算符的信息，请参阅运算符声明。
 */

//: ## 比较运算符
/*: Swift支持所有标准C 比较运算符：

- 等于（a == b）
- 不等于（a != b）
- 大于（a > b）
- 小于（a < b）
- 大于或等于（a >= b）
- 小于或等于（a <= b）
**注意：  Swift还提供了两个恒等运算符（ === 和 !== ），用于测试两个对象引用是否都引用同一个对象实例。有关更多信息，请参阅Identity Operators。**

每个比较运算符都返回一个Bool值，以该语句是否为true：
*/
1 == 1//true
2 != 1//true
2 > 1//true
1 < 2//true
1 >= 1//true
2 <= 1//false

//: 比较运算符通常用于条件语句，例如if语句：
let name = "world"
if name == "world" {
    print("hello, world")//打印 "hello, world", 因为name等于"world".
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
/*: 有关该if语句的更多信息，请参阅控制流。

如果它们具有相同的类型和相同的值，则可以比较两个元组。元组从左到右进行比较，一次一个值，直到比较找到两个不相等的值。比较这两个值，并且该比较的结果确定元组比较的总体结果。如果所有元素都相等，则元组本身是相等的。例如：
*/
(1, "zebra") < (2, "apple")   // true 因为 1 is 小于 2; "zebra" and "apple" 不会被比较
(3, "apple") < (3, "bird")    // true 因为 3 is 等于 3, and "apple" 小于 "bird"
(4, "dog") == (4, "dog")      // true 因为 4 is 等于 4, and "dog" 等于 "dog"

/*: 在上面的示例中，您可以在第一行看到从左到右的比较行为。因为1小于2，(1, "zebra")被认为小于(2, "apple")，不管元组中的任何其他值。"zebra"不小于"apple"这不要紧，，因为比较已经由元组的第一个元素决定。但是，当元组的第一个元素相同时，它们的第二个元素会被比较 - 这就是第二行和第三行发生的情况。

仅当运算符可以应用于相应元组中的每个值时，才能将元组与给定运算符进行比较。例如，下面的代码所示，您可以比较(String, Int)两个类型的元组，因为可以使用<运算符比较String和Int两者的值。相反，两个(String, Bool)类型的元组无法与<运算符进行比较，因为<运算符不能应用于Bool值。
*/
("blue", -1) < ("purple", 1)        // 正确, 结果：true
//("blue", false) < ("purple", true)  // 错误 因为 < 不能比较 Boolean 值
//: **注意：  Swift标准库包含的元组比较运算符，元组必须少于7个元素。要将七个或更多元素的元组进行比较，您必须自己实现比较运算符。**


//: ## 三元条件运算符
/*: 所述三元条件运算符是由question ? answer1 : answer2形式的三个部分组成的特殊操作。它是根据question是真还是假来评估两个表达式之一的快捷方式。如果question为true，则计算并返回answer1的值; 否则，它会评估并返回answer2的值。

三元条件运算符是以下代码的简写：
if question {
    answer1
} else {
    answer2
}
 */

//: 这是一个例子，它计算表格行的高度。如果行有标题，行高应该比内容高度高50个点，如果行没有标题，则行高应该高20个点
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight 等于 90

/*: 上面的示例是以下代码的简写：
```
let contentHeight = 40
let hasHeader = true
let rowHeight: Int
if hasHeader {
    rowHeight = contentHeight + 50
} else {
    rowHeight = contentHeight + 20
}
// rowHeight 等于 90
 */

/*: 第一个示例使用三元条件运算符意味着rowHeight可以在单行代码上设置正确的值，这比第二个示例中使用的代码更简洁。

三元条件运算符提供了一种有效的简写，用于决定要考虑两个表达式中的哪一个。但是，请谨慎使用三元条件运算符。如果过度使用，它的简洁性会导致难以阅读的代码。避免将三元条件运算符的多个实例组合到一个复合语句中。
 */

//: ## Nil-Coalescing运算符
/*: Nil-Coalescing运算符（a ?? b）如果可选值a包含一个值则进行解包，如果是nil返回一个默认b值。表达式a始终是可选类型。表达式b必须与存储在a中的类型匹配。

nil-coalescing运算符是下面代码的简写：a != nil ? a! : b
上面的代码使用三元条件运算符和强制解包（a!）当a不是nil时来访问内部包裹的a值，否则返回b。nil-coalescing运算符提供了一种更简洁的方式来以简洁易读的形式封装此条件检查和展开。

**注意：  如果值为a不是nil，则不评估b的值。这被称为短路评估。**

下面的示例使用nil-coalescing运算符在默认颜色名称和可选的用户定义颜色名称之间进行选择：
 */
let defaultColorName = "red"
var userDefinedColorName: String?   // 默认是 nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 是 nil, 因此 colorNameToUse 被设置为默认的 "red"
/*: 该userDefinedColorName变量被定义为可选的String，具有默认值nil。因为userDefinedColorName是可选类型，您可以使用nil-coalescing运算符来考虑其值。在上面的示例中，运算符用于确定叫做colorNameToUse的String变量的初始值。因为userDefinedColorName是nil，userDefinedColorName ?? defaultColorName表达式返回defaultColorName的值，否则为"red"。

如果为非nil值赋值userDefinedColorName并再次执行nil-coalescing运算符检查，userDefinedColorName则使用包含在内的值而不是默认值：
 */
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 不是 nil, 因此 colorNameToUse 被设置为 "green"


//: ## 区间运算符
/*: Swift包含多个区间运算符，它们是表示一系列值的快捷方式。


### 闭区间运算符
闭区间运算符（a...b）限定了从运行范围a到b，并且包括这些值a和b。值a不得大于b。

当在您希望使用所有值的范围内进行迭代时，闭区间运算符非常有用，例如使用for- in循环：
 */
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
//: 有关for- in循环的更多信息，请参阅控制流。


//: ### 半开区间运算符
/*: 所述半开区间运算符（a..<b）限定了从运行范围a到b，但不包括b。它被认为是半开放的，因为它包含它的第一个值，但不包含它的最终值。与闭区域运算符一样，值a不得大于b。如果值a等于b，则结果范围将为空。

当您使用基于零的列表（如数组）时，半开范围特别有用，其中计算列表的长度（但不包括）非常有用：
 */
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack
//: 请注意，该数组包含四个项目，但0..<count只计算3（数组中最后一项的索引），因为它是半开放范围。有关数组的更多信息，请参阅数组。


//: ### 单向区间
//: 闭区域运算符有一个替代形式，用于在一个方向上尽可能继续的范围 - 例如，包括从索引2到数组末尾的数组的所有元素的范围。在这些情况下，您可以省略范围运算符一侧的值。这种范围称为单侧范围，因为运算符仅在一侧具有值。例如：
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

//: 半开区间运算符也具有单侧形式，仅使用其最终值编写。就像在两侧都包含值一样，最终值不是范围的一部分。例如：
for name in names[..<2] {
    print(name)
}
// Anna
// Alex

//: 单向区间可以在其他上下文中使用，而不仅仅在下标中使用。您不能迭代忽略第一个值的单侧范围，因为不清楚迭代应该从何处开始。您可以迭代忽略其最终值的单向区间; 但是，因为范围无限期地继续，请确保为循环添加显式结束条件。您还可以检查单向区间是否包含特定值，如下面的代码所示。
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true


//: ## 逻辑运算符
/*: 逻辑运算符修改或组合布尔逻辑值true和false。Swift支持基于C语言的三个标准逻辑运算符：
- 逻辑NOT（!a）
- 逻辑AND（）a && b
- 逻辑OR（）a || b

### 逻辑非运算符
的逻辑非运算符（!a）反转一个布尔值，使得true成为false，或者false变true。

逻辑非运算符是前缀运算符，并且在它运行的值之前立即出现，没有任何空格。它可以读作“not a”，如下例所示：
 */
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
/* !allowedEntry短语可以读作“如果非allowedEntry。”后续行仅在“非allowedEntry”为真时执行; 也就是说allowedEntry为false

在这个例子中，仔细选择布尔常量和变量名称有助于保持代码的可读性和简洁性，同时避免双重否定或混淆逻辑语句。


### 逻辑AND运算符
逻辑AND运算符（a && b）创建逻辑表达式，其中这两个值必须为true整体表达式才为true。如果任一值false，则整体表达式将是false。实际上，如果第一个值是false，则第二个值不会被计算，因为它不可能使整个表达式等于true。这被称为短路评估。

此示例考虑两个Bool值，并且只有两个值都为true时允许执行：
 */
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"


//: ### 逻辑OR运算符
/* 逻辑OR运算符（a || b）是来自两个相邻|字符制成中缀运算符。您可以使用它来创建逻辑表达式，其中有一个或两个值为true则整个表达式是true。

与上面的逻辑AND运算符一样，逻辑OR运算符使用短路评估来考虑其表达式。如果逻辑OR表达式的左侧是true，则不评估右侧，因为它不能更改整个表达式的结果。

在下面的示例中，第一个Bool值（hasDoorKey）是false，但第二个值（knowsOverridePassword）是true。因为有一个值是true，整个表达式也会计算为true，并允许访问：
 */
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"


//: ### 结合逻辑运算符
//: 您可以组合多个逻辑运算符来创建更长的复合表达式：
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
/*: 此示例使用多个 &&和||运算符创建更长的复合表达式。然而&&和||运算符仍然只运行两个值，所以这实际上是三个较小的表达式链接在一起。该示例可以理解为：

如果我们输入了正确的门禁密码并通过了视网膜扫描，或者我们有一个有效的门钥匙，或者我们知道紧急覆盖密码，那么允许访问。

基于enteredDoorCode、passedRetinaScan和hasDoorKey的值，前两个子表达式是false。但是，紧急覆盖密码是true，因此整个复合表达式仍然评估为true。

**注意：  Swift逻辑运算符&&和||是左结合，这意味着与多个逻辑运算符复合表达式首先评估最左边的子表达式。**


### 明确的括号
当它们不是严格需要有时包含括括号是有用的，以使复杂表达的意图更容易阅读。在上面的进门的示例中，在复合表达式的第一部分周围添加括号以使其意图明显是有用的：
*/
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
//: 括号清楚地表明前两个值被视为整体逻辑中单独可能状态的一部分。复合表达式的输出不会改变，但读者的整体意图更清晰。可读性始终优于简洁; 使用括号，帮助他们明确你的意图。

//: [上一章](@previous)   [下一章](@next)
