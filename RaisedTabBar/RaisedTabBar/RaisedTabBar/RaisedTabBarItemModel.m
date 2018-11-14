//
//  RaisedTabBarItemModel.m
//  RaisedTabBar
//
//  Created by 车 on 2018/11/14.
//  Copyright © 2018 车. All rights reserved.
//

#import "RaisedTabBarItemModel.h"

@implementation RaisedTabBarItemModel

- (instancetype)initWithClassName:(NSString *)className title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    if (self = [super init]) {
        self.className = className;
        self.title = title;
        self.imageName = imageName;
        self.selectedImageName = selectedImageName;
    }
    return self;
}

@end
