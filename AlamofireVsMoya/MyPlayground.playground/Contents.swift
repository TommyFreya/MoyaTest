//: Playground - noun: a place where people can play

import UIKit
import RxSwift

public func example(description: String, action: () -> ()) {
    print("\n--- \(description) example ---")
    action()
}

example("just") {
    let emptySequence = just(32)
    let subscription = emptySequence.subscribe{ event in
        print(event)
    }
}


//  枚举的学习
let testList = [1,2,3,4,5]
let addAfterList = testList.map{$0 + 10} //[11,12,13,14,15]

//var numbers = [20,7,7,12,5]
//numbers.map{
//    return 1 - $0%2
//}

//var occupations = ["Malcolm":"Captain","Kaylee":"Mechanic"]

var testDic = ["key":"meilijie"]
func meiLiJie(str:[String: String]) -> [String: String] {
    testDic["key"] = "meilijie wudi"
    return testDic
}
print(testDic)


enum Movement: Int {
    case Left = 0
    case Right
    case Top
    case Bottom
}

let aMovement = Movement.Left
switch aMovement {
    case .Left : print("left")
    default:()
}

if case .Left = aMovement {
    print("left")
}

if aMovement == .Left {print("left")}

/// /////////////////////////////////////////////
let rightMovement = Movement(rawValue: 1)


//enum Trade {
//    case Buy(String,Int)
//    case Sell(String,Int)
//}
//func tardeFunc(type: Trade) {
//    
//}
//
//let buy = Trade.Buy("apple", 500)
//if case let Trade.Buy(stock, amount) = buy {
//    print("\(stock)---\(amount)")
//}


enum Wearable {
    enum Weight: Int {
        case Light = 1
    }
    enum Armor: Int {
        case Light = 2
    }
    case Helmet(Weight,Armor)
        func attributes() -> (Int,Int) {
            switch self {
                case .Helmet(let w, let a) : return (w.rawValue * 2, a.rawValue * 4)
            }
        }
}
let props = Wearable.Helmet(.Light, .Light).attributes()
print(props)

enum Device {
    case iphone_width,iphone_height
    var width: CGFloat {
        switch self {
            case iphone_width: return UIScreen.mainScreen().bounds.size.width
            case iphone_height: return UIScreen.mainScreen().bounds.size.height
        }
    }
}

enum Trade : CustomStringConvertible {
    case Buy, Sell
    var description: String {
        switch self {
            case .Buy: return "wwwww"
            case .Sell: return "------"
        }
    }
}
let action = Trade.Buy


protocol AccountCompatible {
    var remainingFunds: Int { get }
    mutating func addFunds(amount: Int) throws
    mutating func removeFunds(amount: Int) throws
}

enum Error: ErrorType {
    case Overdraft(amount: Int)
}

enum Account {
    case Empty
    case Funds(remaining: Int)
    var remainingFunds: Int {
        switch self {
            case .Empty: return 0
            case .Funds(let remaining): return remaining
        }
    }
}

extension Account: AccountCompatible {
    mutating func addFunds(amount: Int) throws {
        var newAmount = amount
        if case .Funds(let remaining) = self {
            newAmount += remaining
        }
        if newAmount < 0 {
            throw Error.Overdraft(amount: newAmount)
        } else if newAmount == 0 {
            self = .Empty
        } else {
            self = .Funds(remaining: newAmount)
        }
    }
    
    mutating func removeFunds(amount: Int) throws {
        try self.addFunds(amount * -1)
    }
}

var account = Account.Funds(remaining: 30)
do {
    try account.addFunds(-60)
} catch Error.Overdraft(let money) {
    print("\(money)")
}















