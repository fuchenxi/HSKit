//
//  NSObject+HSKitAdd.h
//  AFNetworking
//
//  Created by 付晨曦 on 2023/1/9Monday.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HSKitAdd)

+ (void)hs_swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;

+ (NSString *)hs_className;

- (NSString *)hs_className;

@end

NS_ASSUME_NONNULL_END
