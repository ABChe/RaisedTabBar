//
//  RootViewController.m
//  RaisedTabBar
//
//  Created by 车 on 2018/11/7.
//  Copyright © 2018 车. All rights reserved.
//

#import "RootViewController.h"
#import "RaisedTabBarController.h"

@interface RootViewController ()

@property (nonatomic, strong) NSMutableArray *classNames;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    self.tabBarController = [[RaisedTabBarController alloc] init];
    [self presentViewController:self.tabBarController animated:NO completion:nil];
}

@end
