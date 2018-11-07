//
//  RaisedTabBar.h
//  RaisedTabBar
//
//  Created by 车 on 2018/11/7.
//  Copyright © 2018 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RaisedTabBarDelegate <NSObject,UITableViewDelegate>

- (void)roundButtonClicked;

@end


@interface RaisedTabBar : UITabBar

@property (nonatomic, weak) id <RaisedTabBarDelegate> raisedDelegate;

@property (nonatomic, strong) UIButton *roundButton;

@end

