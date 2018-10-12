//
//  MTTabBar.h
//  MiaoTuProject
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTTabBar;
@protocol MTTabBarDelegate <NSObject>
/**
 *  工具栏按钮被选中, 记录从哪里跳转到哪里. (方便以后做相应特效)
 */
- (void) tabBar:(MTTabBar *)tabBar selectedFrom:(NSInteger) from to:(NSInteger)to;

@end
@interface MTTabBar : UIView
{
    UIImageView *_gcRedImageView;
    UIImageView *_meRedImageView;
  //  CornerView *_cornerview;
     int indexFlag;
    
}
//@property (nonatomic,strong)UIButton *lastBtn ;
@property (nonatomic, weak) UIButton *selectedBtn;
@property(nonatomic,weak) id<MTTabBarDelegate> delegate;
/**
 *  使用特定图片来创建按钮, 这样做的好处就是可扩展性. 拿到别的项目里面去也能换图片直接用
 *
 *  @param num         普通状态下的图片
 *  @param num 选中状态下的图片
 */

-(void)setMessageNum:(int)num;
-(void)setMeRedHidden:(BOOL)isHidden;
-(void)setGCRedHidden:(BOOL)isHidden;//首页红点
- (void)clickBtn:(UIButton *)button;
-(void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *) selectedImage index:(int)index title:(NSString *)title;
@end
