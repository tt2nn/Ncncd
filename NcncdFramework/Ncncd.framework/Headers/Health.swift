//
//  Health.swift
//  Ncncd
//  健康数据实体类
//  Created by lihaotian on 2017/11/9.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit

public class Health: NSObject {
    
    // bmi指数
    public var bmi: Float = 0.0
    
    // 体脂率
    public var bodyFat: Float = 0.0
    
    // 肌肉率
    public var muscleRate: Float = 0.0
    
    // 水分
    public var moistureRate: Float = 0.0
    
    // 骨密度
    public var bmd: Float = 0.0
    
    // 基础代谢率
    public var bmr: Float = 0.0
    
    // 时间戳（秒）
    public var sampleTime = 0

}
