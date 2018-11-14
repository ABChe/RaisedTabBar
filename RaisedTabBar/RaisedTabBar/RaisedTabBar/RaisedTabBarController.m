//
//  RaisedTabBarController.m
//  RaisedTabBar
//
//  Created by 车 on 2018/11/7.
//  Copyright © 2018 车. All rights reserved.
//

#import "RaisedTabBarController.h"
#import "RaisedTabBar.h"
#import "RaisedTabBarItemModel.h"

@interface RaisedTabBarController ()<RaisedTabBarDelegate>

@property (nonatomic, strong) NSMutableArray<RaisedTabBarItemModel *> *itemModelArray;

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

- (instancetype)initWithItemModelArray:(NSArray<RaisedTabBarItemModel *> *)array {
    if (self = [super init]) {
        self.itemModelArray = [NSMutableArray arrayWithArray:array];
        [self setChildViewControllers];
        middleIndex = floor(self.itemModelArray.count / 2.f);
        [self setSelectedIndex:middleIndex];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RaisedTabBar *myTabBar = [[RaisedTabBar alloc] init];
    myTabBar.raisedDelegate = self;
    [self setValue:myTabBar forKey:@"tabBar"];
}


#pragma mark -

- (void)setChildViewControllers {
    [self.itemModelArray enumerateObjectsUsingBlock:^(RaisedTabBarItemModel *model, NSUInteger idx, BOOL * _Nonnull stop)
    {
        NSString *className = model.className;
        Class class = NSClassFromString(className);
        if (class) {
            UIViewController *vc = class.new;
            [self addChildViewControllerWithViewController:vc
                                                     title:model.title
                                                     image:model.imageName
                                             selectedImage:model.selectedImageName];
        }
    }];
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
    
    nav.tabBarItem.title = title;
    childController.title = title;
    
    [self addChildViewController:nav];
}


#pragma mark -

- (void)roundButtonClicked {
    [self setSelectedIndex:middleIndex];
}

@end
