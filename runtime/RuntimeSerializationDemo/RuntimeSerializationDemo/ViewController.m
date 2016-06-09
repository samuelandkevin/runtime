//
//  ViewController.m
//  RuntimeSerializationDemo
//
//  Created by kun on 16/6/1.
//  Copyright © 2016年 kun. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "YHSerializeKit.h"
#import "YHCommentData.h"
#import "YHWorkGroup.h"
#import "YHUserInfo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
    for (int i=0; i<100; i++) {
        YHWorkGroup *model=  [[YHWorkGroup alloc] init];
        model.dynamicId = @"1";
        YHUserInfo *userInfo = [YHUserInfo new];
        model.userInfo = userInfo;
        model.type = 0;
        model.publishTime = @"2014-10-1";
        model.msgContent = @"2019-10-1";
        model.commentCount = 1;
        model.likeCount =2;
        model.isLike = NO;
        model.visible = 0;
        model.originalPicUrls = @[[NSURL URLWithString:@"1"],[NSURL URLWithString:@"1"],[NSURL URLWithString:@"1"],[NSURL URLWithString:@"1"]];
        model.thumbnailPicUrls = @[[NSURL URLWithString:@"11"],[NSURL URLWithString:@"11"],[NSURL URLWithString:@"11"],[NSURL URLWithString:@"11"]];
        [array addObject:model];
    }
    NSLog(@"开始归档了----------------");
    YHSERIALIZE_ARCHIVE(array,@"array",[self filePath]);
    NSLog(@"结束归档了----------------");

    
    NSLog(@"开始解档了----------------");
    NSMutableArray *maArray = nil;
    YHSERIALIZE_UNARCHIVE(maArray, @"array", [self filePath]);
    NSLog(@"%@",[maArray description]);
    NSLog(@"结束解档了----------------");
    
}

- (NSString *)filePath
{
    NSString *archiverFilePath = [NSString stringWithFormat:@"%@/archiver", NSHomeDirectory()];
    return archiverFilePath;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
