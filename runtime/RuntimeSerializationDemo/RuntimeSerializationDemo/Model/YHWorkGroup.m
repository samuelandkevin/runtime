//
//  YHWorkGroup.m
//  PikeWay
//
//  Created by YHIOS002 on 16/5/5.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

#import "YHWorkGroup.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "YHSerializeKit.h"

static const CGFloat contentLabelFontSize;
static CGFloat maxContentLabelHeight;
static const CGFloat kMarginContentLeft;
static const CGFloat kMarginContentRight;

@implementation YHWorkGroup
{
    CGFloat _lastContentWidth;
}

@synthesize msgContent = _msgContent;

YHSERIALIZE_CODER_DECODER();

YHSERIALIZE_COPY_WITH_ZONE();

YHSERIALIZE_DESCRIPTION();


- (void)setMsgContent:(NSString *)msgContent
{
    _msgContent = msgContent;
}

- (NSString *)msgContent
{
    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - kMarginContentLeft - kMarginContentRight ;
    if (contentW != _lastContentWidth) {
        _lastContentWidth = contentW;
        CGRect textRect = [_msgContent boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentLabelFontSize]} context:nil];
        if (textRect.size.height > maxContentLabelHeight) {
            _shouldShowMoreButton = YES;
        } else {
            _shouldShowMoreButton = NO;
        }
    }
    
    return _msgContent;
}

- (void)setIsOpening:(BOOL)isOpening
{
    if (!_shouldShowMoreButton) {
        _isOpening = NO;
    } else {
        _isOpening = isOpening;
    }
}

@end
