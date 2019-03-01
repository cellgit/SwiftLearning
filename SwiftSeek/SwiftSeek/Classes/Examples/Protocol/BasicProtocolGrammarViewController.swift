//
//  BasicProtocolGrammarViewController.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/1/11.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

class BasicProtocolGrammarViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setup()
    }
    
    func setup() {
        let ve = Vehicle()
        ve.position = 4
        ve.gear = .up
        print("ve.gearPosition == \(ve.gearPosition)")
    }
}

//------------------
// 定义协议
protocol VehicleProtocol {
    var gearPosition: Int {get}
}

enum ChangeGearEnum {
    case up
    case down
    case none
}

var MaxGearPosition: Int = 5
var MinGearPosition: Int = 1

/// 定义车辆
class Vehicle: VehicleProtocol {
    /// 当前档位
    var position: Int = 1
    private var tempPosition: Int = 0
    var gear: ChangeGearEnum = .none
    // 实现协议中定义的属性
    // 变换后的档位
    var gearPosition: Int {
        get {
            switch gear {
            case .up:
                if position < MaxGearPosition {
                    tempPosition = position + 1
                }
            case .down:
                if position > MaxGearPosition {
                    tempPosition = position - 1
                }
            default:
                tempPosition = position - 0
            }
            return tempPosition
        }
        set {
            position = position + 0
        }
    }
}







enum OperationModeEnum {
    case next
    case previous
    case none
}
var MinUrlIndex: Int = 0
var MaxUrlIndex: Int = 0
/// 定义车辆
class UrlIndex {}











































// 可以在协议的定义中指定某个成员为类型成员，在成员定义前加上关键字 static 即可

protocol someProtocol {
    // 定义类型成员
    static func someTypeNethod()
}

protocol CarModeProtocol {
    // 定义类型成员
    static func carMode()
}

// 限制协议仅和类一起工作也是可行的，只需要在冒号后面添加一个 class 关键字，这样就代表这个协议只能被类所遵守。
//protocol 协议: class, 继承的协议1, 继承的协议2 {
//
//    var 某个属性: 类型 {set get}
//    func 某个方法(参数列表) -> 返回值类型
//    init 构造器(参数列表)
//}

enum CarModeEnum {
    case sports
    case offRoad
    case sedan
}

protocol CarProtocol {
    var mode: CarModeEnum {set get}
    func carSpeed() -> CGFloat
}


struct SportsCar: CarProtocol {
    var mode: CarModeEnum
    
    func carSpeed() -> CGFloat {
        switch mode {
        case .sports:
            return 350
        case .offRoad:
            return 200
        default:
            return 300
        }
    }
}



/// normal, live , ad


enum EpisodeModeEnum {
    case normal
    case live
    case ad
}

/// 控件功能枚举
enum PlayerControlEnum {
    case previous
    case next
    case dismiss
    case more
    case share
    case add
    case unknown
}


protocol PlayerControlDisplayProtocol {
    var episodeMode: EpisodeModeEnum {get}
    var control: PlayerControlEnum {get}
    func displayControl()
}


struct MaskView: PlayerControlDisplayProtocol {
    var episodeMode: EpisodeModeEnum
    var control: PlayerControlEnum
    
    func displayControl() {
        switch episodeMode {
        case .live:
            print("live")
        case .ad:
            print("ad")
        default:
            print("normal")
            
        }
    }
    
    
}


























