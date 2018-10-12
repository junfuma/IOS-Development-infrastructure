//
//  IHTextBaseTextField.h
//  XFDesigners
//
//  Created by yaoyongping on 12-12-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IHTextBaseTextField : UITextField{
    
}

-(void)setLeftViewIcon:(UIImage *)image;
@end

@interface UITextFieldLogin:IHTextBaseTextField
{
}

-(void)drawRect:(CGRect)rect;
-(void)setLeftImage:(UIImage *)image;
-(void)refreshTextField:(BOOL)editing;
@end

@interface IHTextField : UITextField{
    
}

 
@end

