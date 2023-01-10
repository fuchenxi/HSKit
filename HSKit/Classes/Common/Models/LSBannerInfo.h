//
//  LSBannerInfo.h
//  iShow
//
//  Created by fcx on 2022/4/15.
//  Copyright © 2022 AdTiger. All rights reserved.
//

#import "LSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

#define kBannerRatio (65.f / 363.f)

@class LSBannerImageInfo;

@interface LSBannerInfo : LSBaseModel <NSCoding>

@property (nonatomic, copy) NSString *bannerID;
@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *start_at;
@property (nonatomic, copy) NSString *end_at;
@property (nonatomic, strong) LSBannerImageInfo *banner;

@end

@interface LSBannerImageInfo : LSBaseModel <NSCoding>

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *text;

@end

NS_ASSUME_NONNULL_END
