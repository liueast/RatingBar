//
//  ViewController.m
//  JhtRatingBar
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/8.
//  Copyright © 2016年 JhtRatingBar. All rights reserved.
//

#import "ViewController.h"
#import <JhtRatingBar/JhtRatingBar.h>

/** 屏幕 宽度 */
#define FrameW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
/** 评分条 */
@property (nonatomic, strong) JhtRatingBar *ratingBar;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建UI
    [self createUI];
}



#pragma mark - UI
/** 创建UI */
- (void)createUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"JhtRatingBar";
    
    // 添加评分条
    [self addRatingBar];
}


#pragma mark RatingBar
/** 添加评分条 */
- (void)addRatingBar {
    __weak JhtRatingBar *weakBar = self.ratingBar;
    self.ratingBar.starChange = ^() {
        NSLog(@"scale = %lf", weakBar.scale);
    };
    
    [self.view addSubview:self.ratingBar];
}



#pragma mark - Get
/** 评分条 */
- (JhtRatingBar *)ratingBar {
    if (!_ratingBar) {
        _ratingBar = [[JhtRatingBar alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 280) / 2, 88, 280, 35)];
        
        _ratingBar.bgViewColor = [UIColor lightGrayColor];
        _ratingBar.starTotalNumber = 8;
        _ratingBar.selectedStarNumber = 4;
        _ratingBar.minSelectedNumber = 0;
        _ratingBar.isNeedHalf = YES;
    }
    
    return _ratingBar;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
