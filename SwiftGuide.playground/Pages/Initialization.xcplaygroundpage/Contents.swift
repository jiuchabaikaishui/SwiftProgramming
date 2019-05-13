
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

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

//struct Size {
//    var width = 0.0, height = 0.0
//}
//let twoByTwo = Size(width: 2.0, height: 2.0)

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

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

let basicRect = Rect()

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print(vehicle.description)

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print(bicycle.description)

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print(hoverboard.description)



//: [Previous](@previous)    [Next](@next)
