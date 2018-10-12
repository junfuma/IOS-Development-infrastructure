//
//  UIAsyncImageView.m
//  TaSayProject
//
//  Created by Mac on 15/6/25.
//  Copyright (c) 2015年 xubin. All rights reserved.
//

#import "UIAsyncImageView.h"
UIView* goBackgroundView;
UIImageView* goBackImageView;
@implementation UIAsyncImageView

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self!=nil) {
      
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
    }
    return self;
}

-(void)setImageAsyncWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



#pragma mark -- 单张图片（大图）
/*
 只能查看单张图片
 */

-(void)canClickItWithDuration:(CGFloat)duration ThumbUrl:(NSString *)thumbUrl{
    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapIt:)];
    [touch setNumberOfTapsRequired:1];
    self.userInteractionEnabled = YES;
    self.duration = duration;
    self.thumbUrl = thumbUrl;
    [self addGestureRecognizer:touch];
}

- (void)tapIt:(UIGestureRecognizer*)sender {
    [self showImage:(UIAsyncImageView *)sender.view];
}

- (void)removeWaitingView
{
    [_waitingView removeFromSuperview];
}


- (void)showImage:(UIAsyncImageView *)defaultImageView{
    UIImage *image = defaultImageView.image;
    
    window = [UIApplication sharedApplication].keyWindow;
    
    goBackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    goBackgroundView.backgroundColor = [UIColor blackColor];
    
    defaultRect = [defaultImageView convertRect:defaultImageView.bounds toView:window];//关键代码，坐标系转换
    
    //UIAsyncImageView的创建
    
     __weak UIAsyncImageView *imageViewWeak = self;
    UIAsyncImageView *imageView = [[UIAsyncImageView alloc]initWithFrame:defaultRect];
    
    
    SDWaitingView *waiting = [[SDWaitingView alloc] init];
    waiting.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-35, image.size.height/2-35, 70, 70);
    waiting.mode = SDWaitingViewProgressMode;
    _waitingView = waiting;
    [imageView addSubview:waiting];

    
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.thumbUrl] placeholderImage:[UIImage imageNamed:@"moren2.png"] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        imageViewWeak.pro = (CGFloat)receivedSize / expectedSize;
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [imageViewWeak removeWaitingView];
        
        if (error) {
            UILabel *label = [[UILabel alloc] init];
            label.bounds = CGRectMake(0, 0, 160, 30);
            label.center = CGPointMake(imageViewWeak.bounds.size.width * 0.5, imageViewWeak.bounds.size.height * 0.5);
            label.text = @"图片加载失败";
            label.font = sysFont(16);
            label.textColor = [UIColor whiteColor];
            label.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
            label.layer.cornerRadius = 5;
            label.clipsToBounds = YES;
            label.textAlignment = NSTextAlignmentCenter;
            [imageViewWeak addSubview:label];
        } else {
            imageView.image = image;
            [imageView setNeedsDisplay];
        }
        
    }];

    
    
  
//    if (self.thumbUrl) {
//        NSLog(@"self.thumbUrl=%@",self.thumbUrl);
//        [imageView setImageWithURLString:self.thumbUrl placeholderImage:[UIImage imageNamed:@"moren2.png"]];
//    }else{
//        imageView.image = image;
//    }
    imageView.tag = 1;
    [goBackgroundView addSubview:imageView];
    [window addSubview:goBackgroundView];
    
    
    //点击大图消失手势
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [goBackgroundView addGestureRecognizer:tap];
    
    //显示大图
    defaultImageView.alpha = 0;
    [UIView animateWithDuration:_duration animations:^{
        imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        goBackgroundView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)setPro:(CGFloat)progress2
{
    _pro = progress2;
    _waitingView.progress = progress2;
    
}
/*
 单击手势相应事件
 */
- (void)hideImage:(UITapGestureRecognizer*)tap{
    UIImageView *imageView = (UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:_duration animations:^{
        imageView.frame = defaultRect;
        goBackgroundView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    } completion:^(BOOL finished) {
        self.alpha = 1;
        [goBackgroundView removeFromSuperview];
    }];
    
}

 



- (void)showFadeIn:(UIImage *)image
{
   // [self setImageDependOnViewMode:image];
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5f];
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [transition setType:kCATransitionFade];
    [self.layer addAnimation:transition forKey:nil];
}
@end
