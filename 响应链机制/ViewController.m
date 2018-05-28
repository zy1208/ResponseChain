//
//  ViewController.m
//  响应链机制
//
//  Created by Palmpay on 2018/4/21.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "ViewController.h"
#import "ZYTestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZYTestView *testView = [[ZYTestView alloc] initWithFrame:CGRectMake(100, 100, 240, 160)];
    testView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:testView];
}
 


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
