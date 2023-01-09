//
//  NSObject+HSKitAdd.m
//  AFNetworking
//
//  Created by 付晨曦 on 2023/1/9Monday.
//

#import "NSObject+HSKitAdd.h"
#import <objc/runtime.h>

@implementation NSObject (HSKitAdd)

+ (void)hs_swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel {
    
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method swizzledMethod = class_getInstanceMethod(class, newSel);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSel,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            newSel,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (NSString *)hs_className {
    
    return NSStringFromClass(self);
}

- (NSString *)hs_className {
    
    return [NSString stringWithUTF8String:class_getName([self class])];
}

@end
