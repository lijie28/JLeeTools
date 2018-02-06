

#ifndef DiscoveryLand_Common_h
#define DiscoveryLand_Common_h
//默认坐标相关宏定义
#define NavigationBar_HEIGHT 44
#define UILABEL_DEFAULT_FONT_SIZE 20.0f

/********系统相关宏*******/
//当前系统版本
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])

#define iOS7Later ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)
#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define iOS11Later ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)
#define iOS9_1Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.1f)


//判断设备类型
#define iPhoneX ([UIScreen mainScreen].bounds.size.height == 812)
//#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)
//#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

/*
 屏幕适配
 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kFrameWidth self.view.frame.size.width
#define kFrameHeight self.view.frame.size.height

#define kWidth(R) (R/2)*(kScreenWidth)/375
#define kHeight(R) (iPhoneX?(((R)/2)*(kScreenHeight)/812):(((R)/2)*(kScreenHeight)/667))



//maasonry 约束
#define MAKE_MAS_TOP(R,Z) make.top.mas_equalTo(R).offset(Z);
#define MAKE_MAS_LEFT(R,Z) make.left.mas_equalTo(R).offset(Z);
#define MAKE_MAS_BOTTOM(R,Z) make.bottom.mas_equalTo(R).offset(Z);
#define MAKE_MAS_RIGHT(R,Z) make.right.mas_equalTo(R).offset(Z);



//定义大小
#define frameX(R) R.frame.origin.x
#define frameY(R) R.frame.origin.y
#define frameW(R) R.frame.size.width
#define frameH(R) R.frame.size.height

//布局
#define afterX(R) (frameX(R)+frameW(R))
#define afterY(R) (frameY(R)+frameH(R))


#define inTheMid(V,R) ((V)/2 - (R)/2)

#define inTheWMid(V,R) (kWidth(V)/2 - kWidth(R)/2)
#define inTheHMid(V,R) (kHeight(V)/2 - kHeight(R)/2)

#define inTheViewMidW(V,R) (frameW(V)/2 - kWidth(R)/2)
#define inTheViewMidH(V,R) (frameH(V)/2 - kHeight(R)/2)

#define inTheScreenMidW(R) (kScreenWidth/2 - kHeight(R)/2)

/********颜色相关宏***********/
//十六进制颜色
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kColor(R,G,B,A) [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
#define kWhiteColor     [UIColor whiteColor]
#define kLightGrayColor [UIColor lightGrayColor]
#define kBlackColor     [UIColor blackColor]
#define kClearColor     [UIColor clearColor]
#define kGrayColor      [UIColor grayColor]
#define kRedColor      [UIColor redColor]
#define kYellowColor      [UIColor yellowColor]
#define kGreenColor      [UIColor greenColor]


//应用程序主要色调
//#define kBaseGray UIColorFromRGB(0xeaeaea)
#define kBackGroundColor UIColorFromRGB(0xeaeaea)
#define kTextColor UIColorFromRGB(0x2b2b2b)
#define kLabelColor UIColorFromRGB(0x9f9f9f)
#define kBaseOrangeColor kColor(233,85,4,1)
#define kLineColor UIColorFromRGB(0xdbdbdb)
#define kHolderColor UIColorFromRGB(0xdbdbdb)
#define kFrameLineColor UIColorFromRGB(0xcfcfcf)

#define kRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

#define kTitle1Color UIColorFromRGB(0x333333)
#define kTitle2Color UIColorFromRGB(0x616161)
#define kTitle3Color UIColorFromRGB(0x999999)






#define SAFE_RELEASE(obj)     [obj release]; obj = nil;
//图片获取宏IMAGE会缓存到内存中
#define IMAGE1(img) (iPhone6?[UIImage imageNamed:[NSString stringWithFormat:@"%@-6",img]]:[UIImage imageNamed:img])
#define IMAGE(img) [UIImage imageNamed:img]
#define GetImageByName(name) iPhone6?[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@-6",name] ofType:@"png"]]:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]]
#endif

//Nslog
#ifdef SHOW_S_LOG
#define SLogDetail(s, ... ) NSLog(@"\r\nFile: ---------------------> %s\r\n---------------------> %s :Line->%d \r\nlogInfo=> %@",__FILE__,__func__, __LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__]);
#define SLog(s, ... ) NSLog(@"\r\n\r\n------------------------logInfo start------------------------\n%@",[NSString stringWithFormat:(s), ##__VA_ARGS__]);
#elif SHOW_S_LOG_AND_CONSOLE
#define SLogDetail(s, ... ) NSLog(@"\r\nFile: ---------------------> %s\r\n---------------------> %s :Line->%d \r\nlogInfo=> %@",__FILE__,__func__, __LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__]);[iConsole info:@"File: ----> %s\r\n------> %s :Line->%d \r\n---> %@",__FILE__,__func__, __LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__]];
#define SLog(s, ... ) NSLog(@"\r\n---------------------logInfo---------------------\n%@",[NSString stringWithFormat:(s), ##__VA_ARGS__]); [iConsole info:@"---------------------logInfo---------------------\n%@",[NSString stringWithFormat:(s), ##__VA_ARGS__]];
#elif SHOW_S_LOG_NONE
#define SLogDetail(s, ... )
#define SLog(s, ... )
#endif


#ifdef DEBUG
#define LOG_DEBUG(...) NSLog(__VA_ARGS__)
#else
#define LOG_DEBUG(...)
#endif

#define LOG_FUNC LOG_DEBUG(@"%s",__func__)


//printf
#ifdef SHOW_S_PRINTF
#define SPrintf(s, ... ) (printf("\r\n---> SPrintf =>" s,##__VA_ARGS__));
#else
#define SPrintf(s, ... )
#endif
/********网络请求*******/

//请求成功网络
#define kSuccessNetwork [result[@"code"]integerValue] == 200


//请求失败后封装
#define ERRORCODE @"errorCode"
#define MESSAGE @"message"
#define kHTTPRequestFormater @"{\"errCode\":\"%@\",\"rspMsg\":\"%@\"}"

//操作成功的返回码
#define kSuccessResultCode @"0"



//无网络连接的返回码
#define kNoNetworkResultCode @"9001"

#define kNoNetworkResultMsg @"请检查网络连接后重试"

//服务端返回信息无法解析返回码
#define kBadResDataResultCode @"9002"

//服务端返回信息为空的返回码
#define kEmptyResultCode @"9003"

//服务端返回信息为空的JSON字符串
#define kEmptyResultMsg @"请求失败，请重试"

#define kErrorUploadImageMsg @"图片正在上传，请稍后再试"


//每页请求的数据条数
#define kNumOfPageSize @"10"
#define kNumOfPageIntSize 10
#define kPagePerModelOutTime [PagePerModel sharedInstance].strOutTime
#define kPagePerModelPerPageFollow [PagePerModel sharedInstance].strPerPageFollow
#define kPagePerModelPerPageMyOrd [PagePerModel sharedInstance].strPerPageMyOrd
#define kPagePerModelPerPageOften [PagePerModel sharedInstance].strPerPageOften
#define kPagePerModelPerPagePro [PagePerModel sharedInstance].strPerPagePro

#define kStartPage 0
#define k8Font [UIFont systemFontOfSize:8.0f]
#define k9Font [UIFont systemFontOfSize:9.0f]
#define k10Font [UIFont systemFontOfSize:10.0f]
#define k11Font [UIFont systemFontOfSize:11.0f]
#define k12Font [UIFont systemFontOfSize:12.0f]
#define k13Font [UIFont systemFontOfSize:13.0f]
#define k14Font [UIFont systemFontOfSize:14.0f]
#define k15Font [UIFont systemFontOfSize:15.0f]
#define k16Font [UIFont systemFontOfSize:16.0f]
#define k17Font [UIFont systemFontOfSize:17.0f]
#define k18Font [UIFont systemFontOfSize:18.0f]
#define k20Font [UIFont systemFontOfSize:20.0f]
#define k22Font [UIFont systemFontOfSize:22.0f]
#define k24Font [UIFont systemFontOfSize:24.0f]
#define k26Font [UIFont systemFontOfSize:26.0f]
#define k35Font [UIFont systemFontOfSize:35.0f]
#define k38Font [UIFont systemFontOfSize:38.0f]
#define k40Font [UIFont systemFontOfSize:40.0f]
#define k50Font [UIFont systemFontOfSize:50.0f]



//跳页设置
#define PUSH_NEXT_VC(R) R *vc = [[R alloc]init];\
[self.navigationController pushViewController:vc animated:YES];

// app 用户推送状态
#define APP_PUSH_TYPE @([[UIApplication sharedApplication] currentUserNotificationSettings].types)


// app名称
#define APP_NAME  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

// app build版本
#define APP_BUILT  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

// app版本
#define APP_VERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//手机序列号
#define PHONE_UUID [[[UIDevice currentDevice] identifierForVendor]UUIDString]

//手机别名： 用户定义的名称
#define USER_PHONE_NAME [[UIDevice currentDevice] name]

//手机系统名称：iOS
#define PHONE_SYSTEM_NAME [[UIDevice currentDevice] systemName]

//手机系统版本
#define PHONE_SYSTEM_VERSION [[UIDevice currentDevice] systemVersion]

//手机型号
#define PHONE_MODEL [self iphoneType]


