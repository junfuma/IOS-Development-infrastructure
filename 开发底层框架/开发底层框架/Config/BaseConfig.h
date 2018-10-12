

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define ConfigManager                [BaseConfig config]


//#define Production   //不注销，为开启生产环境

extern NSString* serverURL;

@interface BaseConfig : NSObject
{
    dispatch_source_t _timer;
    
}

+(BaseConfig *)config;
-(NSArray *)getMainConfigList;

@property (nonatomic) NSInteger seconds ;

-(UIImage*) createImageWithColor:(UIColor*) color;
- (void)countdownSecond:(NSInteger)seconds  returnTitle:(void(^)(NSString *title))returnTitle;
- (void)countUpSecond:(NSInteger)seconds endSeconds:(NSInteger)endSeconds returnTitle:(void(^)(NSString *title))returnTitle;

//定时器取消
- (void)stopNSTimer;
@end


