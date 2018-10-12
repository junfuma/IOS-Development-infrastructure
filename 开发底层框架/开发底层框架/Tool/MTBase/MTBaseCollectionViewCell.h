//
//  MTBaseCollectionViewCell.h
//  MiaoTuProject
//
//  Created by Mac on 16/3/16.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTModel.h"

@interface MTBaseCollectionViewCell : UICollectionViewCell

@end

@interface CreateBSCollectionViewCell : MTBaseCollectionViewCell
{
    UIImageView *imgView;
    UIButton *_btn;
}
@property(nonatomic,strong)UIButton *deleteBtn;
@property(nonatomic,strong)UIAsyncImageView *imgView;


@end
