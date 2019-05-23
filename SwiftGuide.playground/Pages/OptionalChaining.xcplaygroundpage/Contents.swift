

import Foundation


//: 定义了Person和Residence两个类：
//class Residence {
//    var numberOfRooms = 1
//}
//class Person {
//    var residence: Residence?
//}

//: john具有residence的属性值nil：
//let john = Person()

//: 访问此人residence的numberOfRooms属性，通过在其后放置感叹号residence强制展开其值，则会触发运行时错误，因为没有residence值要解包：
//let roomCount = john.residence!.numberOfRooms

//: 要使用可选链接，请使用问号代替感叹号：
//if let roomCount = john.residence?.numberOfRooms {
//    print("John's residence has \(roomCount) room(s).")
//} else {
//    print("Unable to retrieve the number of rooms.")
//}

//: 将Residence实例分配给john.residence，以便它不再具有nil值：
//john.residence = Residence()

//: 使用numberOfRooms与以前相同的可选链接进行访问，它现在将返回Int?包含默认numberOfRooms值的1：
//if let roomCount = john.residence?.numberOfRooms {
//    print("John's residence has \(roomCount) room(s).")
//} else {
//    print("Unable to retrieve the number of rooms.")
//}

//: 用于rooms数组的Room是有一个属性叫做name，以及一个初始化把该属性设置为一个合适的房间名称的简单类
class Room {
    var name: String
    init(name: String) { self.name = name }
}

//: 该类有三个可选的String?类型属性。前两个属性buildingName和buildingNumber，是将特定建筑物识别作为地址的一部分。第三个属性street用于为该地址命名街道：
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

//: Residence该类定义了一个名为rooms的变量属性，该属性使用类型为[Room]的空数组进行初始化：
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

//: Person类和以前以同样的方式定义：
class Person {
    var residence: Residence?
}

//: 使用上面定义的类来创建新Person实例，并尝试numberOfRooms像以前一样访问其属性：
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

//: 通过可选链接设置属性的值：
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

//: 下面执行相同的赋值，但它使用一个函数来创建地址。该函数在返回值之前打印“Function was called.”，这样可以查看是否计算了=操作符的右侧：
func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
john.residence?.address = createAddress()

//: 比较来自printNumberOfRooms调用的返回值为nil来查看方法调用是否成功：
if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

//: 任何通过可选链接设置属性的尝试都会返回类型Void?值，这使得可以比较nil以查看属性是否已成功设置：
if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}

//: 因为当前为nil，john.residence下标调用失败：
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

//: 通过带有可选链接的下标设置新值：
john.residence?[0] = Room(name: "Bathroom")

//: 如果创建Residence实例并赋值john.residence，并在其rooms数组中包含一个或多个Room实例，则可以通过可选链接使用Residence下标访问rooms数组中的实际项：
let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

//: 在下标的右括号后面加一个问号，以链接其可选的返回值：
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

//: 这里有两个级别的可选链接，用于链接residence和address属性，两者都是可选类型：
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

//: 如果将实际Address实例设置为john.residence.address的值，并为地址的street属性设置实际值，则可以street通过多级可选链接访问该属性的值：
let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

//: 可选链接后调用方法的最终返回类型是String?：
if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}

//: 如果想在这个方法的返回值进行进一步的可选链接，将链接可选问号放在该方法的括号后：
if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}


//: [Previous](@previous)    [Next](@next)
