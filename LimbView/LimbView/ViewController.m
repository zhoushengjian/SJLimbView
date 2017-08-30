//
//  ViewController.m
//  LimbView
//
//  Created by zhoushengjian on 2017/7/9.
//  Copyright © 2017年 zhuanbei. All rights reserved.
//

#import "ViewController.h"
#import "LimbView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LimbView *limbView = [[LimbView alloc] initWithFrame:CGRectMake(0, 100, 35*8, 105)];
    limbView.center = CGPointMake(self.view.center.x, limbView.center.y);
    [self.view addSubview:limbView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
