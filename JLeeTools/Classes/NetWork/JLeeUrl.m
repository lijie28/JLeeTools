//
//  JLeeUrl.m
//  JLeeTools
//
//  Created by 李杰 on 2018/3/6.
//

#import "JLeeUrl.h"

@implementation JLeeUrl
{
    NSString *baseUrl;
}


#pragma mark - 单例

static id _instance;

+ (instancetype)setUrl:(NSString *)url
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] initWithUrl:url];
    });
    return _instance;
}


+ (NSString *)getUrl
{
    return [_instance getUrl];
}

- (NSString *)getUrl
{
    return baseUrl;
}


- (void)setUrl:(NSString *)url
{
    baseUrl = url;
}

- (instancetype)initWithUrl:(NSString *)url
{
    _instance = [_instance init];
    [_instance setUrl:url];
    return _instance;
}



+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}


- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}


@end
