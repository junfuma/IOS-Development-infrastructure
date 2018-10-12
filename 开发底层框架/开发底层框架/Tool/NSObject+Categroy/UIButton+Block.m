
//

#import "UIButton+Block.h"
#import <objc/runtime.h>
static const void *UIButtonBlockKey = &UIButtonBlockKey;



@implementation UIButton (Block)
-(void)addActionHandler:(TouchedBlock)touchHandler{
    objc_setAssociatedObject(self, UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)actionTouched:(UIButton *)btn{
    TouchedBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}

- (void)initWithBlock:(ClickActionBlock)clickBlock for:(UIControlEvents)event{
    
    objc_setAssociatedObject(self, &UIButtonBlockKey, clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(goAction:) forControlEvents:event];
}



- (void)goAction:(UIButton *)sender{
    
    ClickActionBlock block = (ClickActionBlock)objc_getAssociatedObject(self, &UIButtonBlockKey);
    if (block) {
        block(sender);
    }
    
}
+ (void)setBorderColorbtn:(UIButton*)btn frame:(CGRect)frame borderWidth:(CGFloat)borderWidth radius:(CGFloat)radius RoundingCorners:(UIRectCorner)corners{

    
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:frame byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer * mask= [[CAShapeLayer alloc] init];
    mask.path = path.CGPath;
    btn.layer.mask = mask;
    
    CALayer * temp = [CALayer layer];
    [temp setBackgroundColor:[UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:0.001/1.0].CGColor];
    temp.frame = CGRectMake(borderWidth, borderWidth, frame.size.width - borderWidth * 2,frame.size.height - borderWidth * 2);
//    temp.frame = CGRectMake(borderWidth, borderWidth, 10,10);

    UIBezierPath * subPath = [UIBezierPath bezierPathWithRoundedRect:temp.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius - borderWidth, radius - borderWidth)];
    CAShapeLayer * subMask= [[CAShapeLayer alloc] initWithLayer:temp];
    subMask.path = subPath.CGPath;
    temp.mask = subMask;
    [btn.layer addSublayer:temp];
    btn.layer.borderWidth = 1.0f;
    btn.layer.borderColor =cDarkBorderColor.CGColor;
}
@end

