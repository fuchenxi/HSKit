//
//  LSBannerInfo.m
//  iShow
//
//  Created by fcx on 2022/4/15.
//  Copyright © 2022 AdTiger. All rights reserved.
//

#import "LSBannerInfo.h"

@implementation LSBannerInfo

- (instancetype)initWithCoder:(NSCoder *)coder {
  
    return [self yy_modelInitWithCoder:coder];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    
    [self yy_modelEncodeWithCoder:coder];
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"bannerID" : @"id"};
}

@end

@implementation LSBannerImageInfo

- (instancetype)initWithCoder:(NSCoder *)coder {
  
    return [self yy_modelInitWithCoder:coder];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    
    [self yy_modelEncodeWithCoder:coder];
}

@end
