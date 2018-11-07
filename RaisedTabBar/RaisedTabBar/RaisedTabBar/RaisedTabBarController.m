//
//  RaisedTabBarController.m
//  RaisedTabBar
//
//  Created by 车 on 2018/11/7.
//  Copyright © 2018 车. All rights reserved.
//

#import "RaisedTabBarController.h"
#import "RaisedTabBar.h"

@interface RaisedTabBarController ()<RaisedTabBarDelegate>

@end

@implementation RaisedTabBarController {
    NSInteger middleIndex;
}

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setChildViewControllers];
    
    RaisedTabBar *myTabBar = [[RaisedTabBar alloc] init];
    myTabBar.raisedDelegate = self;
    [self setValue:myTabBar forKey:@"tabBar"];
    
    middleIndex = ceil(self.tabBar.items.count / 2.f);
    [self setSelectedIndex:middleIndex];
}


#pragma mark -

- (void)setChildViewControllers {
//    [self addChildViewControllerWithViewController:
//                                             title:
//                                             image:
//                                     selectedImage: ];
}

- (void)addChildViewControllerWithViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
    
    childController.view.backgroundColor = [UIColor whiteColor];
    
//    UIImage *myImage = [UIImage imageNamed:image];
//    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    childController.tabBarItem.image = myImage;
//    
//    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
//    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    childController.tabBarItem.selectedImage = mySelectedImage;
    
    childController.tabBarItem.title = title;
    childController.navigationItem.title = title;
    
    [self addChildViewController:nav];
}


#pragma mark -

- (void)roundButtonClicked {
    [self setSelectedIndex:middleIndex];
}

@end
