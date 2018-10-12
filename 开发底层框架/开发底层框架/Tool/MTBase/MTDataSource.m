//
//  MTDataSource.m
//  MiaoTuProject
//
//  Created by Mac on 16/3/10.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MTDataSource.h"

@implementation MTDataSource

@end

@implementation homePageRiseAndFallDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *identify=@"homePageRiseAndFallCell";
    homePageRiseAndFallCell* cell=(homePageRiseAndFallCell *)[tableView dequeueReusableCellWithIdentifier:identify  ];
    
    if (cell==nil) {
        cell=[[homePageRiseAndFallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    if (datasource.count==0) {
        return cell;
    }
//    cell.indexPath=indexPath;
    cell.delegate=(id<BCBaseTableViewCellDelegate>)self.attributes;
    
    HomePageRiseFallModel *model = datasource[indexPath.row];
    cell.indexPath = indexPath ;
    [cell setModel:model type:self.sendType];
    return cell;
    
}
@end


@implementation marketDeatilMessageDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *identify=@"marketDeatilMessagecell";
    marketDeatilMessageCell* cell=(marketDeatilMessageCell *)[tableView dequeueReusableCellWithIdentifier:identify  ];
    
    if (cell==nil) {
        cell=[[marketDeatilMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    if (datasource.count==0) {
        return cell;
    }
    //    cell.indexPath=indexPath;
    cell.delegate=(id<BCBaseTableViewCellDelegate>)self.attributes;
    
    MarketDetailMessageModel *model = datasource[indexPath.row];
    cell.indexPath = indexPath ;
//    cell.model = model;
    return cell;
    
}
@end
@implementation tradingEntrustDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *identify=@"marketDeatilMessagecell";
    tradingEntrustCell* cell=(tradingEntrustCell *)[tableView dequeueReusableCellWithIdentifier:identify  ];
    
    if (cell==nil) {
        cell=[[tradingEntrustCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    if (datasource.count==0) {
        return cell;
    }
    //    cell.indexPath=indexPath;
    cell.delegate=(id<BCBaseTableViewCellDelegate>)self.attributes;
    cell.backgroundColor = cBgColor ;
//    MarketDetailMessageModel *model = datasource[indexPath.row];
    cell.indexPath = indexPath ;
    //    cell.model = model;
    return cell;
    
}
@end


@implementation tradingCoinLatestMessageDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *identify=@"tradingCoinLatestcell";
    tradingCoinLatestcell* cell=(tradingCoinLatestcell *)[tableView dequeueReusableCellWithIdentifier:identify ];
    
    if (cell==nil) {
        cell=[[tradingCoinLatestcell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    if (datasource.count==0) {
        return cell;
    }
    //    cell.indexPath=indexPath;
    cell.delegate=(id<BCBaseTableViewCellDelegate>)self.attributes;
    cell.backgroundColor = cBgColor ;
    //    MarketDetailMessageModel *model = datasource[indexPath.row];
    cell.indexPath = indexPath ;
    //    cell.model = model;
    return cell;
    
}
@end
