//
//  BaseColorConfig.h
//  框架搭建
//
//  Created by 开拍网ios研发 on 2018/9/28.
//  Copyright © 2018年 开拍网ios研发. All rights reserved.
//

#ifndef BaseColorConfig_h
#define BaseColorConfig_h


#define  cBgColor     [UIColor colorWithHexString:@"#001638"]   //背景色
#define clinecolor  [UIColor colorWithHexString:@"#04204C"]
#define  cBlackColor  [UIColor colorWithHexString:@"#333333"]   //深黑色
#define  cWhiteColor    [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1.0]   //白色字体
#define  cLightWhiteColor    [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0]   //浅白色字体

#define  cDarkBlueColor             [UIColor colorWithRed:33/255.0 green:76/255.0 blue:146/255.0 alpha:1/1.0]//暗蓝色
#define  chightLightgreenColor      [UIColor colorWithRed:53/255.0 green:112/255.0 blue:205/255.0 alpha:1/1.0]
#define  cMoreHightLightgreenColor  [UIColor colorWithRed:74/255.0 green:144/255.0 blue:226/255.0 alpha:1/1.0]// ..绿色
#define  cblueLightColor            [UIColor colorWithRed:85/255.0 green:136/255.0 blue:216/255.0 alpha:1.0]   //浅绿色字体

#define  cGrayLightColor    [UIColor colorWithHexString:@"#666666"]   //浅灰色字体
#define  cBrickRedColor      [UIColor colorWithHexString:@"#B6553B"]  //砖红色
#define  cLightgreenColor  [UIColor colorWithHexString:@"#35A353 "]   //亮绿色

#define  cBorderColor     [UIColor colorWithHexString:@"#3570CD"] //边框色
#define  cDarkBorderColor     [UIColor colorWithHexString:@"#214C92"] //暗色的边框色


#define SDColor(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]

#define Global_mainBackgroundColor SDColor(248, 248, 248, 1)


#define RGBA(r,g,b,a)                            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b)                            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]



#endif /* BaseColorConfig_h */
