

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface JLeeNet : AFHTTPSessionManager
+ (instancetype)sharedClient;

@end
