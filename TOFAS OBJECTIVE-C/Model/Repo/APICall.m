//
//  APICall.m
//  TOFAS OBJECTIVE-C
//
//  Created by Mac on 25.01.2024.
//

#import <Foundation/Foundation.h>
#import "APICall.h"

@implementation APICall

+ (void)performGETRequestWithCompletion:(void (^)(id responseObject, NSError *error))completion {
    NSString *urlString = @"https://jsonplaceholder.typicode.com/posts";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString
      parameters:nil
         headers:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (completion) {
            completion(responseObject, nil);
        }
    }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            completion(nil, error);
        }
    }];
}

+ (void)getPosts:(void (^)(NSMutableArray<PostModel *> *array))completionHandler {
    NSString *urlString = @"http://jsonplaceholder.typicode.com/posts";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSMutableArray<PostModel *> *postModels = [NSMutableArray array];
            for (NSDictionary *jsonDict in responseObject) {
                PostModel *postModel = [[PostModel alloc] initWithDictionary:jsonDict];
                [postModels addObject:postModel];
            }
           // NSLog(@"İstek başarılı! Alınan veri: %@", [[postModels objectAtIndex:27] body]);
            completionHandler(postModels);
        } else {
            NSLog(@"yanlışşş");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Hata oluştu: %@", error.localizedDescription);
    }];
}

@end

