

import Foundation

//: ASCII艺术形状的基本特征是draw()函数返回的形状字符串表示，可以将其用作Shape协议的要求：
protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        
        return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

//: 可以利用泛型来实现垂直翻转之类的操作，就像下面这样。然而，这种方式有一个很大的局限：翻转操作的结果会暴露我们用于构造结果的泛型类型：
struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())

//: JoinedShape<T: Shape, U: Shape> 结构体，能将几何图形垂直拼接起来。如果拼接一个翻转三角形和一个普通三角形，它就会得到类似于 JoinedShape<FlippedShape<Triangle>, Triangle> 这样的类型：
struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
print(JoinedShape(top: smallTriangle, bottom: flippedTriangle).draw())

//: 不透明类型允许函数实现时，选择一个与调用代码无关的返回类型。比如，下面的例子返回了一个梯形，却没直接输出梯形的底层类型：
struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

//: 以下示例中的函数返回一个梯形，而不暴露该形状的基础类型：
func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    return JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
}
let trapezoid = makeTrapezoid()
print(trapezoid.draw())

//: 下面的两个泛型函数也都返回了遵循 Shape 协议的不透明类型：
func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}
func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    return JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())

//: 这是形状翻转函数的无效版本，其中包含正方形的特殊情况：
// func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
//     if shape is Square {
//         return shape // 错误：返回类型不一致
//     }
//
//     return FlippedShape(shape: shape) // 错误：返回类型不一致
// }

//: 修正 invalidFlip(_:) 的方法之一就是将针对 Square 的特殊处理移入到 FlippedShape 的实现中去，这样就能保证这个函数始终返回 FlippedShape：
struct FlippedShape1<T: Shape>: Shape {
    var shape: Shape
    func draw() -> String {
        if shape is Square {
            return shape.draw()
        }
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

//: 返回类型始终唯一的要求，并不会影响在返回的不透明类型中使用泛型。比如下面的函数，就是在返回的底层类型中使用了泛型参数：
func `repeat`<T: Shape>(shape: T, count: Int) -> some Collection {
    return Array(repeating: shape, count: count)
}

//: 这是 flip(_:) 方法不采用不透明类型，而采用返回协议类型的版本：
func protoFlip<T: Shape>(_ shape: T) -> Shape {
    return FlippedShape(shape: shape)
}

//: protoFlip(_:) 比起 flip(_:) 对 API 调用者的约束更加松散。它保留了返回多种不同类型的灵活性
func protoFlip1<T: Shape>(_ shape: T) -> Shape {
    if shape is Square {
        return shape
    }
    return FlippedShape(shape: shape)
}

//: 这个函数的返回结果不能用 == 运算符进行比较：
let protoFlippedTriangle = protoFlip1(smallTriangle)
let someThing = protoFlip1(smallTriangle)
//protoFlippedTriangle == someThing // 错误

//: 下面是 泛型 中的 Container 协议：
protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
extension Array: Container { }

//: 不能将 Container 作为方法的返回类型，因为此协议有一个关联类型。也不能将它用于对泛型返回类型的约束，因为函数体之外并没有暴露足够多的信息来推断泛型类型：
/*
 // 错误：有关联类型的协议不能作为返回类型
 func makeProtocolContainer<T>(item: T) -> Container {
 return [item]
 }
 
 // 错误：没有足够多的信息来推断 C 的类型
 func makeProtocolContainer<T, C: Container>(item: T) -> C {
 return [item]
 }
 */

//: 使用不透明类型 some Container 作为返回类型，就能够明确地表达所需要的 API 契约 —— 函数会返回一个集合类型，但并不指明它的具体类型：：
func makeProtocolContainer<T>(item: T) -> some Container {
    return [item]
}
let opaqueContainer = makeProtocolContainer(item: 12)
let twelve = opaqueContainer[0]
print(type(of: twelve))


//: [Previous](@previous)    [Next](@next)
