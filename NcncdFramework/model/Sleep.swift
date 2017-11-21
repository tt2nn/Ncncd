//
//  Sleep.swift
//  Ncncd
//  睡眠数据实体
//  Created by lihaotian on 2017/11/9.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit

public class Sleep: NSObject {

    // 总睡眠时长，单位：分
    public var totalDuration = 0
    
    // 有效睡眠时长，单位：分
    public var effectiveDuration = 0
    
    // 深度睡眠时长，单位：分
    public var deepDuration = 0
    
    // 浅睡眠时长，单位：分
    public var lightDuration = 0
    
    // 采样起始时间戳（秒）
    public var beginTime = 0
    
    // 采样结束时间戳（秒）
    public var endTime = 0
    
}
