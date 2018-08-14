//: ## 协议与扩展
//:用protocol声明协议。
protocol SimpleProtocol {
    mutating func adjust()
}
protocol ExampleProtocol: SimpleProtocol {
    var simpleDescription: String { get }
}

//: 类、结构、枚举都可以遵守协议
//: 用mutating关键字来声明标记修改结构的方法。类不需要标记为mutating的方法，因为类上的方法总是可以修改类。枚举的属性只能是计算属性（只读）。
class SimpleClass: ExampleProtocol {
    var simpleDescription = "简单类"
    func adjust() {
        simpleDescription += "100%调整"
    }
}
struct SimpleStruct: ExampleProtocol {
    var simpleDescription = "简单结构"
    mutating func adjust() {
        simpleDescription += "调整"
    }
}
enum SimpleEnum: ExampleProtocol {
    case one, two, three
    var simpleDescription: String {
        return "简单枚举"
    }
    
    mutating func adjust() {
    }
}

//: 用extension向现有类添加功能，例如新方法和计算属性。可以使用扩展来将协议在其他地方一致性添加到类，甚至添加到从库或框架导入的类。
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "整数的扩展"
    }
    mutating func adjust() {
        self += 42
    }
}
extension Double {
    var absoluteValue: Double {
        if self < 0 {
            return -self
        } else {
            return self
        }
    }
}

//: 可以用协议名向使用其他类型名一样定义变量、属性，这样的变量、属性能够存储任意遵循协议的对象，但是只能访问协议定义的属性与方法。
var protocolValue: ExampleProtocol = 5
//protocolValue += 2//(不能执行协议中未定义的操作)
