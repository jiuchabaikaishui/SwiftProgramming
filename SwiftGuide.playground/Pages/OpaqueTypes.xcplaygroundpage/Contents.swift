

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

//: 可以使用泛型来实现垂直翻转形状等操作，如下面的代码所示。但是，这种方法存在一个重要的局限性：翻转结果会暴露用于创建它的确切泛型类型：
struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())

//: JoinedShape<T: Shape, U: Shape>的结构将两个形状垂直连接在一起的方法（如下面的代码所示）会产生类似于JoinedShape<FlippedShape<Triangle>, Triangle>将翻转三角形与另一个三角形连接的类型：
struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
print(JoinedShape(top: smallTriangle, bottom: flippedTriangle).draw())

//: opaque类型允许函数实现选择它返回的值的类型，其方式是从调用函数的代码中抽象出来的。例如，以下示例中的函数返回一个梯形，而不暴露该形状的基础类型：
struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

//: 以下示例中的函数返回一个梯形，而不暴露该形状的基础类型：
func makeTrapezoid() -> JoinedShape<Triangle, JoinedShape<Square, FlippedShape<Triangle>>> {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    return JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
}
let trapezoid = makeTrapezoid()
print(trapezoid.draw())

//: 以下代码中的函数返回遵守Shape协议的某种类型的值：
func flip<T: Shape>(_ shape: T) -> FlippedShape<T> {
    return FlippedShape(shape: shape)
}
func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> JoinedShape<T, U> {
    return JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())

//: 这是形状翻转函数的无效版本，其中包含正方形的特殊情况：
/*
 func invalidFlip<T: Shape>(_ shape: T) -> Triangle {
 if shape is Square {
 return shape // 错误：返回类型不匹配
 }
 
 return FlippedShape(shape: shape) // 错误：返回类型不匹配
 }
 */

//: invalidFlip(_:)的一种解决方法是将正方形的特殊情况移动到实现中FlippedShape，这使得此函数始终返回一个FlippedShape值：
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

//: 始终返回单一类型的要求不会妨碍在不透明的返回类型中使用泛型。下面是一个示例函数，它将类型参数合并到返回值的基础类型中：
func `repeat`<T: Shape>(shape: T, count: Int) -> Array<T> {
    return Array(repeating: shape, count: count)
}

//: 这里的flip(_:)版本返回协议类型的值而不是使用opaque返回类型：
func protoFlip<T: Shape>(_ shape: T) -> Shape {
    return FlippedShape(shape: shape)
}

//: protoFlip(_:)与调用者签订的API合约比flip(_:)更宽松。它保留了返回多种类型值的灵活性：
func protoFlip1<T: Shape>(_ shape: T) -> Shape {
    if shape is Square {
        return shape
    }
    return FlippedShape(shape: shape)
}

//: 不可能编写一个==运算符来比较protoFlip1函数返回的结果：
let protoFlippedTriangle = protoFlip1(smallTriangle)
let someThing = protoFlip1(smallTriangle)
//protoFlippedTriangle == someThing // 错误

//: 这是Container协议的Generics版本：
protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
extension Array: Container { }

//: 不能将其Container用作函数的返回类型，因为该协议具有关联类型。也不能将它用作返回类型的泛型约束，因为函数体外没有足够的信息来推断泛型类型需要什么：
/*
 // 错误：关联类型的协议不能作为返回类型
 func makeProtocolContainer<T>(item: T) -> Container {
 return [item]
 }
 
 // 错误：没有足够的信息来推断C
 func makeProtocolContainer<T, C: Container>(item: T) -> C {
 return [item]
 }
 */

//: 使用opaque类型some Container作为返回类型表示所需的API契约 - 该函数返回一个容器，但拒绝指定容器的类型：
func makeProtocolContainer<T>(item: T) -> Array<T> {
    return [item]
}
let opaqueContainer = makeProtocolContainer(item: 12)
let twelve = opaqueContainer[0]
print(type(of: twelve))


//: [Previous](@previous)    [Next](@next)
