//
//  User.swift
//  Ncncd
//  用户实体 用于注册用户
//  Created by lihaotian on 2017/11/14.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit

class User: NSObject {

    // 1男 2女 0保密
    var sex = 0
    
    // 体重 kg
    var weight: Float = 0.0
    
    // 身高 cm
    var height = 0
    
    // 生日 yyyy-mm-dd
    var birthday = ""
    
}
