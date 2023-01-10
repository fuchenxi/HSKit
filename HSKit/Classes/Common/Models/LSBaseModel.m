//
//  LSBaseModel.m
//  iShow
//
//  Created by 付晨曦 on 2022/3/9.
//  Copyright © 2022 AdTiger. All rights reserved.
//

#import "LSBaseModel.h"

@implementation LSBaseModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return nil;
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return nil;
}

+ (NSArray<NSString *> *)modelPropertyBlacklist {
    return nil;
}

+ (NSArray<NSString *> *)modelPropertyWhitelist {
    return nil;
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    return YES;
}

#ifdef DEBUG

- (NSString *)description {
    return [self yy_modelDescription];
}

#endif

@end
