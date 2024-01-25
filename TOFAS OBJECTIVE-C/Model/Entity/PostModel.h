//
//  PostModel.h
//  TOFAS OBJECTIVE-C
//
//  Created by Mac on 25.01.2024.
//

#ifndef PostModel_h
#define PostModel_h

@interface PostModel : NSObject

@property (nonatomic, strong) NSNumber *postId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSNumber *userId;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
#endif /* PostModel_h */
