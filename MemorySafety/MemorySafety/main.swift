//
//  main.swift
//  MemorySafety
//
//  Created by 綦帅鹏 on 2019/6/17.
//  Copyright © 2019年 QSP. All rights reserved.
//

import Foundation

//: 下面代码清单中的所有读写访问都是即时的：
var one = 1
print("We're number \(one)!")

func oneMore(than number: Int) -> Int {
    return number + 1
}
var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)

//: 这种长期写入访问的一个结果是无法访问作为输入输出传递的原始变量，即使范围规则和访问控制允许它 - 任何对原始数据的访问都会产生冲突。例如：
var stepSize = 1
func increment(_ number: inout Int) {
    number += stepSize
}
//increment(&stepSize) // 错误：冲突反问stepSize

//: 解决这种冲突的一种方法是制作一份明确的副本stepSize：
var copyOfStepSize = stepSize // 制作一个副本
increment(&copyOfStepSize)
stepSize = copyOfStepSize

//: 对输入输出参数进行长期写访问的另一个后果是，将单个变量作为同一函数的多个输入输出参数的参数传递会产生冲突。例如：
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum/2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore) // 可以
//balance(&playerOneScore, &playerOneScore) // 错误：冲突访问playerOneScore

//: 一种游戏，其中每个玩家具有健康量，其在受到伤害时减少，还具有能量值，并且能量量在使用特殊能力时减少
struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

//: 下面的shareHealth(with:)方法将另一个Player实例作为输入输出参数，从而创建重叠访问的可能性：
extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}
var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria) // 可以

//: 如果oscar作为参数传递给shareHealth(with:)，则存在冲突：
//oscar.shareHealth(with: &oscar) // 错误：冲突访问oscar

//: 重叠对元组元素的写访问会产生冲突：
var playerInformation = (health: 10, enertgy: 10)
//balance(&playerInformation.health, &playerInformation.enertgy) // 错误：冲突访问playerInformation

//: 下面显示的代码，对于存储在全局变量中的结构属性的重写写访问，会出现相同的错误：
var holly = Player(name: "Holly", health: 10, energy: 10)
//balance(&holly.health, &holly.energy) // 错误

//: 如果上例中的变量holly更改为局部变量而不是全局变量，则编译器可以证明对结构的存储属性的重叠访问是安全的：
func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy) // 可以
}
someFunction()
