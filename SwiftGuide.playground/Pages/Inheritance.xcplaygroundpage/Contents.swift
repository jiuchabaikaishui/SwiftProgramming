
import Foundation


//: 例定义了一个名为Vehicle的基类：
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing
    }
}

//: Vehicle使用初始化程序语法创建一个新实例，该语法写为类型名称，后跟空括号：
let someVehicle = Vehicle()

//: 创建新Vehicle实例后，可以访问其description属性以打印车辆当前速度的可读描述：
print(someVehicle.description)

//: 定义了一个名为的子类Bicycle，其超类为Vehicle：
class Bicycle: Vehicle {
    var hasBasket = false
}

//: 可以在创建实例后将hasBasket属性设置true为特定Bicycle实例：
let bicycle = Bicycle()
bicycle.hasBasket = true

//: 可以修改Bicycle实例继承的一个属性currentSpeed，查询实例的继承description属性：
bicycle.currentSpeed = 15.0
print(bicycle.description)

//: 子类本身可以创建子类。下一个示例为Bicycle车创建一个双座自行子类，称为“tandem”：
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

//: 创建了一个Tandem实例，则可以使用其任何新的和继承的属性，并查询它继承Vehicle的只读属性description：
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print(tandem.description)

//: 定义了一个新的Vehicle子类Train，Train重写了从Vehicle继承的makeNoise()方：
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

//: 创建一个Train新实例并调用其makeNoise()方法，则可以看到该方法的Train子类版本被调用：
let train = Train()
train.makeNoise()

//: 定义了一个名为Car的新类，它是一个Vehicle子类。Car类定义了新的存储属性gear，用默认整数值1。Car类也覆盖了从Vehicle继承属性description，以提供定制包括当前gear的描述：
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

//: 创建Car类的实例，并设置它gear和currentSpeed属性，你可以看到它的description属性返回中Car类定义的定制描述：
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print(car.description)

//: 定义了一个名为AutomaticCar的新类，它是一个Car子类。AutomaticCar类表示用自动变速器，自动选择适当的gear适用于当前速度：
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed/10.0) + 1
        }
    }
}

//: 35.0的速度产生gear为4：
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print(automatic.description)


//: [Previous](@previous)    [Next](@next)
