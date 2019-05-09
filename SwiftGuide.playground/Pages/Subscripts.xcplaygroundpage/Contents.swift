
import Foundation


//: 定义一个TimesTable表示整数n倍数表的结构：
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable[6])

//: 通过在下标括号中提供字典的键类型的键，并将字典的值类型的值分配给下标来设置字典中的值：
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

//: 定义了一个Matrix结构，该结构表示Double值的二维矩阵。该Matrix结构的下标有两个整型参数：
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows*columns)
    }
    func indexIsValid(row: Int, colunm: Int) -> Bool {
        return row >= 0 && row < rows && colunm >= 0 && colunm < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, colunm: column), "Index out of range")
            return grid[row*columns + column]
        }
        set {
            assert(indexIsValid(row: row, colunm: column), "Index out of range")
            grid[row*columns + column] = newValue
        }
    }
}

//: 通过将适当的行和列计数传递给Matrix初始化设定项来构造新实例：
var matrix = Matrix(rows: 2, columns: 2)

//: 通过将行和列值传递到下标中来设置矩阵中的值，用逗号分隔：
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

//: 访问矩阵边界之外的下标，则会触发断言：
//let someValue = matrix[2, 2]


//: [Previous](@previous)    [Next](@next)
