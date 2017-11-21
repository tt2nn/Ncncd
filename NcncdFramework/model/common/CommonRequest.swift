//
//  CommonRequest.swift
//  Ncncd
//  通用请求实体类
//  Created by lihaotian on 2017/11/9.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit

public class CommonRequest: NSObject {
    
    // AppKey
    public var appKey = ""
    
    // 时间戳
    public var timestamp = 0
    
    // 手机号
    public var telephone = ""
    
    // 数据
    public var data = ""
    
    // 签名
    public var sign = ""
}
