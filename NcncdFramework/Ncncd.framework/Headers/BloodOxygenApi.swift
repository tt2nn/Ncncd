//
//  BloodOxygenApi.swift
//  Ncncd
//  血氧数据
//  Created by lihaotian on 2017/11/10.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit

public class BloodOxygenApi: NSObject {

    // 协议
    public static var delegate: NcncdApiDelegate?
    
    /// 上传血氧数据
    ///
    /// - Parameters:
    ///   - appKey: AppKey
    ///   - appSecret: AppSecret
    ///   - data: 血氧数据
    ///   - telephone: 电话
    public static func uploadBloodOxygen(data: Array<BloodOxygen>, telephone: String){
        
        if NcncdConfigure.appKey.isEmpty || NcncdConfigure.appSecret.isEmpty {
            
            print("请配置appKey和appSecret")
            return
        }
        
        // 创建请求对象
        let request = CommonRequest();
        request.appKey = NcncdConfigure.appKey;
        request.timestamp = Int(Date().timeIntervalSince1970)
        request.telephone = telephone
        request.data = BloodOxygen.mj_keyValuesArray(withObjectArray: data).mj_JSONString()
        
        // 加密原数据拼接
        let dataEn = NcncdConfigure.appKey + "\(request.timestamp)" + request.telephone + request.data
        
        request.sign = EncryptUtil().encrypt(dataEn , by: NcncdConfigure.appSecret)
        
        // 上传血氧
        HttpSession.sendPost(url: URL_PATH_DATA_UPLOAD_BLOOD_OXYGEN, parameters: request.mj_keyValues(), httpCallBack: HttpHandler())
        
    }
    
    /// 响应协议实现
    struct HttpHandler: HttpCallBack {
        
        func start() {
            
            print("HTTP_START")
            delegate?.start()
        }
        
        func httpError(httpError: Any?) {
            
            print("HTTP_ERROR: " + "\(httpError)")
            delegate?.httpError(httpError: httpError as! Error)
        }
        
        func success(responseObject: Any?) {
            
            print("HTTP_SUCCESS: " + "\(responseObject)")
            delegate?.success()
        }
        
        func failure(responseObject: Any?) {
            
            print("HTTP_FAILURE: " + (responseObject as AnyObject).mj_JSONString())
            delegate?.failure(errNo: (responseObject as! CommonResponse).errNo, errMsg: (responseObject as! CommonResponse).errMsg)
        }
        
        func finish() {
            
            print("HTTP_FINISH")
            delegate?.finish()
        }
    }
}
