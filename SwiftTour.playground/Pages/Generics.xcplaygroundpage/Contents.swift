//: ## 泛型
//: 在尖括号内写一个名称以制作泛型
func makeArray<Item>(item: Item, count: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<count {
        result.append(item)
    }
    
    return result
}
print(makeArray(item: "eggs", count: 5))

//: 泛型可以在函数、类、枚举、结构体中制作
enum OptionValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionValue<Int> = .none
possibleInteger = .some(10)

//: where在正文之前使用以指定需求列表 - 例如，要求类型实现协议，要求两个类型相同，或要求类具有特定的超类
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for rhsItem in rhs {
        for lhsItem in lhs {
            if rhsItem == lhsItem {
                return true
            }
        }
    }
    
    return false
}
anyCommonElements([1, 2, 3], [3])
//: <T: Equatable>与<T>... where T: Equatable两种写法效果一样

//: [上一章](@previous)
