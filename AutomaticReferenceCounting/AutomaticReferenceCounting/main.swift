//
//  main.swift
//  AutomaticReferenceCounting
//
//  Created by 綦帅鹏 on 2019/6/12.
//  Copyright © 2019年 QSP. All rights reserved.
//

import Foundation

//: 一个名为Person的简单类，该类定义了一个名为name的存储常量属性：
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

//: 定义了三个Person?类型的变量，用于在后续代码片段中设置对Person新实例的多个引用。由于这些变量属于可选类型（Person?而不是Person），因此它们会自动使用值nil初始化，并且当前不会引用Person实例：
var reference1: Person?
var reference2: Person?
var reference3: Person?

//: 创建一个新Person实例并将其分配给以下三个变量之一：
reference1 = Person(name: "John Appleseed")

//: 将同一Person实例分配给另外两个变量，则会建立另外两个对该实例的强引用：
reference2 = reference1
reference3 = reference1

//: 通过分配nil两个变量来中断其中两个强引用（包括原始引用），Person则会保留一个强引用，并且不会释放该实例：
reference1 = nil
reference2 = nil

//: Person在第三个也是最后一个强引用被破坏之前，ARC不会释放实例，直到明确不再使用该Person实例：
reference3 = nil

//: 创建一个强引用循环的示例。这个例子定义了两个叫做Person和的类Apartment，它们模拟了一套公寓及其居民：
class Person1 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person1?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

//: 定义了两个名为john和unit4A的可选类型变量，它们将被设置为下面的特定Apartment和Person实例。由于是可选的，这两个变量都具有初始值nil：
var john: Person1?
var unit4A: Apartment?

//: 创建特定的Person实例和Apartment实例，并将这些新实例分配给john和unit4A变量：
john = Person1(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

//: 将两个实例链接在一起，以便此人拥有公寓，并且公寓有租户。注意，感叹号（!）用于解包和访问存储在john和unit4A的可选变量，以便这些实例的属性可设置：
john!.apartment = unit4A
unit4A!.tenant = john

//: 断开john和unit4A变量所持有的强引用时，引用计数不会降为零，并且ARC不会释放实例：
john = nil
unit4A = nil

//: Person和Apartment和上面的例子是相同的，有一个重要区别。这一次，Apartment类型的tenant属性被声明为弱引用：
class Person2 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment2?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment2 {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person2?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

//: 两个变量（john和unit4A）的强引用以及两个实例之间的链接如前所述：
var john2: Person2?
var unit4A2: Apartment2?

john2 = Person2(name: "John Appleseed")
unit4A2 = Apartment2(unit: "4A")

john2!.apartment = unit4A2
unit4A2!.tenant = john2

//: 当通过将john变量设置为nil断开变量所持有的强引用时，不再有对该Person实例的强引用：
john2 = nil // 需要在工程项目中运行才打印销毁信息，playground中不打印

//: Apartment实例唯一剩下的强引用来自unit4A变量。如果你破坏了那个强引用，那么对Apartment实例没有强引用：
unit4A2 = nil // 需要在工程项目中运行才打印销毁信息，playground中不打印


//: 信用卡将始终拥有客户，因此将其customer属性定义为无主引用，以避免强引用循环：
class Customer {
    let name: String
    init(name: String) {
        self.name = name
    }
    var card: CreditCard?
    deinit { print("\(name) is being deinitialized") }
}
class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

//: 定义了一个Customer名为的可选变量john，该变量将用于存储对特定客户的引用。由于是可选的，该变量的初始值为nil：
var john1: Customer?

//: 因为没有对Customer实例的强引用，所以它被释放。发生这种情况后，CreditCard实例没有强引用，它也就被销毁：
john1 = Customer(name: "John Appleseed")
john1!.card = CreditCard(number: 1234_5678_9012_3456, customer: john1!)

//: 创建一个Customer实例，并使用它为客户的card属性赋值和初始化新CreditCard实例
john1 = nil // 需要在工程项目中运行才打印销毁信息，playground中不打印

//: 定义了两个类，Country和City每个类都将另一个类的实例存储为属性。在这个数据模型中，每个国家都必须始终拥有一个首都，每个城市必须始终属于一个国家。为了表示这个，Country该类有一个capitalCity属性，City该类有一个country属性：
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

//: 可以在单个语句中创建Country和City实例，而不会创建强引用循环，并且可以直接访问capitalCity属性，而无需使用感叹号来解包其可选值：
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

//: 定义了一个名为HTMLElement的类，它为HTML文档中的单个元素提供了一个简单模型：
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

//: 如果text属性为nil，asHTML属性可以设置默认为一些文字的闭包，以防止返回一个空的HTML标签表示：
let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

//: 使用HTMLElement类创建和打印新实例的方法：
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

//: 如果将paragraph变量设置为nil断开对HTMLElement实例的强引用，则实例HTMLElement及其闭包都不会被释放，因为强引用循环：
paragraph = nil

//: 无主引用是用于解决上述闭包的强引用循环HTMLElement示例中的强引用循环的适当捕获方法。以下是如何编写HTMLElement类以避免循环的方法：
class HTMLElement1 {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

//: 可以像以前一样创建和打印HTMLElement实例：
var paragraph1: HTMLElement1? = HTMLElement1(name: "p", text: "hello, world")
print(paragraph1!.asHTML())

//: 将强引用变量paragraph设置为nil，则HTMLElement实例将被释放，从下面示例中打印的deinitializer消息可以看出：
paragraph1 = nil
