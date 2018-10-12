//
//  IHBaseUser.h
//  IHBaseProject
//
//  Created by yaoyongping on 13-1-7.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//自己的ID
#define USERMODEL [IHBaseUser shareUserModel]

@interface IHBaseUser : NSObject{
   
 
}

@property(nonatomic,copy) NSString *userId;
@property(nonatomic,copy) NSString *userName;  //生日
@property(nonatomic,copy) NSString *firstName;   //性别
@property(nonatomic,copy) NSString *lastName;
@property(nonatomic,copy) NSString *userType;//姓名
@property(nonatomic,copy) NSString *userStatus;  //昵称
@property(nonatomic,copy) NSString *seatId; //邮箱
@property(nonatomic,copy) NSString *inviteId; //QQ
@property(nonatomic,copy) NSString *inviteCode;//头像
@property(nonatomic,copy) NSString *createTm;  //地址
@property(nonatomic,copy) NSString *pcTicket ;  //描述
@property(nonatomic,copy) NSString *authorType ;
@property(nonatomic,copy) NSString *mobile; //
@property(nonatomic,copy) NSString *nickName;
@property(nonatomic,copy) NSString *bbsPostCounts;
@property(nonatomic,copy) NSString *bbsCommontCounts;
@property(nonatomic,copy) NSString *authSatuts;
@property(nonatomic) BOOL isLogin;
@property(nonatomic) BOOL isRegister;//判断是否注册



-(void)setUserInfo:(NSDictionary *)dic;
-(void)removeUserModel;
+(IHBaseUser*)shareUserModel;
@end


