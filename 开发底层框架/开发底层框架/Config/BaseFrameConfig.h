//
//  BaseFrameConfig.h
//  框架搭建
//
//  Created by 开拍网ios研发 on 2018/9/28.
//  Copyright © 2018年 开拍网ios研发. All rights reserved.
//

#ifndef BaseFrameConfig_h
#define BaseFrameConfig_h

#define KeyWindow [UIApplication sharedApplication].keyWindow
#define MainScreenW ([UIScreen mainScreen].bounds.size.width)
#define MainScreenH (IS_IPHONE_X ? ([UIScreen mainScreen].bounds.size.height - 34.f):[UIScreen mainScreen].bounds.size.height)



#define navBarHeight   self.navigationController.navigationBar.frame.size.height
#define MJFAlertShow(messageText,buttonName) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:(messageText) \
delegate:nil cancelButtonTitle:(buttonName) otherButtonTitles: nil];\
[alert show];

#define iOS7TopMargin 64 //导航栏44，状态栏20

#define ButtonHeight 44
#define NavigationBarHeight 44


#define  tabBarHeigh    (IS_IPHONE_X ? (49.f+34.f) : 49.f)
#define  tabBarTopHeight  (IS_IPHONE_X ? 40.f:20.f)

#define autoScaleW(width) [(AppDelegate *)[UIApplication sharedApplication].delegate autoScaleW:width]
#define autoScaleH(height) [(AppDelegate *)[UIApplication sharedApplication].delegate autoScaleH:height]

#define WindowWith    [device windowWith]

#endif /* BaseFrameConfig_h */
