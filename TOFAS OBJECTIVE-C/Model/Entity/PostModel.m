//
//  PostModel.m
//  TOFAS OBJECTIVE-C
//
//  Created by Mac on 25.01.2024.
//

#import <Foundation/Foundation.h>
#import "PostModel.h"

@implementation PostModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _postId = dictionary[@"id"];
        _title = dictionary[@"title"];
        _body = dictionary[@"body"];
        _userId = dictionary[@"userId"];
    }
    return self;
}

@end
