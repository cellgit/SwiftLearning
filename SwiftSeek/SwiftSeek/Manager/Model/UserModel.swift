//
//  UserModel.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/3/1.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

//import Foundation
import UIKit

var UserInfo = NSKeyedUnarchiver.unarchiveObject(withFile: FilePath.filePath(.documentDirectory, senderPath: "/loginUserInfo.archiver")) as? UserInfoModel

class UserInfoModel: NSObject,NSCoding  {
    
    var userId : String = ""        // 用户id
    var phone : String = ""         // 注册手机号
    var token : String = ""
    var nickName : String = ""      // 用户昵称
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.userId, forKey: "userId")
        aCoder.encode(self.phone, forKey: "phone")
        aCoder.encode(self.token, forKey: "token")
        aCoder.encode(self.nickName, forKey: "nickName")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.userId = aDecoder.decodeObject(forKey: "userId") as! String
        self.phone = aDecoder.decodeObject(forKey: "phone") as! String
        self.token = aDecoder.decodeObject(forKey: "token") as! String
        self.nickName = aDecoder.decodeObject(forKey: "nickName") as! String
    }
    
    override init() {}
    
}
