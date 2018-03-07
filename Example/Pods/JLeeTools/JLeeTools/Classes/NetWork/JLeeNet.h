

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "JLeeUrl.h"

@interface JLeeNet : AFHTTPSessionManager
+ (instancetype)sharedClient;

@end
