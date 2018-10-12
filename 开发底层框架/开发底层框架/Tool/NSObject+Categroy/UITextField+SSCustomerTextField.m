//
//  UITextField+SSCustomerTextField.m
//  SSClient
//
//  Created by sgsl on 2017/11/5.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "UITextField+SSCustomerTextField.h"

@implementation UITextField (SSCustomerTextField)
/**
 *  给UITextField设置右侧的图片
 *
 *  @param textField UITextField
 *  @param imageName 图片名称
 */
+(void)setRightViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName{
    
    UIImageView *rightView = [[UIImageView alloc]init];
    rightView.image = [UIImage imageNamed:imageName];
    rightView.size = CGSizeMake(40, 40);
    rightView.contentMode = UIViewContentModeCenter;
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
    
}
@end
