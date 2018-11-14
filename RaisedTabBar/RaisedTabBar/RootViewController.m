//
//  RootViewController.m
//  RaisedTabBar
//
//  Created by 车 on 2018/11/7.
//  Copyright © 2018 车. All rights reserved.
//

#import "RootViewController.h"
#import "RaisedTabBarController.h"
#import "RaisedTabBarItemModel.h"

@interface RootViewController ()

@property (nonatomic, strong) NSMutableArray *tabBarItemModelArray;
@property (nonatomic, strong) NSMutableArray *classNames;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTabBarItemModelArray];
}

- (void)viewDidAppear:(BOOL)animated {
    self.tabBarController = [[RaisedTabBarController alloc] initWithItemModelArray:self.tabBarItemModelArray];
    [self presentViewController:self.tabBarController animated:NO completion:nil];
}

- (void)createTabBarItemModelArray {
    self.tabBarItemModelArray = [NSMutableArray array];
    
    RaisedTabBarItemModel *model1 = [[RaisedTabBarItemModel alloc] initWithClassName:@"AViewController"
                                                                               title:@"A"
                                                                           imageName:@""
                                                                   selectedImageName:@""];
    
    RaisedTabBarItemModel *model2 = [[RaisedTabBarItemModel alloc] initWithClassName:@"BViewController"
                                                                               title:@"B"
                                                                           imageName:@""
                                                                   selectedImageName:@""];
    
    RaisedTabBarItemModel *model3 = [[RaisedTabBarItemModel alloc] initWithClassName:@"CViewController"
                                                                               title:@"C"
                                                                           imageName:@""
                                                                   selectedImageName:@""];
    
    RaisedTabBarItemModel *model4 = [[RaisedTabBarItemModel alloc] initWithClassName:@"DViewController"
                                                                               title:@"D"
                                                                           imageName:@""
                                                                   selectedImageName:@""];
    
    RaisedTabBarItemModel *model5 = [[RaisedTabBarItemModel alloc] initWithClassName:@"EViewController"
                                                                               title:@"E"
                                                                           imageName:@""
                                                                   selectedImageName:@""];
    
    [self.tabBarItemModelArray addObjectsFromArray:@[model1, model2, model3, model4, model5]];
}

@end
