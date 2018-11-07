//
//  RaisedTabBarController.h
//  RaisedTabBar
//
//  Created by 车 on 2018/11/7.
//  Copyright © 2018 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RaisedTabBarController : UITabBarController

- (void)addChildViewControllerWithViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage;

@end
