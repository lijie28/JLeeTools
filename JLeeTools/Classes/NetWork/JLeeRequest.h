

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "JLeeUrl.h"

@interface JLeeRequest : AFHTTPSessionManager
+ (instancetype)sharedClient;

@end
