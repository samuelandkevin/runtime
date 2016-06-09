//
//  YHCommentData.h
//  PikeWay
//
//  Created by kun on 16/5/15.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHUserInfo.h"

@interface YHCommentData : NSObject

@property (nonatomic, copy) NSString    *publishTime;//发布时间
@property (nonatomic,strong)YHUserInfo  *authorInfo;//评论人
@property (nonatomic, copy) NSString    *commentId;
@property (nonatomic, copy) NSString    *commentContent;//评论内容


@property (nonatomic, copy) NSString    *contentId;
@property (nonatomic, copy) NSString    *content;
@property (nonatomic, copy) NSString    *authorId;
@property (nonatomic, copy) NSString    *authorName;
@property (nonatomic, copy) NSURL       *authorAvatarUrl;
@property (nonatomic, copy) NSString    *toReplyId;
//@property (nonatomic, retain)NSDate    *postDate;


@property (nonatomic, retain) YHCommentData *toReplyCommentData;

@end
