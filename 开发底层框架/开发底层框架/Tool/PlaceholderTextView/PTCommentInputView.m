//
//  PTCommentInputView.m
//  Test
//
//  Created by linzhennan on 16/3/24.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import "PTCommentInputView.h"

@interface PTCommentInputView () {
    CGFloat _offsetY;
}

@end

@implementation PTCommentInputView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor=[UIColor redColor];
        self.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.8].CGColor;
        self.layer.borderWidth = 1;
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.inputTextView];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNotification:) name:UITextViewTextDidBeginEditingNotification object:self];
    }
    return self;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    CGFloat height = [self contentSizeOfText:textView.text]; // 计算文字高度
    _offsetY = self.frame.origin.y;
    if (height != self.frame.size.height) {
        _offsetY = _offsetY - (height - self.frame.size.height);
        self.frame = CGRectMake(0, _offsetY, [UIScreen mainScreen].bounds.size.width, height);
        if (self.changeFrame) {
            self.changeFrame(_offsetY); // 回调
        } 
    }
    textView.frame = CGRectMake(0, 3, self.frame.size.width, height);
}




- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSString *str = textView.text;
    str = [str stringByAppendingString:text];
    
    if ([text isEqualToString:@"\n"]) {
        //   if (self.delegate || [self.delegate respondsToSelector:@selector(didSendText:text:)]) {
        [self.delegate didSendText:textView text:textView.text];
        //  }
        
        return NO;
    }
    
    CGFloat height = [self contentSizeOfText:str]; // 计算文字高度
    _offsetY = self.frame.origin.y;
    if (height != self.frame.size.height) {
        _offsetY = _offsetY - (height - self.frame.size.height);
        self.frame = CGRectMake(0, _offsetY, [UIScreen mainScreen].bounds.size.width, height);
        if (self.changeFrame) {
            self.changeFrame(_offsetY); // 回调
        }
    }
    textView.frame = CGRectMake(0, 3, self.frame.size.width, height);
    
    
  
 
    
   
    
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    self.isEdit=NO;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    self.isEdit=YES;
    textView.text = @"";
    return YES;
}

#pragma mark - 自定义方法
/**
 *  计算字符串的高度
 *
 *  @param text 需要计算的字符串
 *
 *  @return 字符串的高度
 */
- (CGFloat)contentSizeOfText:(NSString *)text {
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width-10, 1000);
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attr = @{NSFontAttributeName:sysFont(15)};
    
    CGRect tmpRect = [text boundingRectWithSize:size
                                        options:options
                                     attributes:attr
                                        context:nil];
  
    CGFloat h = tmpRect.size.height;
    if (h <= 120) { // 不超过五行，不能滚动
     //   h=+6;
        if (h<60 && h>40) {
            h=56;
        }else if (h>70 && h<80){
            h=81;
        }else if (h>90&&h<110){
            h=106;
        }
        self.inputTextView.scrollEnabled = NO;
    } else { // 超过五行，只显示五行，能滚动
        self.inputTextView.scrollEnabled = YES;
        h = 130.335938;
    }
    
    if (h < 35) { // 自身的最小高度
        h = 35;
    }
    return h;
}





#pragma mark - getter
- (PlaceholderTextView *)inputTextView {
    if (!_inputTextView) {
        _inputTextView = [[PlaceholderTextView alloc] initWithFrame:CGRectMake(0, 3, self.frame.size.width, 35)];
        _inputTextView.returnKeyType = UIReturnKeySend;
        _inputTextView.delegate = self;
      
        _inputTextView.font = sysFont(15);
        _inputTextView.scrollEnabled = NO;
        _inputTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _inputTextView;
}

@end
