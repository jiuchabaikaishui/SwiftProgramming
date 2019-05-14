
import Foundation


//: Fahrenheit用于存储以华氏温标表示的温度。Fahrenheit结构有一个存储属性temperature，其类型为Double：
//struct Fahrenheit {
//    var temperature: Double
//    init() {
//        temperature = 32.0
//    }
//}
//let f = Fahrenheit()
//print(f.temperature)

//: Fahrenheit可以通过在声明属性的位置为其属性temperature提供默认值，以更简单的形式编写上面的结构：
struct Fahrenheit {
    var temperature = 32.0
}

//: Celsius结构实现了两个称为init(fromFahrenheit:)和init(fromKelvin:)的自定义初始化，用不同的温度刻度的值初始化结构的新实例：
//struct Celsius {
//    var temperatureInCelsius: Double
//    init(fromFahrenheit fahrenheit: Double) {
//        temperatureInCelsius = (fahrenheit - 32.0)/1.8
//    }
//    init(fromKelvin kelvin: Double) {
//        temperatureInCelsius = kelvin - 273.15
//    }
//}
//let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
//let freezingPointOfWater = Celsius(fromKelvin: 273.15)

//: Color为初始化程序提供了三个适当命名的红色，绿色和蓝色组件的Double类型参数。Color还提供了具有单个white参数的第二个初始化器，用于为所有三个颜色组件提供相同的值
struct Color {
    var red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

//: Color通过为每个初始化参数提供值，两个初始值设定项都可用于创建新实例：
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//: 如果已定义参数标签，则必须始终在初始化程序中使用参数标签，并且省略它们导致编译时错误：
//let veryGreen = Color(0.0, 1.0, 0.0)

//: 上面Celsius示例的初始化参数的扩展版本，还有一个额外的初始化程序，用于从已经处于摄氏度范围的Double值创建新Celsius实例：
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0)/1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius(37.0)

//: 定义了一个名为的类SurveyQuestion，其中包含一个名为response的String可选属性：
//class SurveyQuestion {
//    var text: String
//    var response: String?
//    init(text: String) {
//        self.text = text
//    }
//    func ask() {
//        print(text)
//    }
//}
//let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
//cheeseQuestion.ask()

//: 修改上面的SurveyQuestion示例，text问题属性使用常量属性而不是变量属性，以指示SurveyQuestion创建实例后问题不会更改。即使text属性现在是常量，它仍然可以在类的初始化程序中设置：
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "Do you like teets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"

//: 定义了一个名为的类ShoppingListItem，它封装了购物清单中商品的名称，数量和购买状态：
//class ShoppingListItem {
//    var name: String?
//    var quantity = 1
//    var purchased = false
//}
//var item = ShoppingListItem()

//: Size结构自动接收init(width:height:)成员初始化程序，可以使用它初始化新Size实例：
//struct Size {
//    var width = 0.0, height = 0.0
//}
//let twoByTwo = Size(width: 2.0, height: 2.0)

//: 定义了Rect表示几何矩形的自定义结构。例子需要两个称为Size和Point的结构支撑，两者都提供的默认值0.0对于所有其属性的：
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

//: 三个自定义初始化表示，它们是Rect结构定义的一部分：
struct Rect {
    var origin = Point()
    var size = Size()
    init() {  }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - size.width/2.0
        let originY = center.y - size.height/2.0
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

//: 调用此初始化返回一个Rect实例，其origin和size属性从他们的属性定义处由默认值Point(x: 0.0, y: 0.0)和Size(width: 0.0, height: 0.0)初始化：
let basicRect = Rect()

//: 此初始化程序只是将origin和size参数值分配给适当的存储属性
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

//: 先根据center点和size值计算适当的原点。然后它调用（或委托）init(origin:size:)初始化程序，初始化程序将新的原点和大小值存储在适当的属性中：
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

//: 定义了一个名为Vehicle的基类。此基类声明一个名为numberOfWheels的存储属性，其默认为Int值0
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

//: Vehicle类提供了其唯一的存储属性的默认值，并没有提供任何自定义初始化。因此，它会自动接收默认初始化
let vehicle = Vehicle()
print(vehicle.description)

//: 定义了一个Vehicle的子类Bicycle：
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

//: 创建了一个实例Bicycle，则可以调用其继承的description计算属性以查看其numberOfWheels属性的更新方式：
let bicycle = Bicycle()
print(bicycle.description)

//: 如果子类初始化程序在初始化过程的阶段2中不执行自定义，并且超类具有零参数的指定初始化程序，则可在将值分配给所有子类的存储属性之后省略对以super.init()的调用：
class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

//: 一个Hoverboard实例使用Vehicle初始化程序提供的默认轮数。
let hoverboard = Hoverboard(color: "silver")
print(hoverboard.description)

//: Food类引入一个叫name的String类型的属性并提供两个初始化创建Food实例：
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

//: Food类没有默认的成员初始化程序，因此Food该类提供了一个指定的初始化程序，它接受一个名为的参数name。此初始化可用于创建Food具有特定名称的新实例：
let food = Food(name: "Bacon")

//: init()初始化通过使用name值为[Unnamed]委派给Food类的init(name: String)为新Food实例提供了默认的占位符名称：
let mysteryMeat = Food()

//: RecipeIngredient类构建烹饪技法。它引入了一个Int类型名为quantity（除了它继承的属性Food的name）的属性，并定义了两个用于创建RecipeIngredient实例的初始化器：
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

//: 三个初始化都可用于创建新RecipeIngredient实例：
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

//: ShoppingListItem引入了一个名为purchased的布尔属性，默认值为false。ShoppingListItem还添加了一个description计算属性，它提供了一个ShoppingListItem实例的文本描述：
class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

//: 使用所有三个继承的初始化来创建新ShoppingListItem实例：
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

//: 要确保数字类型之间的转换能够准确保证值，使用init(exactly:)初始化。如果类型转换无法保证该值，则初始化程序将失败。
let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}

let valueChanged = Int(exactly: pi)

if valueChanged == nil {
    print("\(pi) conversion to Int does not maintain value")
}

struct Animal {
    var species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

//enum TemperatureUnit {
//    case kelvin, celsius, fahrenheit
//    init?(symbol: Character) {
//        switch symbol {
//        case "K":
//            self = .kelvin
//        case "C":
//            self = .celsius
//        case "F":
//            self = .fahrenheit
//        default:
//            return nil
//        }
//    }
//}

//let fahrenheitUnit = TemperatureUnit(symbol: "F")
//if fahrenheitUnit != nil {
//    print("This is a defined temperature unit, so initialization succeeded.")
//}
//let unknownUnit = TemperatureUnit(symbol: "X")
//if unknownUnit == nil {
//    print("This is not a defined temperature unit, so initialization failed.")
//}

enum TemperatureUnit: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}
let fahrenheitUnit = TemperatureUnit(rawValue: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
let unknownUnit = TemperatureUnit(rawValue: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

class Product {
    var name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
class CartItem: Product {
    var quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}

class Document {
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

//: [Previous](@previous)    [Next](@next)
