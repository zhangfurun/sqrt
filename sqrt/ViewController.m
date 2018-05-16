//
//  ViewController.m
//  sqrt
//
//  Created by ifenghui on 2018/5/15.
//  Copyright © 2018年 ifenghui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat sqrtNumber = [self sqrtNumber:2];
    NSLog(@"结果:%lf", sqrtNumber);
}

- (CGFloat)sqrtNumber:(CGFloat)number {
    CGFloat sqrtNumber = 0;
    if (number < 0) {
        // 这里根据实际情况做处理,简单的返回-1,可以根据-1情况进行处理
        sqrtNumber = -1;
    } else {
        CGFloat oldRangeMid, newRangeMid;
        CGFloat rangeLeft, rangeRight;
        rangeLeft = 0;
        rangeRight = number;
        newRangeMid = oldRangeMid = (rangeLeft + rangeRight) / 2;
        do {
            if (newRangeMid * newRangeMid > number) {
                rangeRight = newRangeMid;
            } else {
                rangeLeft = newRangeMid;
            }
            oldRangeMid = newRangeMid;
            newRangeMid = (rangeRight + rangeLeft) / 2;
        } while (fabs(newRangeMid - oldRangeMid) > FLT_EPSILON);
        
        sqrtNumber = newRangeMid;
    }
    
    return sqrtNumber;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
