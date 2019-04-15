
import Foundation


//: 使用struct关键字和带有class关键字来引入结构和类。两者都将它们的整个定义放在一对括号中：
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//: 结构和类都使用初始化器语法用于新实例。最简单的初始化语法形式是使用类或结构的类型名称，后跟空括号，这将创建类或结构的新实例，并将所有属性初始化为其默认值：
let someResolution = Resolution()
let someVideoMode = VideoMode()

//: 可以使用点语法访问实例的属性。在点语法中，在实例名称后面立即写入属性名称，用句点（.）分隔，不带任何空格。也可以使用点语法为变量属性分配新值：
someVideoMode.resolution.width = 10
print(someVideoMode.resolution.width)

let vga = Resolution(width: 640, height: 480)

//: 结构和枚举都是Swift中的值类型。这意味着您创建的任何结构和枚举实例以及它们作为属性的任何值类型在代码中传递时始终会被复制：
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 10
print(hd.width)
print(cinema.width)

//: 值类型不同，引用类型在分配给变量或常量时或者传递给函数时不会被复制。而不是副本，使用对同一现有实例的引用：
let otherVideoMode = someVideoMode
otherVideoMode.resolution.width = 7
print(someVideoMode.resolution.width)
print(otherVideoMode.resolution.width)

//: 判断两个常量或变量是否完全引用类的相同实例
if otherVideoMode === someVideoMode {
    print("otherVideoMode与someVideoMode相同")
} else {
    print("otherVideoMode与someVideoMode不相同")
}


//: [Previous](@previous)    [Next](@next)
