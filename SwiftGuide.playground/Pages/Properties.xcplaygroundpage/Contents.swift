
import Foundation

//: 定义一个名为FixedLengthRange的结构，它描述了一系列整数，其范围长度在创建后无法更改：
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
//var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
//rangeOfThreeItems.firstValue = 6

//: 创建结构的实例并将该实例分配给常量，则无法修改实例的属性，即使它们被声明为变量属性：
//let rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
//rangeOfThreeItems.firstValue = 6

//: 使用懒加载存储属性来避免复杂类的不必要的初始化：
class DataImporter {
    var filename = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

//: 只有在首次访问importer属性时才会创建importer属性的DataImporter实例：
print(manager.importer.filename)

//: 提供了一个getter和一个可选的setter来间接检索和设置其他属性和值：
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print(square)

//: 计算属性的setter没有为要设置的新值定义名称，newValue则使用默认名称：
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
}

//: 可以通过删除get关键字及其大括号来简化只读计算属性的声明：
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width*height*depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print(fourByFiveByTwo.volume)

//: 可以选择在属性上定义其中一个或两个观察者，willSet 在存储值之前调用，didSet 在存储新值后立即调用：
class StepCounter {
    var totalSteps = 0 {
        willSet(newTotalSteps) {
            print("willSet \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("didSet \(totalSteps)")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

//: 类型属性是作为类型定义的一部分写入的，在类型的外部花括号中，并且每个类型属性都显式限定为它支持的类型：
struct SomeStructure {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

//: 读取类型属性使用点语法进行，就像实例属性一样：
print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "another value"
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)

//: 使用两个存储类型属性作为的结构体的一部分建模多个音频通道音量：
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

//: 可以使用AudioChannel结构来创建两个新的音频通道叫leftChannel和rightChannel：
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)


//: [Previous](@previous)    [Next](@next)
