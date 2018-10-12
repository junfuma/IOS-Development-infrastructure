//
//  MTTableViewCell.m
//  MiaoTuProject
//
//  Created by Mac on 16/3/10.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MTTableViewCell.h"


@implementation MTTableViewCell

@end

@implementation homePageRiseAndFallCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = cBgColor ;
        
        self.iconImageVIew = [UIImageView new];
        self.iconImageVIew.image = Image(@"fanlai_icon-40");
        [self.contentView addSubview:self.iconImageVIew];
        [self.iconImageVIew mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(15);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];
        
       self.nameLB = [UILabel new];
       self.nameLB.text = @"BTC/KTC";
       self.nameLB.textColor = cWhiteColor ;
        self.nameLB.font = sysFont(14);
        self.nameLB.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageVIew.mas_right).with.offset(5);
            make.centerY.equalTo(self.iconImageVIew.mas_centerY).with.offset(-10);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(21);
        }];
     
        self.volumeLB = [UILabel new];
       self.volumeLB.text = @"成交量 0.343";
       self.volumeLB.textColor = cDarkBlueColor ;
        self.volumeLB.font = sysFont(11);
        self.volumeLB.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_volumeLB];
        [self.volumeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageVIew.mas_right).with.offset(5);
            make.centerY.equalTo(self.iconImageVIew.mas_centerY).with.offset(9.5);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(18);
        }];
        
        self.yuanLB = [UILabel new];
        self.yuanLB.text = @"3223.32";
        self.yuanLB.textColor = cWhiteColor ;
        self.yuanLB.font = sysFont(14);
        self.yuanLB.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.yuanLB];
        [self.yuanLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.iconImageVIew.mas_centerY).with.offset(-10);
            make.centerX.equalTo(self.contentView.mas_centerX).with.offset(0);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(21);
        }];
        
        self.dollarLB = [UILabel new];
        self.dollarLB.text = @"$2121.12";
        self.dollarLB.textColor = cWhiteColor ;
        self.dollarLB.font = sysFont(11);
        self.dollarLB.textAlignment = NSTextAlignmentCenter ;
        [self.contentView addSubview:self.dollarLB];
        [self.dollarLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.iconImageVIew.mas_centerY).with.offset(10);
            make.centerX.equalTo(self.contentView.mas_centerX).with.offset(0);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(18);
        }];
        
        self.dgainsLB = [UILabel new];
        self.dgainsLB.text = @"+1.67%";
        self.dgainsLB.textColor = cWhiteColor ;
        self.dgainsLB.font = sysFont(14);
//        self.dgainsLB.backgroundColor = [UIColor colorWithRed:53/255.0 green:163/255.0 blue:83/255.0 alpha:1/1.0];
        self.dgainsLB.clipsToBounds = YES;
        self.dgainsLB.layer.cornerRadius = 5 ;
        self.dgainsLB.textAlignment = NSTextAlignmentCenter ;
        [self.contentView addSubview:_dgainsLB];
        [self.dgainsLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(30);
        }];
        
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [self.contentView addGestureRecognizer:tap];
    }
    return self;
    
}
- (void)setModel:(HomePageRiseFallModel *)model  type:(homepageFallOrRoseType)type{
    self.model = model ;
    if (type == KP_homepageFall) {
        self.dgainsLB.backgroundColor = cBrickRedColor;
    } else {
        self.dgainsLB.backgroundColor = [UIColor colorWithRed:53/255.0 green:163/255.0 blue:83/255.0 alpha:1/1.0];
    }
}
-(void)tapClick:(UITapGestureRecognizer *)tap{
    if ([self.delegate respondsToSelector:@selector(BCtableViewCell:action:indexPath:attribute:)]) {
        [self.delegate BCtableViewCell:self action:KPHomePageFallRoseListTableViewCell indexPath:self.indexPath attribute:nil];
    }
}
@end


@implementation marketDeatilMessageCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = cBgColor ;
        
        self.nameLB = [UILabel new];
        self.nameLB.text = @"BTC/KTC";
        self.nameLB.textColor = cWhiteColor ;
        self.nameLB.font = sysFont(14);
        self.nameLB.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.nameLB];
        [self.nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.centerY.equalTo(self.contentView.mas_centerY).with.offset(-10);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(21);
        }];
        
        self.volumeLB = [UILabel new];
        self.volumeLB.text = @"成交量 0.343";
        self.volumeLB.textColor = cDarkBlueColor ;
        self.volumeLB.font = sysFont(11);
        self.volumeLB.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_volumeLB];
        [self.volumeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.centerY.equalTo(self.contentView.mas_centerY).with.offset(10);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(18);
        }];
        
        self.yuanLB = [UILabel new];
        self.yuanLB.text = @"3223.32";
        self.yuanLB.textColor = cWhiteColor ;
        self.yuanLB.font = sysFont(14);
        self.yuanLB.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.yuanLB];
        [self.yuanLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).with.offset(-10);
            make.centerX.equalTo(self.contentView.mas_centerX).with.offset(0);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(21);
        }];
        
        self.dollarLB = [UILabel new];
        self.dollarLB.text = @"$2121.12";
        self.dollarLB.textColor = cWhiteColor ;
        self.dollarLB.font = sysFont(11);
        self.dollarLB.textAlignment = NSTextAlignmentCenter ;
        [self.contentView addSubview:self.dollarLB];
        [self.dollarLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).with.offset(10);
            make.centerX.equalTo(self.contentView.mas_centerX).with.offset(0);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(18);
        }];
        
        self.dgainsLB = [UILabel new];
        self.dgainsLB.text = @"+1.67%";
        self.dgainsLB.textColor = cWhiteColor ;
        self.dgainsLB.font = sysFont(14);
        self.dgainsLB.backgroundColor = [UIColor colorWithRed:53/255.0 green:163/255.0 blue:83/255.0 alpha:1/1.0];
        self.dgainsLB.clipsToBounds = YES;
        self.dgainsLB.layer.cornerRadius = 5 ;
        self.dgainsLB.textAlignment = NSTextAlignmentCenter ;
        [self.contentView addSubview:_dgainsLB];
        [self.dgainsLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).with.offset(0);
            make.right.mas_equalTo(-15);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(30);
        }];
        
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [self.contentView addGestureRecognizer:tap];
    }
    return self;
    
}
- (void)setModel:(MarketDetailMessageModel *)model
{
    self.model = model ;
}
-(void)tapClick:(UITapGestureRecognizer *)tap{
    if ([self.delegate respondsToSelector:@selector(BCtableViewCell:action:indexPath:attribute:)]) {
        [self.delegate BCtableViewCell:self action:KPHomePageFallRoseListTableViewCell indexPath:self.indexPath attribute:nil];
    }
}
@end

@implementation tradingEntrustCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.buyOrSellLB = [UILabel new];
        self.buyOrSellLB.text = MyLocalized(@"buy");
        self.buyOrSellLB.textColor = cLightgreenColor ;
        self.buyOrSellLB.font = sysFont(15);
        self.buyOrSellLB.textAlignment = NSTextAlignmentLeft ;
        [self.contentView addSubview:self.buyOrSellLB];
        [self.buyOrSellLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(15);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(22);
        }];
        
        self.nameLB = [UILabel new];
        self.nameLB.text = @"BTC/HKT";
        self.nameLB.textColor = cblueLightColor ;
        self.nameLB.font = sysFont(15);
        self.nameLB.textAlignment = NSTextAlignmentLeft ;
        [self.contentView addSubview:self.nameLB];
        [self.nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.equalTo(self.buyOrSellLB.mas_right).with.offset(15);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(22);
        }];
        
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cancelBtn setTitle:MyLocalized(@"cancellations") forState:UIControlStateNormal];
        [self.cancelBtn setTitleColor:chightLightgreenColor forState:UIControlStateNormal];
        self.cancelBtn.titleLabel.font = sysFont(11) ;
        [self.cancelBtn addTarget:self action:@selector(cancelCoinClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.cancelBtn.clipsToBounds = YES ;
        self.cancelBtn.layer.cornerRadius = 4 ;
        self.cancelBtn.layer.borderColor = cblueLightColor .CGColor;
        self.cancelBtn.layer.borderWidth = .5 ;
        [self.contentView addSubview:self.cancelBtn];
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.width.mas_equalTo(48);
            make.height.mas_equalTo(18);
        }];
        
        self.tradingPriceLB = [UILabel new];
        self.tradingPriceLB.text = MyLocalized(@"Entrust the price");
        self.tradingPriceLB.textColor = cDarkBlueColor ;
        self.tradingPriceLB.font = sysFont(11);
        self.tradingPriceLB.textAlignment = NSTextAlignmentLeft ;
        [self.contentView addSubview:self.tradingPriceLB];
        [self.tradingPriceLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.buyOrSellLB.mas_bottom).with.offset(10);
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(18);
        }];
        
        self.tradingPriceContentLB = [UILabel new];
        self.tradingPriceContentLB.text = @"1232.33";
        self.tradingPriceContentLB.textColor = cblueLightColor ;
        self.tradingPriceContentLB.font = sysFont(11);
        self.tradingPriceContentLB.textAlignment = NSTextAlignmentRight ;
        [self.contentView addSubview:self.tradingPriceContentLB];
        
        [self.tradingPriceContentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.buyOrSellLB.mas_bottom).with.offset(10);
            make.right.equalTo(self.contentView.mas_left).with.offset(MainScreenW/2.0-12.5);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(18);
        }];
        
        self.dealCountLB = [UILabel new];
        self.dealCountLB.text = MyLocalized(@"Clinch a deal the quantity");
        self.dealCountLB.textColor = cDarkBlueColor ;
        self.dealCountLB.font = sysFont(11);
        self.dealCountLB.textAlignment = NSTextAlignmentLeft ;
        [self.contentView addSubview:self.dealCountLB];
        [self.dealCountLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tradingPriceLB.mas_bottom).with.offset(10);
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(18);
        }];
        
        self.dealCountContentLB = [UILabel new];
        self.dealCountContentLB.text = @"1232.33";
        self.dealCountContentLB.textColor = cblueLightColor ;
        self.dealCountContentLB.font = sysFont(11);
        self.dealCountContentLB.textAlignment = NSTextAlignmentRight ;
        [self.contentView addSubview:self.dealCountContentLB];
        [self.dealCountContentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tradingPriceLB.mas_bottom).with.offset(10);
            make.right.equalTo(self.contentView.mas_left).with.offset(MainScreenW/2.0-12.5);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(18);
        }];
        
        
        self.tradingCountLB = [UILabel new];
        self.tradingCountLB.text = MyLocalized(@"Entrust the number");
        self.tradingCountLB.textColor = cDarkBlueColor ;
        self.tradingCountLB.font = sysFont(11);
        self.tradingCountLB.textAlignment = NSTextAlignmentLeft ;
        [self.contentView addSubview:self.tradingCountLB];
        [self.tradingCountLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.buyOrSellLB.mas_bottom).with.offset(10);
            make.left.equalTo(self.contentView.mas_left).with.offset(MainScreenW/2.0 + 12.5);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(18);
        }];
        
        self.tradingCountContentLB = [UILabel new];
        self.tradingCountContentLB.text = @"1232.33";
        self.tradingCountContentLB.textColor = cblueLightColor ;
        self.tradingCountContentLB.font = sysFont(11);
        self.tradingCountContentLB.textAlignment = NSTextAlignmentRight ;
        [self.contentView addSubview:self.tradingCountContentLB];
        
        [self.tradingCountContentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.buyOrSellLB.mas_bottom).with.offset(10);
            make.right.equalTo(self.contentView.mas_right).with.offset(-15.0);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(18);
        }];
        
        self.tradingTimeLB = [UILabel new];
        self.tradingTimeLB.text = MyLocalized(@"Entrust the time");
        self.tradingTimeLB.textColor = cDarkBlueColor ;
        self.tradingTimeLB.font = sysFont(11);
        self.tradingTimeLB.textAlignment = NSTextAlignmentLeft ;
        [self.contentView addSubview:self.tradingTimeLB];
        [self.tradingTimeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tradingPriceLB.mas_bottom).with.offset(10);
            make.left.equalTo(self.contentView.mas_left).with.offset(MainScreenW/2.0+12.5);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(18);
        }];
        
        self.tradingTimeContentLB = [UILabel new];
        self.tradingTimeContentLB.text = @"18:02 09/22";
        self.tradingTimeContentLB.textColor = cblueLightColor ;
        self.tradingTimeContentLB.font = sysFont(11);
        self.tradingTimeContentLB.textAlignment = NSTextAlignmentRight ;
        [self.contentView addSubview:self.tradingTimeContentLB];
        [self.tradingTimeContentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tradingPriceLB.mas_bottom).with.offset(10);
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(18);
        }];
        
        UILabel *lineLB = [UILabel new];
        lineLB.backgroundColor = [UIColor colorWithHexString:@"#04204C"];
        [self.contentView addSubview:lineLB];
        [lineLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tradingTimeContentLB.mas_bottom).with.offset(10);
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.width.mas_equalTo(MainScreenW-30);
            make.height.mas_equalTo(1);
        }];
        
        
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [self.contentView addGestureRecognizer:tap];
        
    }
    return self ;
}
- (void)cancelCoinClicked:(UIButton*)btn{
    if ([self.delegate respondsToSelector:@selector(BCtableViewCell:action:indexPath:attribute:)]) {
        [self.delegate BCtableViewCell:self action:KPTradingCancelTableViewCell indexPath:self.indexPath attribute:nil];
    }
}
-(void)tapClick:(UITapGestureRecognizer *)tap{
    if ([self.delegate respondsToSelector:@selector(BCtableViewCell:action:indexPath:attribute:)]) {
        [self.delegate BCtableViewCell:self action:KPTradingDetailTableViewCell indexPath:self.indexPath attribute:nil];
    }
}
@end

@implementation tradingCoinLatestcell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.nameLB = [UILabel new];
        self.nameLB.text = @"BTC/HKT";
        self.nameLB.textColor = cWhiteColor ;
        self.nameLB.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        self.nameLB.textAlignment = NSTextAlignmentLeft ;
        [self.contentView addSubview:self.nameLB];
        [self.nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(19);
        }];
        
        self.priceLB = [UILabel new];
        self.priceLB.text = @"5134.55";
        self.priceLB.textColor = cBrickRedColor ;
        self.priceLB.font = sysFont(12);
        self.priceLB.textAlignment = NSTextAlignmentCenter ;
        [self.contentView addSubview:self.priceLB];
        [self.priceLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(19);
        }];
        
        self.fallOrRoseLB = [UILabel new];
        self.fallOrRoseLB.text = @"0.65%";
        self.fallOrRoseLB.textColor = cblueLightColor ;
        self.fallOrRoseLB.font = sysFont(12);
        self.fallOrRoseLB.textAlignment = NSTextAlignmentRight ;
        [self.contentView addSubview:self.fallOrRoseLB];
        [self.fallOrRoseLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(19);
        }];
        
        
    }
    return self ;
}
@end

