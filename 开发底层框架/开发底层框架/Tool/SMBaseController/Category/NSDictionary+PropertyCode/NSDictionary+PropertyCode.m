
#import "NSDictionary+PropertyCode.h"

@implementation NSDictionary (PropertyCode)

// isKindOfClass:判断下是否是当前类或者子类
// @property (nonatomic ,strong) NSString  *text;
// @property (nonatomic ,assign) NSInteger  reposts_count;
// @property (nonatomic ,assign) NSArray  *pic_urls;
- (void)propertyCode
{
    
    // 属性跟字典的key一一对应
    NSMutableString *codes = [NSMutableString string];
    // 遍历字典中所有key取出来
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        // key:属性名
        NSString *code;
        if ([obj isKindOfClass:[NSString class]]) {
             code = [NSString stringWithFormat:@"@property (nonatomic ,strong,nullable) NSString<Optional> *%@;",key];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"@property (nonatomic ,assign,nullable) BOOL<Optional> %@;",key];
        }else if ([obj isKindOfClass:[NSNumber class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic ,assign,nullable) NSInteger<Optional> %@;",key];
        }else if ([obj isKindOfClass:[NSArray class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic ,strong,nullable) NSArray<Optional> *%@;",key];
        }else if ([obj isKindOfClass:[NSDictionary class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic ,strong,nullable) NSDictionary<Optional> *%@;",key];
        }
         
        [codes appendFormat:@"\n%@\n",code];
        
    }];
    
    NSLog(@"%@",codes);
    
}

@end
