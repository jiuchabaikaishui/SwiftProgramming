
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

/*:
 - 使用intersection(_:)方法创建一个仅包含两个组共有的值的新集。
 - 使用symmetricDifference(_:)方法创建一个新集合，其中包含任一集合中的值，但不包含任两个集合都存在的值。
 - 使用union(_:)方法创建包含两个集中所有值的新集。
 - 使用此subtracting(_:)方法创建一个值不在指定集中的新集。
 */
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()


/*:
 - 使用“is equal”运算符（==）来确定两个集合是否包含所有相同的值。
 - 使用此isSubset(of:)方法确定集合的所有值是否都包含在指定的集合中。
 - 使用此isSuperset(of:)方法确定集合是否包含指定集合中的所有值。
 - 使用isStrictSubset(of:)或isStrictSuperset(of:)方法确定集合是否是指定集合的子集或超集，但不等于。
 - 使用该isDisjoint(with:)方法确定两个集合是否没有共同的值。
 */
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubset(of: farmAnimals)//ture
farmAnimals.isSuperset(of: houseAnimals)//ture
farmAnimals.isDisjoint(with: cityAnimals)//ture

//: 与数组一样，您可以Dictionary使用初始化程序语法创建某个类型的空：
//var namesOfIntegers: Dictionary<String, Int> = Dictionary()
var namesOfIntegers = [Int: String]()

//: 如果上下文已经提供了类型信息，您可以创建一个空字典，其中包含一个空的字典文字，其写为[:]（一对方括号内的冒号）：
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

//: 以下示例创建一个字典来存储国际机场的名称。在这个字典中，key是三个字母的国际航空运输协会代码，值是机场名称：
//var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//: 与数组一样，如果要使用其键和值具有一致类型的字典文字对其进行初始化，则不必编写字典类型。初始化airports可能是用较短的形式编写的
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//: 与数组一样，可以通过检查只读属性count来查找Dictionary中的项目数：
print("The airports dictionary contains \(airports.count) items.")

//: 使用Boolean类型的isEmpty属性作为检查count属性是否等于0的快捷方式：
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is empty.")
}

//: 可以使用下标语法将新项添加到字典中。使用适当类型的新键作为下标索引，并指定适当类型的新值：
airports["LHR"] = "London"

//: 还可以使用下标语法来更改与特定键关联的值：
airports["LHR"] = "London Heathrow"

//: updateValue(_:forKey:)方法返回字典值类型的可选值。例如，对于存储String值的字典，该方法返回type String?或“optional String”的值。如果在更新之前存在该键则此可选值包含该键的旧值，如果不存在任何键或则为nil：
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

//: 还可以使用下标语法从字典中检索特定键的值。因为可以请求不存在值的键，所以字典的下标返回字典值类型的可选值。如果字典包含所请求键的值，则下标返回包含该键的现有值的可选值。否则，返回nil：
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

//: 可以使用下标语法通过nil为该键指定值来从字典中删除键值对：
airports["APL"] = "Apple International"
airports["APL"] = nil

//: 使用removeValue(forKey:)方法从字典中删除键值对。此方法删除键值对（如果存在）并返回已删除的值，如果不存在值则返回nil：
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

//: 可以用字典遍历键值对for- in环。字典中的每个项都作为元组(key, value)返回，可以将元组的成员分解为临时常量或变量，作为迭代的一部分：
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}


//: 还可以通过访问字典的键keys和values属性来检索字典的键或值的可迭代集合
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//: 如果需要API使用字典的键或值来创建Array实例，请使用keys或values属性初始化新数组：
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)


//: [Previous](@previous)    [Next](@next)
