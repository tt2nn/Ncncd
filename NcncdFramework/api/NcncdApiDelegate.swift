//
//  NcncdApiDelegate.swift
//  Ncncd
//  API协议
//  Created by lihaotian on 2017/11/9.
//  Copyright © 2017年 miao. All rights reserved.
//

import Foundation

public protocol NcncdApiDelegate {
    
    /// 开始
    func start()
    
    /// 请求成功
    func success()
    
    /// Http错误
    ///
    /// - Parameter httpError: 错误信息
    func httpError(httpError: Error)
    
    ///
    ///
    /// - Parameters:
    ///   - errNo: 错误代码
    ///   - errMsg: 错误信息
    func failure(errNo: Int, errMsg: String)
    
    /// 结束
    func finish()
}
