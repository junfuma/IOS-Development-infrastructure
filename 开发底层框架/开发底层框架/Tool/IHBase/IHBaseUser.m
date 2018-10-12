//
//  IHBaseUser.m
//  IHBaseProject
//
//  Created by yaoyongping on 13-1-7.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "IHBaseUser.h"
static IHBaseUser *user=nil;

@implementation IHBaseUser



+(IHBaseUser*)shareUserModel
{
	@synchronized(self){
		if (user == nil) {
			user = [[IHBaseUser alloc] init];
		}
	}
    return user;
}


-(void)setUserInfo:(NSDictionary *)dic{
    
    self.userId = [NSString stringWithFormat:@"%@",dic[@"userId"]];
    self.userName = [NSString stringWithFormat:@"%@",dic[@"userName"]];
    self.firstName = [NSString stringWithFormat:@"%@",dic[@"firstName"]];
    self.lastName = [NSString stringWithFormat:@"%@",dic[@"lastName"]];
    self.userType = [NSString stringWithFormat:@"%@",dic[@"userType"]];
    self.userStatus = [NSString stringWithFormat:@"%@",dic[@"userStatus"]];
    self.seatId = [NSString stringWithFormat:@"%@",dic[@"seatId"]];
    self.inviteId = [NSString stringWithFormat:@"%@",dic[@"inviteId"]];
    self.inviteCode = [NSString stringWithFormat:@"%@",dic[@"inviteCode"]];
    self.createTm = [NSString stringWithFormat:@"%@",dic[@"createTm"]];
    self.pcTicket = [NSString stringWithFormat:@"%@",dic[@"pcTicket"]];
    self.authorType = [NSString stringWithFormat:@"%@",dic[@"authorType"]];
    self.mobile = [NSString stringWithFormat:@"%@",dic[@"mobile"]];
    self.nickName = [NSString stringWithFormat:@"%@",dic[@"nickName"]];
    self.bbsPostCounts = [NSString stringWithFormat:@"%@",dic[@"bbsPostCounts"]];
    self.bbsCommontCounts = [NSString stringWithFormat:@"%@",dic[@"bbsCommontCounts"]];
    self.authSatuts = [NSString stringWithFormat:@"%@",dic[@"authSatuts"]];

    self.isLogin=YES;
    
    
    [IHUtility saveDicUserDefaluts:dic key:kUserDefalutLoginInfo];
//    [self saveMessage];
    NSLog(@"----%@",[IHUtility getUserDefalutsDicKey:kUserDefalutLoginInfo]);
    
}
- (void)saveMessage
{
    
//    NSDictionary* ext2 = [NSDictionary dictionaryWithObjectsAndKeys:
//                          [NSString stringWithFormat:@"%@",USERMODEL.userId],kToUserID,
//                          USERMODEL.userNickname,kToNickName,
//                          USERMODEL.userIcon,kToHeadImage,
//                          nil];
//
//    NSDictionary *dic2=[IHUtility getUserDefalutsDicKey:kMessageDic];
//    NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithDictionary:dic2];
//
//    [dic setObject:ext2 forKey:[NSString stringWithFormat:@"u%@",USERMODEL.userId]];
//    [IHUtility setUserDefaultDic:dic key:kMessageDic];
    
}

-(void)removeUserModel{
    USERMODEL.userId=@"";
    USERMODEL.userName = @"";
    USERMODEL.firstName = @"";
    USERMODEL.lastName = @"";
    USERMODEL.userType = @"";
    USERMODEL.userStatus = @"";
    USERMODEL.seatId = @"";
    USERMODEL.inviteId = @"";
    USERMODEL.inviteCode = @"";
    USERMODEL.createTm = @"";
    USERMODEL.pcTicket = @"";
    USERMODEL.authorType = @"";
    USERMODEL.mobile = @"";
    USERMODEL.nickName = @"";
    USERMODEL.bbsPostCounts = @"";
    USERMODEL.bbsCommontCounts = @"";
    USERMODEL.authSatuts = @"";
    USERMODEL.isLogin=NO;
    USERMODEL.isRegister = NO;

    
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    [userDefaluts removeObjectForKey:kUserDefalutLoginInfo];
    [userDefaluts synchronize];
}



@end
