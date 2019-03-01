//
//  TypealiasManager.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/3/1.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

typealias SWSucceedTypealias = (_ model: SWSucceedParamsStruct<Any>) -> Void
typealias SWErrorTypealias = (_ errorMsg : String) -> Void

typealias SWSucceedMultiTypealias = (_ model: SWSucceedMultiParamsStruct<Any>) -> Void
