

import Foundation

//: 按位NOT运算符是一个前缀运算符，它出现在它操作的值之前，没有任何空格：
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits

//: firstSixBits和lastSixBits两个值具有四个中间位等于1。按位AND运算符将它们组合起来以产生数字00111100，该数字等于无符号十进制值60：
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

//: someBits和moreBits的值具有不同的位设置为1。按位OR运算符将它们组合起来以产生数字11111110，该数字等于无符号数254：
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits

//: firstBits和otherBits一个值位为1，而另一个不是，按位异或运算符这个位设置1为其输出值。firstBits和otherBits所有其他位相同在输出值中设置为0：
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits

//: Swift代码中位移的方式：
let shiftBits: UInt8 = 4   // 00000100
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001

//: 可以使用位移来编码和解码其他数据类型中的值：
let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16    // redComponent 是 0xCC, 即204
let greenComponent = (pink & 0x00FF00) >> 8   // greenComponent 是 0x66, 即102
let blueComponent = pink & 0x0000FF           // blueComponent 是 0x99, 即153

//: Int16整数类型可以包含-32768和32767之间的任何有符号整数。尝试将Int16常量或变量设置为此范围之外的数字会导致错误：
var potentialOverflow = Int16.max
//potentialOverflow += 1

//: 使用overflow溢出加法（&+）允许无符号整数向正方向溢出时会发生什么的示例：
var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1

//: 当允许无符号整数向负方向溢出时会发生类似情况。这是使用溢出减法运算符（&-）的示例：
unsignedOverflow = UInt8.min
unsignedOverflow = unsignedOverflow &- 1

//: 有符号整数的所有加法和减法以按位方式执行，符号位作为加数或减数的一部分包括在内，如按位左右移位运算符中所述：
var signedOverflow = Int8.min
signedOverflow = signedOverflow &- 1

//: 定义了二维位置向量(x, y)的结构Vector2D，然后定义了将Vector2D结构实例相加的运算符方法：
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

//: 类型方法可以用作现有Vector2D实例之间的中缀运算符：
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

//: 通过在声明运算符方法时在func前写入关键字prefixor、postfix修饰符来实现前缀或后缀一元运算符：
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

//: 对于简单的数值，一元负运算符将正数转换为负数，反之亦然。Vector2D实例的相应实现对x和y属性执行此操作：
let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative

//: 为Vector2D实例实现了一个加法赋值运算符方法：
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

//: 由于之前已定义了加法运算符，因此无需在此处重新实现加法过程。相反，加法赋值运算符方法利用现有的加法运算符方法，并使用它将左值设置为左值加右值：
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

//: 以与实现其他中缀运算符相同的方式提供==运算符的实现：
extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

//: 可以使用此运算符来检查两个Vector2D实例是否相等：
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

//: 定义了三维位置矢量(x, y, z)的结构Vector3D，类似于结构Vector2D。因为x，y和z属性都是Equatable类型，所以接收综合的等价运营商的实现：
struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent.")
}

//: 新的运算符使用operator关键字全局声明，并且都标有prefix，infix或postfix修饰：
prefix operator +++

//: 通过使用前面定义的加法赋值运算符将向量与自身相加，使Vector2D实例的值x和y值加倍。为了实现+++运算符，添加一个名为+++的Vector2D类型方法，如下：
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

//: 定义了一个名为+-的新自定义中缀运算符，该运算符属于AdditionPrecedence优先级组：
infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector


//: [Previous](@previous)    [Next](@next)
