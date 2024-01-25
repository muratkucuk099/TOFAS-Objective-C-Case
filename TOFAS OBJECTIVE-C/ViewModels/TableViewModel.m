//
//  TableViewModel.m
//  TOFAS OBJECTIVE-C
//
//  Created by Mac on 25.01.2024.
//

#import <Foundation/Foundation.h>
#import "APICall.h"
#import "TableViewModel.h"

@implementation TableViewModel

- (id)init {
    self = [super init];
    if (self) {
        _list = [NSMutableArray array];
    }
    return self;
}

- (void)performGetRequest:(void (^)(void))completionHandler{
    
    [APICall getPosts:^(NSMutableArray<PostModel *> *posts) {
        self.list = posts;
        completionHandler();
    }];
}

- (PostModel *)getOnePostAtIndex:(NSInteger)index {
    return self.list[index];
}

- (NSInteger)getCount {
    return self.list.count;
}


@end

