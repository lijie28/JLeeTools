

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>


@interface JLeeRequest : NSObject




+(NSURLSessionDataTask *)baseWithAppend:(NSString *)strUrl parameters:(NSDictionary *)parameters success:(void (^)(id))successBlock fail:(void (^)(NSString *, NSError *))failBlock;



+ (AFHTTPRequestOperation *)uploadImages:(NSArray *)imagesData imagesNames:(NSArray *)imagesNames imagesTypes:(NSArray *)imagesTypes  strUrl:(NSString *)strUrl parameters:(NSDictionary *)parameters typeName:(NSString *)typeName success:(void (^)(id info))successBlock fail:(void (^)(NSString *msg,NSError *error))failBlock progress:(void (^)(long long has,long long full,float rate))progressBlock;


@end




