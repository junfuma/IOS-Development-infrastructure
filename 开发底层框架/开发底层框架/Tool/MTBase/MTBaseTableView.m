//
//  MTBaseTableView.m
//  MiaoTuProject
//
//  Created by Mac on 16/3/10.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MTBaseTableView.h"

@implementation MTBaseTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setupData:(NSArray *)data index:(int)index{
    if (datasource!=nil) {
        //      [datasource release];
        datasource=nil;
    }
    [self.table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.styleIndex=index;
    if (self.datasource==nil) {
    
         if (index ==1){
             homePageRiseAndFallDataSource*dataSource = [[homePageRiseAndFallDataSource alloc]init];//
             dataSource.sendType = self.Type ;
             self.datasource = dataSource;
         }else if (index ==2){
             marketDeatilMessageDataSource*dataSource = [[marketDeatilMessageDataSource alloc]init];//
             self.datasource = dataSource;
         }else if (index ==3){
             tradingEntrustDataSource*dataSource = [[tradingEntrustDataSource alloc]init];//
             self.datasource = dataSource;
         }else if (index ==4){
             tradingCoinLatestMessageDataSource*dataSource = [[tradingCoinLatestMessageDataSource alloc]init];//
             self.datasource = dataSource;
         }
        
    }
    
    self.datasource.attributes=self.attribute;
    self.datasource.allowEdit=self.allowEdit;
    self.datasource.datasource=data;
    self.table.backgroundView=nil;
    self.table.backgroundColor=[UIColor clearColor];
    self.table.dataSource=self.datasource;
    if (self.datasource!=nil) {
        [self.table reloadData];
    }
    
    
}



-(float)getCellHeight{
//    int index=self.styleIndex;
    return self.tableViewCellHeight;
}



@end
