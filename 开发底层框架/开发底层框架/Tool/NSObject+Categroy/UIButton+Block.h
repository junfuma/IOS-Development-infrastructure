

#import <UIKit/UIKit.h>
typedef void (^TouchedBlock)(NSInteger tag);

typedef void (^ClickActionBlock) (id obj);



@interface UIButton (Block)

-(void)addActionHandler:(TouchedBlock)touchHandler;

- (void)initWithBlock:(ClickActionBlock)clickBlock for:(UIControlEvents)event;


+ (void)setBorderColorbtn:(UIButton*)btn frame:(CGRect)frame borderWidth:(CGFloat)borderWidth radius:(CGFloat)radius RoundingCorners:(UIRectCorner)corners;
@end
