//: ## 错误处理
//: 用遵循Error协议的类型表示错误
enum PrinterError: Error {
    case outOfPaper
    case onToner
    case onFire
}

//: 用throw抛出错误，throws标记可以抛出错误的函数。如果在函数中抛出错误，函数会立即返回，并且调用该函数的代码会处理错误。
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.onToner
    }
    
    return "Job sent"
}

//: 有几种方法可以处理错误。
//: 1、使用do- catch。在do块中，通过在其前面写入try来标记可能引发错误的代码。在catch块内，错误会自动给出error名称，除非给它一个不同的名称
do {
    let printerResponse = try send(job: 1024, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

//: 可以提供多个catch处理特定错误的块
do {
    let printerResponse = try send(job: 1024, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

//: 2、用try?将结果转换为可选的。如果函数抛出错误，则丢弃特定错误，结果为nil。否则，结果是一个包含函数返回的值的可选值。
let printerSuccess = try? send(job: 1002, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1003, toPrinter: "Never Has Toner")

//: 用defer写的代码块是在函数中的所有其它代码后只在函数返回之前执行。无论函数是否抛出错误，都会执行代码。可以使用defer编写设置和清理代码，即使它们需要在不同时间执行。
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains(food: "banana")
print(fridgeIsOpen)

//: [上一章](@previous)   [下一章](@next)

