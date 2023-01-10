//
//  LSBaseModel.h
//  iShow
//
//  Created by 付晨曦 on 2022/3/9.
//  Copyright © 2022 AdTiger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

NS_ASSUME_NONNULL_BEGIN

/// TODO: - 自定义协议 封装YYModel
@interface LSBaseModel : NSObject <YYModel>

/// 因为涉及到继承关系链, 调用super防止逻辑丢失
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
