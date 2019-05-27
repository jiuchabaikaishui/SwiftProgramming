

import Foundation


//: 定义了一个名为MediaItem的新基类。此类为数字媒体库中显示的任何类型的项目提供基本功能：
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

//: 第一个子类Movie包含有关电影或电影的其他信息。它在MediaItem基类的基础上添加了一个director属性，并带有相应的初始化程序。第二个子类Song，在基类之上添加一个artist属性和初始值设定项：
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

//: Swift的类型检查器能够推导出Movie和Song具有一个共同的超类MediaItem，因此它推断出library是[MediaItem]类型的数组：
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

//: 定义两个变量，movieCount和songCount，其计数library数组中Movie和Song实例的数量：
var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
print("Media library contains \(movieCount) movies and \(songCount) songs")

//: 并不知道每个项目使用哪个实际类，因此使用类型转换（as?）的条件形式来检查每次循环时的向下转换为合适的operator：
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

//: 创建一个名为things的Any数组，该数组可以存储任何类型的值：
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

//: switch语句的情况将它们的匹配值绑定到指定类型的常量，以使其值可以打印：
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

//: 确实需要使用可选值作为Any值，则可以使用as运算符显式地将可选值转换为Any，如下所示：
let optionalNumber: Int? = 3
things.append(optionalNumber)// 有警告
things.append(optionalNumber as Any)// 没有警告


//: [Previous](@previous)    [Next](@next)
