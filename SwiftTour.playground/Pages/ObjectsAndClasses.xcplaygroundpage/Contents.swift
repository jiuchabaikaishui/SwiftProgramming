//: ## 类和对象


//: 使用class后跟类的名称来创建一个类。类中的属性声明与常量或变量声明的编写方式相同，只是它位于类的上下文中。同样，方法和函数声明以相同的方式编写。
class Shape {
    var numbersOfSides = 0
    
    func simpleDescription() -> String {
        return "\(numbersOfSides)边形"
    }
}

//: 通过在类名后面加括号来创建类的实例。使用点语法访问实例的属性和方法。
var shape = Shape()
shape.numbersOfSides = 4
print(shape.simpleDescription())

//: 每个属性都需要一个赋值 - 在其声明中（如同numberOfSides）或在构造器中
//: 如果想要在对象销毁时清理一些东西，就使用deinit
//: 子类在其类名后面包含它们的父类名称，用冒号分隔。创建类的时候并不需要一个标准的根类，所以你可以根据需要添加或者忽略父类
//: 覆盖父类的实现的方法在子类上用override标记 - 意外地覆盖方法，而不使用override会被编译器检测为错误。编译器还检测具有override的方法实际上不覆盖父类中的任何方法。
class NameShape: Shape {
    var name: String
    init(name: String) {
        self.name = name
    }
    override func simpleDescription() -> String {
        return "我叫\(name)，我是\(numbersOfSides)边形"
    }
}

class Square: NameShape {
    var sideLength: Double
    init(name: String, length: Double) {
        sideLength = length
        super.init(name: name)
        numbersOfSides = 4
    }
    
    func area() -> Double {
        return sideLength*sideLength
    }
    
    override func simpleDescription() -> String {
        return "我叫\(name)，我是边长为\(sideLength)的正方形"
    }
}
let square = Square(name: "测试", length: 3.0)
print("正方形\(square.name)的面积为\(square.area())")

class Circle: NameShape {
    var radius: Double
    init(name: String, radius: Double) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return 3.14*radius*radius
    }
    override func simpleDescription() -> String {
        return "我是半径为\(radius)的圆形"
    }
}

//: 属性还可以包含getter和setter
class EquilateralTriangle: NameShape {
    var sideLength: Double
    init(name: String, length: Double) {
        sideLength = length
        super.init(name: name)
        numbersOfSides = 3
    }
    var perimeter: Double {
        get {
            return 3*sideLength
        }
        set {
            sideLength = newValue/3.0
        }
    }
    override func simpleDescription() -> String {
        return "我叫\(name)，我是边长为\(sideLength)的等边三角形"
    }
}

/*:
 注意构造器的三个基本步骤
 - 设置子类属性
 - 初始化父类
 - 更改父类属性以及做一些其他操作
 
 在setter中，新值具有隐式名称newValue，也可以在set后面括号中提供显式名称
 不需要计算属性但仍需要提供在设置新值之前和之后运行的代码，使用willSet和didSet。提供的代码在构造器之外值更改时运行。
*/
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet (value) {
            square.sideLength = value.sideLength
        }
    }
    var square:Square {
        willSet (value) {
            triangle.sideLength = value.sideLength
        }
    }
    
    init(size: Double, name: String) {
        triangle = EquilateralTriangle.init(name: name, length: size)
        square = Square.init(name: name, length: size)
    }
}
TriangleAndSquare(size: 50.0, name: "test")

//: 可选值，如果?之前的值是nil，则忽略?之后的所有内容以及整个表达式的值为nil。否则，解包可选值，并对解包的值执行?后所有操作。这两种情况下，整个表达式的值都是可选值。
let optionalSquare: Square? = Square(name: "optional", length: 4.0)
let sideLength = optionalSquare?.sideLength

//: [上一章](@previous)   [下一章](@next)

