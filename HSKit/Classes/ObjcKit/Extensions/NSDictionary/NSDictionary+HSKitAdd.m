//
//  NSDictionary+HSKitAdd.m
//  AFNetworking
//
//  Created by 付晨曦 on 2023/1/9Monday.
//

#import "NSDictionary+HSKitAdd.h"

@implementation NSDictionary (HSKitAdd)

#ifdef DEBUG

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level; i++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"{\n"];
    NSArray *allKey = self.allKeys;
    for (int i = 0; i < allKey.count; i++) {
        id value = self[allKey[i]];
        NSString *lastSymbol = (allKey.count == i + 1) ? @"" : @";";
        if ([value respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [mStr appendFormat:@"\t%@%@ = %@%@\n", tab, allKey[i], [value descriptionWithLocale:locale indent:level + 1], lastSymbol];
        } else {
            [mStr appendFormat:@"\t%@%@ = %@%@\n", tab, allKey[i], value, lastSymbol];
        }
    }
    [mStr appendFormat:@"%@}", tab];
    return mStr;
}

#endif

@end
