//
//  NSMutableArray+Extension.m
//  MiaoTuProject
//
//  Created by 徐斌 on 16/7/5.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>
@implementation NSMutableArray (Extension)
//      static char overviewKey;
+(void)load{
    Method orginalMethod=class_getInstanceMethod(NSClassFromString(@"__NSArrayM") , @selector(addObject:));
    Method newMethd = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(gp_addObject:));
    method_exchangeImplementations(orginalMethod, newMethd);
    
   
 
    
}

-(void)gp_addObject:(id)object{
    if (object!=nil) {
        [self gp_addObject:object];
    }
}
@end
