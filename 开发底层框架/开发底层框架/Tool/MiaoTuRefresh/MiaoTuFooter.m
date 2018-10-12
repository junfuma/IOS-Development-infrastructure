//
//  MiaoTuFooter.m
//  MiaoTuProject
//
//  Created by Mac on 16/4/7.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MiaoTuFooter.h"

@implementation MiaoTuFooter
#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    self.stateLabel.font=sysFont(13);
    self.stateLabel.textColor=cGrayLightColor;
    // 设置正在刷新状态的动画图片
    
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=9; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"f_%zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}
@end
