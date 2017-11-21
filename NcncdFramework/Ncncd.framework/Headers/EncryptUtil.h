//
//  EncryptUtil.h
//  Ncncd
//  加密工具类
//  Created by lihaotian on 2017/11/9.
//  Copyright © 2017年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptUtil : NSObject

/**
 加密处理

 @param data 数据
 @param key AppSecret
 @return 加密结果
 */
-(NSString*) encrypt: (NSString*)data by: (NSString*)key;

@end
