#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HSKitExtensions.h"
#import "NSArray+HSKitAdd.h"
#import "NSDictionary+HSKitAdd.h"
#import "NSObject+HSKitAdd.h"
#import "UILabel+HSKitAdd.h"
#import "UINavigationController+HSKitAdd.h"
#import "HSKit.h"

FOUNDATION_EXPORT double HSKitVersionNumber;
FOUNDATION_EXPORT const unsigned char HSKitVersionString[];

