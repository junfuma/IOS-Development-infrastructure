//
//  MTDataSource.h
//  MiaoTuProject
//
//  Created by Mac on 16/3/10.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "IHDataSource.h"

@interface MTDataSource : IHDataSource

@end

@interface homePageRiseAndFallDataSource : MTDataSource

@property (nonatomic,assign) homepageFallOrRoseType sendType;//涨跌

@end

@interface marketDeatilMessageDataSource : MTDataSource


@end
@interface tradingEntrustDataSource : MTDataSource


@end
@interface tradingCoinLatestMessageDataSource : MTDataSource


@end


