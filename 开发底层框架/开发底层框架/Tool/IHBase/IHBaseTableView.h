//
//  IHBaseTableView.h
//  IHBaseProject
//
//  Created by yaoyongping on 13-1-8.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IHDataSource.h"

@interface IHBaseTableView : UIView<UITableViewDelegate>{
    
    UITableView *table;
    IHDataSource *datasource;
    int styleIndex;
    BOOL allowEdit;
    float tableViewCellHeight;
    NSObject *attribute;
}
@property(nonatomic,retain)IHDataSource *datasource;
@property(nonatomic)BOOL allowEdit;
@property(nonatomic,assign)UITableView *table;
@property(nonatomic)float tableViewCellHeight;
@property(nonatomic)int styleIndex;
@property(nonatomic,assign)NSObject *attribute;

-(id)initWithFrame:(CGRect)frame tableviewStyle:(UITableViewStyle)tableviewStyle;

-(void)setupData:(NSArray *)data index:(int)index;
-(float)getCellHeight;

@end
