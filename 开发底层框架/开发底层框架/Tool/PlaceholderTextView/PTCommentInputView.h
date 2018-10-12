//
//  PTCommentInputView.h
//  Test
//
//  Created by linzhennan on 16/3/24.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PlaceholderTextView.h"
typedef void(^PTCommentChangeFrameBlock)(CGFloat offsetY);
@protocol CommentDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView;
-(void)didSendText:(UITextView *)textView text:(NSString *)text;
@end


@interface PTCommentInputView : UIView <UITextViewDelegate>
@property (nonatomic,weak) id<CommentDelegate> delegate;
@property(nonatomic,assign)BOOL isEdit;
@property (nonatomic, strong) PlaceholderTextView *inputTextView;
@property (nonatomic, copy) PTCommentChangeFrameBlock changeFrame;

@end
