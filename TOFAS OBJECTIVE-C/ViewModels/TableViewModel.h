//
//  TableViewModel.h
//  TOFAS OBJECTIVE-C
//
//  Created by Mac on 25.01.2024.
//

#ifndef TableViewModel_h
#define TableViewModel_h

#import "PostModel.h"

@interface TableViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<PostModel *> *list;

- (void)performGetRequest:(void (^)(void))completionHandler;
- (PostModel *)getOnePostAtIndex:(NSInteger)index;
- (NSInteger)getCount;


@end
#endif /* TableViewModel_h */
