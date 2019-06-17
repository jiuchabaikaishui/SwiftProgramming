

import Foundation


//: 定义实体的访问级别通过在实体的导入前放置一个open，public，internal，fileprivate，或private修饰语：
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

//: 除非另行指定，否则默认访问级别为内部，如默认访问级别中所述。这意味着，SomeInternalClass和someInternalConstant能够在没有明确的访问级别的修改写入，仍会有内部的访问级别：
class SomeInternalClass1 {}              // 默认内部访问级别
let someInternalConstant1 = 0            // 默认内部访问级别

//: 公共类型默认具有内部成员，而不是公共成员。如果希望类型成员是公共的，则必须明确标记它。此要求可确保某个类型的面向公众的API是选择发布的内容，并避免错误地将类型的内部工作方式显示为公共API。
public class SomePublicClass2 {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}

class SomeInternalClass2 {
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}

fileprivate class SomeFilePrivateClass2 {
    func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}

private class SomePrivateClass2 {
    func somePrivateMethod() {}
}

//: 定义了一个名为someFunction()的全局函数，但没有为函数本身提供特定的访问级别修饰符。可能希望此函数具有默认的“内部”访问级别，但事实并非如此。实际上如下所写的someFunction()不会：
//func someFunction() -> (SomeInternalClass, SomePrivateClass) {
//    // 这是函数实现
//}

//: 因为函数的返回类型是私有的，所以必须使用private函数声明的修饰符来标记函数的整体访问级别
//private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
//    // 这是函数实现
//}

//: CompassPoint枚举具有显式的公共访问级别。枚举的情况north，south，east，和west因此也有公共的访问级别：
public enum CompassPoint {
    case north
    case south
    case east
    case west
}

//: 类A是有一个名为someMethod()的file-private方法的公共类。类B是A子类，具有更低的“内部”访问级别。尽管如此，class B提供了一个访问级别为“internal” 的someMethod()覆盖，它高于原始someMethod()实现：
public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {}
}

//: 比超类成员具有更低访问权限的子类成员调用超类成员甚至是有效的，只要对超类成员的调用发生在允许的访问级别上下文中（即，在与超类同一源文件源文件中的文件私有成员调用，或者与超类在同一模块中的内部成员调用）：
public class A1 {
    fileprivate func someMethod() {}
}

internal class B1: A1 {
    override internal func someMethod() {
        super.someMethod()
    }
}

//: 使用标记私有类型常量，变量，属性或下标，则常量，变量，属性或下标也必须标记为private：
private var privateInstance = SomePrivateClass()

//: 定义了一个名为TrackedString的结构，它跟踪字符串属性被修改的次数：
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

//: 创建一个TrackedString实例并多次修改其字符串值，则可以看到numberOfEdits属性值更新以匹配修改次数：
var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

//: 可以通过组合public和private(set)访问级别修饰符使结构的numberOfEdits属性的getter为public，其属性setter为private ：
public struct TrackedString1 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}

//: 无论的类型是否具有私有实体可以使用扩展以相同的方式组织代码。例如，给出以下简单协议：
protocol SomeProtocol {
    func doSomething()
}

//: 可以使用扩展来添加遵守的协议，如下所示：
struct SomeStruct {
    private var privateVariable = 12
}

extension SomeStruct: SomeProtocol {
    func doSomething() {
        print(privateVariable)
    }
}

//: [Previous](@previous)   [Next](@next)
