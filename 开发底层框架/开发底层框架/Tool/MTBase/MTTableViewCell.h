//
//  MTTableViewCell.h
//  MiaoTuProject
//
//  Created by Mac on 16/3/10.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "IHTableViewCell.h"
#import "MTModel.h"

@interface MTTableViewCell : IHTableViewCell

@end

@interface homePageRiseAndFallCell :MTTableViewCell

@property (nonatomic,strong) UIImageView * iconImageVIew ;
@property (nonatomic,strong) UILabel * nameLB ;
@property (nonatomic,strong) UILabel * volumeLB;//成交量 ;
@property (nonatomic,strong) UILabel *yuanLB;//人民币
@property (nonatomic,strong) UILabel * dgainsLB;//涨幅 ;
@property (nonatomic,strong) UILabel *dollarLB;
@property (nonatomic,assign) homepageFallOrRoseType Type;//涨跌

@property (nonatomic,strong) HomePageRiseFallModel * model ;
- (void)setModel:(HomePageRiseFallModel *)model  type:(homepageFallOrRoseType)type ;


@end


@interface marketDeatilMessageCell :MTTableViewCell

@property (nonatomic,strong) UILabel * nameLB ;
@property (nonatomic,strong) UILabel * volumeLB;//成交量 ;
@property (nonatomic,strong) UILabel *yuanLB;//人民币
@property (nonatomic,strong) UILabel *dollarLB;
@property (nonatomic,strong) UILabel * dgainsLB;//涨幅 ;

@property (nonatomic,strong) MarketDetailMessageModel * model ;


@end

@interface tradingEntrustCell :MTTableViewCell

@property (nonatomic,strong) UILabel * buyOrSellLB ;
@property (nonatomic,strong) UILabel * nameLB;
@property (nonatomic,strong) UIButton * cancelBtn;

@property (nonatomic,strong) UILabel * tradingPriceLB;
@property (nonatomic,strong) UILabel * dealCountLB;
@property (nonatomic,strong) UILabel * tradingPriceContentLB;
@property (nonatomic,strong) UILabel * dealCountContentLB;
@property (nonatomic,strong) UILabel * tradingCountLB;
@property (nonatomic,strong) UILabel * tradingTimeLB;
@property (nonatomic,strong) UILabel * tradingCountContentLB;
@property (nonatomic,strong) UILabel * tradingTimeContentLB;;

//@property (nonatomic,strong) MarketDetailMessageModel * model ;


@end




@interface tradingCoinLatestcell :MTTableViewCell

@property (nonatomic,strong) UILabel * nameLB;
@property (nonatomic,strong) UILabel * priceLB ;
@property (nonatomic,strong) UILabel * fallOrRoseLB;


//@property (nonatomic,strong) MarketDetailMessageModel * model ;


@end




