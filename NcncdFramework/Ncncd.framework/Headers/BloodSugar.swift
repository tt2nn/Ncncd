//
//  BloodSugar.swift
//  Ncncd
//  血糖实体
//  Created by lihaotian on 2017/11/9.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit

public class BloodSugar: NSObject {

    // 血糖类型 1空腹 2餐后
    public var type = 0
    
    // 血糖数值
    public var value: Float = 0.0
    
    // 时间戳
    public var sampleTime = 0
    
}
