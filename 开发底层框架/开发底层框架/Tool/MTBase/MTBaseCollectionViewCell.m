//
//  MTBaseCollectionViewCell.m
//  MiaoTuProject
//
//  Created by Mac on 16/3/16.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MTBaseCollectionViewCell.h"

@implementation MTBaseCollectionViewCell

@end

@implementation CreateBSCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.imgView=[[UIAsyncImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self.contentView addSubview:self.imgView];
        
        self.deleteBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        UIImage *img=Image(@"fb_close.png");
        self.deleteBtn.frame=CGRectMake(frame.size.width-15, 0, img.size.width, img.size.height);
        [self.deleteBtn setBackgroundImage:img forState:UIControlStateNormal];
        [self.contentView addSubview:self.deleteBtn];
        
        
    }
    return self;
}
@end

