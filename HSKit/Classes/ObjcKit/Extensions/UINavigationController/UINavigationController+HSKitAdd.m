//
//  UINavigationController+HSKitAdd.m
//  AFNetworking
//
//  Created by 付晨曦 on 2023/1/9Monday.
//

#import "UINavigationController+HSKitAdd.h"

@implementation UINavigationController (HSKitAdd)

- (void)removeViewControllerWithClass:(Class)aClass {
    
    NSMutableArray <UIViewController *> *vcs = [NSMutableArray arrayWithArray:self.viewControllers];
    for (UIViewController *vc in self.viewControllers) {
        if ([vc isMemberOfClass:aClass]) {
            [vcs removeObject:vc];
        }
    }
    self.viewControllers = vcs;
}

@end
