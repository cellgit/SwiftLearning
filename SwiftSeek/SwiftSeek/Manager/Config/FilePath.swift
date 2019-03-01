//
//  FilePath.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/3/1.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

class FilePath: NSObject {
    
    class func filePath(_ path: FileManager.SearchPathDirectory, senderPath: String?) -> String{
        if senderPath == ""{
            return ""
        }
        
        return NSSearchPathForDirectoriesInDomains(path, .userDomainMask, true)[0].appending(senderPath!)
    }
    
    class func isFileExistWithFilePath(filePath: String) -> Bool{
        if filePath == ""{
            return false
        }
        return FileManager.default.fileExists(atPath: filePath)
    }
    
}
