//
//  APICall.h
//  TOFAS OBJECTIVE-C
//
//  Created by Mac on 25.01.2024.
//
#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "PostModel.h"

#ifndef APICall_h
#define APICall_h

typedef PostModel MOUSE;

@interface APICall : NSObject

+ (void)performGETRequestWithCompletion:(void (^)(id responseObject, NSError *error))completion;
+ (void)getPosts:(void (^)(NSMutableArray<PostModel *> *posts))completionHandler;

@end

#endif /* APICall_h */
