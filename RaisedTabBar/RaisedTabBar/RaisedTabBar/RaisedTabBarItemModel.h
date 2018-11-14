//
//  RaisedTabBarItemModel.h
//  RaisedTabBar
//
//  Created by 车 on 2018/11/14.
//  Copyright © 2018 车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RaisedTabBarItemModel : NSObject

@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *selectedImageName;

- (instancetype)initWithClassName:(NSString *)className title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

@end
