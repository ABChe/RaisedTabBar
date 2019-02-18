//
//  RaisedTabBarController.m
//  RaisedTabBar
//
//  Created by 车 on 2018/11/7.
//  Copyright © 2018 车. All rights reserved.
//

#import "RaisedTabBarController.h"
#import "RaisedTabBar.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"
#import "EViewController.h"

@interface RaisedTabBarController ()<RaisedTabBarDelegate>

@end

@implementation RaisedTabBarController {
    NSInteger middleIndex;
}

#pragma mark -

+ (void)initialize {
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor redColor];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RaisedTabBar *myTabBar = [[RaisedTabBar alloc] init];
    myTabBar.raisedDelegate = self;
    [self setValue:myTabBar forKey:@"tabBar"];
    
    [self setChildViewControllers];
    
    middleIndex = floor(self.viewControllers.count / 2.f);
    
    [self setSelectedIndex:0];
    
}


#pragma mark -

- (void)setChildViewControllers {
    AViewController *aVC = [[AViewController alloc] init];
    [self addChildViewControllerWithViewController:aVC
                                             title:@"A"
                                             image:@"aaa"
                                     selectedImage:@"aaa"];
    
    BViewController *bVC = [[BViewController alloc] init];
    [self addChildViewControllerWithViewController:bVC
                                             title:@"B"
                                             image:@"aaa"
                                     selectedImage:@"aaa"];
    
    CViewController *cVC = [[CViewController alloc] init];
    [self addChildViewControllerWithViewController:cVC
                                             title:@"C"
                                             image:@"aaa"
                                     selectedImage:@"aaa"];
    
    DViewController *dVC = [[DViewController alloc] init];
    [self addChildViewControllerWithViewController:dVC
                                             title:@"D"
                                             image:@"aaa"
                                     selectedImage:@"aaa"];
    
    EViewController *eVC = [[EViewController alloc] init];
    [self addChildViewControllerWithViewController:eVC
                                             title:@"E"
                                             image:@"aaa"
                                     selectedImage:@"aaa"];
}

- (void)addChildViewControllerWithViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
    
    childController.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *myImage = [UIImage imageNamed:image];
    childController.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    childController.tabBarItem.selectedImage = mySelectedImage;
    
    nav.tabBarItem.title = title;
    childController.title = title;
    
    [self addChildViewController:nav];
}


#pragma mark -

- (void)roundButtonClicked {
    NSLog(@"%s", __func__);
    [self setSelectedIndex:middleIndex];
}

@end
