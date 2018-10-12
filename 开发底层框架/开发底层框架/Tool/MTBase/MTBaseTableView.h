//
//  MTBaseTableView.h
//  MiaoTuProject
//
//  Created by Mac on 16/3/10.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "IHBaseTableView.h"
#import "Contant.h"
@interface MTBaseTableView : IHBaseTableView

@property (nonatomic,assign) homepageFallOrRoseType Type;//首页涨幅榜和跌幅榜

-(void)setupData:(NSArray *)data index:(int)index;


@end
