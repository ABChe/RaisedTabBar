//
//  RootViewController.m
//  RaisedTabBar
//
//  Created by 车 on 2018/11/7.
//  Copyright © 2018 车. All rights reserved.
//

#import "RootViewController.h"
#import "RaisedTabBarController.h"

@interface TabBarItemModel : NSObject

@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *selectedImageName;

- (instancetype)initWithClassName:(NSString *)className title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;
@end

@implementation TabBarItemModel

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


@interface RootViewController ()

@property (nonatomic, strong) NSMutableArray *tabBarItemModelArray;

@property (nonatomic, strong) NSMutableArray *classNames;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTabBarItemModels];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    self.tabBarController = [[RaisedTabBarController alloc] init];
    
    [self.tabBarItemModelArray enumerateObjectsUsingBlock:^(TabBarItemModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *className = model.className;
        Class class = NSClassFromString(className);
        if (class) {
            UIViewController *vc = class.new;
            [self.tabBarController addChildViewControllerWithViewController:vc title:model.title image:model.imageName selectedImage:model.selectedImageName];
        }
    }];
    
    [self presentViewController:self.tabBarController animated:NO completion:nil];
}

- (void)setTabBarItemModels {
    self.tabBarItemModelArray = [NSMutableArray array];
    
    TabBarItemModel *model1 = [[TabBarItemModel alloc] initWithClassName:@"AViewController"
                                                                   title:@"A"
                                                               imageName:@""
                                                       selectedImageName:@""];
    
    TabBarItemModel *model2 = [[TabBarItemModel alloc] initWithClassName:@"BViewController"
                                                                   title:@"B"
                                                               imageName:@""
                                                       selectedImageName:@""];
    
    TabBarItemModel *model3 = [[TabBarItemModel alloc] initWithClassName:@"CViewController"
                                                                   title:@"C"
                                                               imageName:@""
                                                       selectedImageName:@""];
    
    TabBarItemModel *model4 = [[TabBarItemModel alloc] initWithClassName:@"DViewController"
                                                                   title:@"D"
                                                               imageName:@""
                                                       selectedImageName:@""];
    
    TabBarItemModel *model5 = [[TabBarItemModel alloc] initWithClassName:@"EViewController"
                                                                   title:@"E"
                                                               imageName:@""
                                                       selectedImageName:@""];
    
    [self.tabBarItemModelArray addObjectsFromArray:@[model1, model2, model3, model4, model5]];
}

@end
