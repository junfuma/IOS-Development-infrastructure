

#import "BaseConfig.h"

#ifdef Production
NSString *serverURL=@""; //正式环境。
#else
NSString *serverURL=@"http://test.coin.com/"; //测试环境

#endif


@implementation BaseConfig

static BaseConfig *_config;
+(BaseConfig *)config{
    @synchronized(self){
        if (_config == nil) {
            _config = [[BaseConfig alloc] init];
        }
    }
    return _config;
}
- (NSDictionary *)returnRoot
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSDictionary *root=[[NSDictionary alloc] initWithContentsOfFile:path];
    return root;
}
#pragma 得到本地tabbar 数据
-(NSArray *)getMainConfigList
{
    NSDictionary * root = [self returnRoot];
    NSArray *data=[[NSArray alloc] initWithArray:[root objectForKey:@"MainTabBar"]];
    return data;
}
- (void)countdownSecond:(NSInteger)seconds  returnTitle:(void(^)(NSString *title))returnTitle;
{
    if (_timer)
    {
        dispatch_source_cancel(_timer);
        //                dispatch_release(_timer);
        _timer = nil;
    }
    __block NSInteger timeout = seconds; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            //            dispatch_release(_timer);
            _timer = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.seconds = timeout  ;
                returnTitle(@"-1");
            });
        }else{
            
            int seconds = timeout % 121;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.seconds = timeout  ;
                returnTitle(strTime);
            });
            timeout--;
            
        }
    });
    
    dispatch_resume(_timer);
    
    
}
//
- (void)countUpSecond:(NSInteger)seconds endSeconds:(NSInteger)endSeconds returnTitle:(void(^)(NSString *title))returnTitle;
{
    if (_timer)
    {
        dispatch_source_cancel(_timer);
        //        dispatch_release(_timer);
        _timer = nil;
    }
    __block NSInteger timeout = seconds; //初始时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout >= endSeconds){ //计时结束，关闭
            dispatch_source_cancel(_timer);
            //            dispatch_release(_timer);
            _timer = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.seconds = timeout  ;
                returnTitle(@"03:00");
            });
        }else{
            
            int seconds = timeout % 61;
            int minute = timeout/ 61;
            NSString *strTime = [NSString stringWithFormat:@"%.2d:%.2d", minute,seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.seconds = timeout  ;
                returnTitle(strTime);
            });
            timeout++;
            
        }
    });
    
    dispatch_resume(_timer);
}
//定时器取消
- (void)stopNSTimer{
    if (_timer)
    {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

-(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
