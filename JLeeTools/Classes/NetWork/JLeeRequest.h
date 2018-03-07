

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
//#import "AFHTTPSessionManager.h"
#import "JLeeUrl.h"

@interface JLeeRequest : AFHTTPSessionManager
+ (instancetype)sharedClient;

@end
