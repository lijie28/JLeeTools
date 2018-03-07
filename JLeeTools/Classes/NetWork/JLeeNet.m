

#import "JLeeNet.h"
#import "JLeeUrl.h"


@implementation JLeeNet

+ (instancetype)sharedClient {
    static JLeeNet *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[JLeeNet alloc] initWithBaseURL:[NSURL URLWithString:[JLeeUrl getUrl]]];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/javascript",@"text/json", nil];

        if([_sharedClient.responseSerializer isKindOfClass:[AFJSONResponseSerializer class]]){
            ((AFJSONResponseSerializer *)(_sharedClient.responseSerializer)).removesKeysWithNullValues = YES;
        }
        
        // 设置超时时间
        [_sharedClient.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _sharedClient.requestSerializer.timeoutInterval = 10.f;
        [_sharedClient.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
    });
    


    return _sharedClient;
}


@end
