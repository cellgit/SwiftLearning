//
//  SWEnum.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/1/23.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

public enum PastelPoint: Int {
    case left
    case top
    case right
    case bottom
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    
    var point: CGPoint {
        switch self {
        case .left: return CGPoint(x: 0.0, y: 0.5)
        default:
            return CGPoint(x: 0.0, y: 0.5)
        }
    }
    
    
    
}
