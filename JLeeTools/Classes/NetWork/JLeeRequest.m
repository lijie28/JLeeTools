//
//  SendRequest.m
//
//  Created by mac on 14-5-6.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "JLeeRequest.h"
#import "JLeeNet.h"
#import "JLeeUrl.h"
//#import <MBProgressHUD/MBProgressHUD.h>


@implementation JLeeRequest

+(NSURLSessionDataTask *)baseWithAppend:(NSString *)strUrl parameters:(NSDictionary *)parameters success:(void (^)(id))successBlock fail:(void (^)(NSString *, NSError *))failBlock

{
    return [[JLeeNet sharedClient]POST:[[JLeeUrl getUrl] stringByAppendingString:strUrl] parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON){
            if (successBlock) {//添加成功信息block返回
                    successBlock(JSON);
            }
    }failure:^(NSURLSessionDataTask *task, NSError *error){
        if (failBlock) {//失败信息返回
            failBlock(nil, error);
        }
    }];
}







+ (AFHTTPRequestOperation *)uploadImages:(NSArray *)imagesData imagesNames:(NSArray *)imagesNames imagesTypes:(NSArray *)imagesTypes  strUrl:(NSString *)strUrl parameters:(NSDictionary *)parameters typeName:(NSString *)typeName success:(void (^)(id info))successBlock fail:(void (^)(NSString *msg,NSError *error))failBlock progress:(void (^)(long long has,long long full,float rate))progressBlock
{
    if (imagesData.count != imagesNames.count !=imagesTypes.count) return nil;
    
    
    //如果没有传入图片，直接返回
    if (imagesData == nil) return nil;
    if (imagesData.count == 0) return nil;
    for (id obj in imagesData) {
        if (![obj isKindOfClass:[NSData class]]) {
            return nil;
        }
    }
    if (strUrl == nil) return nil;
    
    //与后台协定NAME
    NSString *name = (typeName == nil)? @"file":typeName;
    
    
    //POST参数
    
    // 接口的 AFHTTPSession 不能提供一种方法来设置进度块。相反，必须进行以下操作：
    // 1. 创建一个 `AFHTTPRequestSerializer`，利用此对象可以创建一个request请求.
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    
    // 2. 获取一个`NSMutableURLRequest`对象.
    NSMutableURLRequest *request =
    [serializer multipartFormRequestWithMethod:@"POST"//请求方法为post
                                     URLString:[[JLeeUrl getUrl] stringByAppendingString:strUrl]//上传文件URL
                                    parameters:parameters//上传的其他参数
                     constructingBodyWithBlock:^(id<AFMultipartFormData> formData)//设置请求体
     {
         
         for (NSInteger i = 0 ; i< imagesData.count ; i++) {
             
             NSData *data = imagesData[i];
             NSString *fileName = imagesNames[i];
             
             NSString *type = (imagesTypes == nil) ?@"image/jpg":imagesTypes[i];
             
             
             [formData appendPartWithFileData:data name:name fileName:fileName mimeType:type];
             
         }

     }error:nil];//playerError为错误对象
    
    
    // 3. 创建并使用 `AFHTTPRequestOperationManager`，然后创建一个异步请求操作对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestOperation *operation =
    
    [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {

            
            if (successBlock) {//添加成功信息block返回
                
                successBlock(responseObject);
                
            }
            
            
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failBlock([NSString stringWithFormat:@"%@",operation],error);
        
    }];
    
    
    // 4. 设置上传进度块.
    [operation setUploadProgressBlock:^(NSUInteger __unused bytesWritten,
                                        long long totalBytesWritten,//已上传的字节数
                                        long long totalBytesExpectedToWrite)//总字节数
     {
         //每次上传一部分数据，都会调用此块输出进度，可以在此方法中设置你的上传进度条页面
//         NSLog(@"上传Wrote %lld/%lld", totalBytesWritten, totalBytesExpectedToWrite);
         float rate = 0.0;
         rate = totalBytesWritten/totalBytesExpectedToWrite;
         if (progressBlock) {
             progressBlock(totalBytesWritten,totalBytesExpectedToWrite,rate);
         }
         
     }];
    
    //5. 开始上传任务
    [operation start];
    
    return operation;
    

}

@end
