//
//  HeartRate.swift
//  Ncncd
//  心率数据实体
//  Created by lihaotian on 2017/11/10.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit

public class HeartRate: NSObject {
    
    // 平均心率
    public var average: Float = 0.0
    
    // 最大心率
    public var max: Float = 0.0
    
    // 最低心率
    public var min: Float = 0.0
    
    // 采样起始时间戳（秒）
    public var beginTime = 0
    
    // 采样结束时间戳（秒）
    public var endTime = 0

}
