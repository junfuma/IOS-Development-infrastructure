//
//  IHTableViewCell.h
//  XFDesigners
//
//  Created by yaoyongping on 12-12-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class IHTableViewCell;
typedef enum{
    KPHomePageFallRoseListTableViewCell, //首页涨跌幅
   KPTradingCancelTableViewCell, //撤单
    KPTradingDetailTableViewCell, //撤单
}BCTableViewCellAction;

@protocol BCBaseTableViewCellDelegate<NSObject>

@optional
-(void)BCtableViewCell:(IHTableViewCell *)cell action:(BCTableViewCellAction)action indexPath:(NSIndexPath *)indexPath attribute:(NSObject *)attribute;
-(void)changeVideoUrl:(IHTableViewCell *)cell  indexPath:(NSIndexPath *)indexPath attribute:(NSObject *)attribute;
-(void)addShopCat:(IHTableViewCell *)cell action:(BCTableViewCellAction)action indexPath:(NSIndexPath *)indexPath imageView:(UIImageView *)imageView;

@end


@interface IHTableViewCell : UITableViewCell{
    NSDictionary *_data;
    id<BCBaseTableViewCellDelegate>delegate;
}
@property(nonatomic)float cellHeight;
@property(nonatomic,retain)NSObject *attribute;
@property(nonatomic,assign) id<BCBaseTableViewCellDelegate>delegate;

@property(nonatomic,retain) NSIndexPath *indexPath;
@property(nonatomic)NSInteger tag;
//-(void)setData:(NSDictionary *)dic;
//-(NSDictionary *)data;
@end


@interface IHMemberCenterCell : IHTableViewCell{
    NSDictionary *_member;

    @private
    UILabel *lblTitle;
    UIImageView *icon;
}

-(void)setMember:(NSDictionary *)dic; 
@end
