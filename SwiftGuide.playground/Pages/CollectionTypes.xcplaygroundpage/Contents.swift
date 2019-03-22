
import Foundation

//: 使用初始化语法创建某个类型的空数组：
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

//: 如果上下文已经提供了类型信息，例如函数参数或已经键入的变量或常量，则可以使用空数组文字创建一个空数组，该数组写为[]（一对空方括号）：
someInts.append(3)
someInts = []

//: 可以通过使用加法运算符（+）将两个具有兼容类型的现有数组相加来创建新数组。新数组的类型是从您添加的两个数组的类型推断出来的：
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

//: 如果要使用包含相同类型值的数组文字对其进行初始化，则不必编写数组类型。初始化shoppingList可能是用较短的形式编写的：
//var shoppingList: [String] = ["milk", "egg"]
var shoppingList = ["milk", "egg"]

//: 要查找数组中的项数，请访问其只读属性count：
print("The shopping list contains \(shoppingList.count) items.")

//: 使用Boolean值isEmpty属性作为检查count属性是否等于式0的快捷方：
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

//: 您可以通过调用数组的append(_:)方法将新项添加到数组的末尾：
shoppingList.append("Flour")

//: 使用添加赋值运算符（+=）追加一个或多个兼容项的数组：
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

//: 使用下标语法从数组中检索值，在数组名称后面的方括号内传递要检索的值的索引：
var firstItem = shoppingList[0]

//: 可以使用下标语法更改给定索引处的现有值：
shoppingList[0] = "Six eggs"

//: 还可以使用下标语法一次更改值范围，即使替换值集的长度与要替换的范围不同。下面的示例替"Chocolate Spread"换，"Cheese"和"Butter"以及"Bananas"与"Apples"：
shoppingList[4...6] = ["Bananas", "Apples"]

//: 要在指定索引处将项插入数组，请调用数组的insert(_:at:)方法：
shoppingList.insert("Maple Syrup", at: 0)

//: 同样，您使用该remove(at:)方法从数组中删除项。此方法删除指定索引处的项并返回已删除的项（尽管如果不需要，可以忽略返回的值）：
let mapleSyrup = shoppingList.remove(at: 0)

//: 删除项时，数组中的任何间隙都会关闭，因此index 0处的值再次等于："Six eggs"
firstItem = shoppingList[0]

//: 如果要从数组中删除最终项，请使用removeLast()方法而不是remove(at:)方法来避免查询数组的count属性。与remove(at:)方法一样，removeLast()返回已删除的项：
let apples = shoppingList.removeLast()

//: 可以用数组for-in循环遍历整个集合值：
for item in shoppingList {
    print(item)
}


//: 如果需要每个项的整数索引及其值，请使用该enumerated()方法迭代数组。对于数组中的每个项，该enumerated()方法返回由整数和项组成的元组。整数从零开始，每个项目计数加1; 如果枚举整个数组，则这些整数与项目的索引相匹配。您可以将元组分解为临时常量或变量，作为迭代的一部分：
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}


//: 可以使用初始化程序语法创建某个类型的空集：
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

//: 如果上下文已经提供了类型信息，例如函数参数或已经键入的变量或常量，则可以使用空数组文字创建一个空集：
letters.insert("a")
letters = []

//: 下面的示例创建一个名为favoriteGenres存储String值的集合：
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

//: 要查找集合中的项目数，请访问其只读属性count：
print("I have \(favoriteGenres.count) favorite music genres.")

//: 使用Boolean类型的isEmpty属性作为检查count属性是否等于0的快捷方式：
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

//: 可以通过调用set的insert(_:)方法将新项添加到集合中：
favoriteGenres.insert("Jazz")

//: 可以通过调用set的remove(_:)方法从集合中删除项目，如果该项目是该集合的成员，则删除该项目，并返回已删除的值，或者如果该集合不包含该项目则返回nil。或者，可以使用其removeAll()方法删除集合中的所有项目。
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

//: 要检查集合是否包含特定项目，请使用该contains(_:)方法。
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

//: 您可以使用for- in循环遍历集合中的值。
for genre in favoriteGenres {
    print("\(genre)")
}

//: Swift的Set类型没有定义的顺序。要以特定顺序迭代集合的值，请使用该sorted()方法，该方法将集合的元素作为使用<运算符排序的数组返回。
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}




//: [Previous](@previous)    [Next](@next)
