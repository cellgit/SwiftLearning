//
//  BasicFunctionalViewController.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/3/30.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit

/// 船舰问题(函数式)

class BasicFunctionalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        /// 判断一个点是否在某区域内
        let p = Position.init(x: 0, y: 0)
        let shifted = p.shift(p.circle(radius: 7.1), by: Position(x: 5, y: 5))
        print("=======\(shifted(p))")
        
    }
}


/// “Region 类型将指代把 Position 转化为 Bool 的函数
typealias Region = (Position) -> Bool

typealias Distance = Double

struct Position {
    var x: Double
    var y: Double
}

extension Position {
    func within(range: Distance) -> Bool {
        return sqrt(x*x + y*y) <= range
    }
}

extension Position {
    func minus(_ p: Position ) -> Position {
        return Position(x: x - p.x, y: y - p.y)
    }
    var length: Double {
        return sqrt(x*x + y*y)
    }
}

struct Ship {
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
}

extension Ship {
    func canEngage(ship target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx*dx + dy*dy)
        return targetDistance <= firingRange
    }
}

extension Ship {
    func canSafelyEngage(ship target: Ship ) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx*dx + dy*dy)
        return targetDistance <= firingRange && targetDistance > unsafeRange
    }
}

extension Ship {
    func canSafelyEngage(ship target: Ship, friendly: Ship ) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx*dx + dy*dy)
        
        let friendlyDx = friendly.position.x - target.position.x
        let friendlyDy = friendly.position.y - target.position.y
        let friendlyDistance = sqrt(friendlyDx*friendlyDx + friendlyDy*friendlyDy)
        
        return targetDistance <= firingRange && targetDistance > unsafeRange && targetDistance > friendlyDistance
    }
}

extension Ship {
    func canSafelyEngage2(ship target: Ship, friendly: Ship) -> Bool {
        let targetDistance = target.position.minus(position).length
        let friendlyDistance = target.position.minus(target.position).length
        return targetDistance <= friendlyDistance
            && targetDistance > unsafeRange
            && targetDistance > friendlyDistance
    }
}


////------------------------------

extension Position {
    func circle(radius: Distance) -> Region {
        return {point in point.length <= radius}
    }
    
    func circle2(radius: Distance, center: Position) -> Region {
        return {point in point.minus(center).length <= radius}
    }
    
    // 判断区域偏移后,点是否在区域内
    func shift(_ region: @escaping Region, by offset: Position) -> Region {
        return {point in region(point.minus(offset))}
    }
}













