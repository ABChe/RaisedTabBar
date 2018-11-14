//
//  RaisedTabBar.m
//  RaisedTabBar
//
//  Created by 车 on 2018/11/7.
//  Copyright © 2018 车. All rights reserved.
//

#import "RaisedTabBar.h"

#define kRoundButtonRadius 30.f
#define kRoundBorderWidth 5.f
#define kTabBarDefaultHeight 49.f

#define kRoundButtonBackgroundColor [UIColor redColor]
#define kRoundButtonBorderColor [UIColor cyanColor].CGColor

#define kiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kiPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define kiPhoneXS_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define kiPhoneX_Bottom_Height (kiPhoneX || kiPhoneXR || kiPhoneXS_Max ? 34 : 0)

@implementation RaisedTabBar

#pragma mark -

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.roundButton.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.roundButton];
    }
    return self;
}


#pragma mark -

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger centerX = CGRectGetWidth(self.bounds) / 2;
    NSInteger cenyerY = CGRectGetHeight(self.bounds) / 2;
    self.roundButton.frame = CGRectMake(centerX - kRoundButtonRadius,  cenyerY - kTabBarDefaultHeight / 2 - kRoundButtonRadius - kiPhoneX_Bottom_Height / 2, kRoundButtonRadius * 2, kRoundButtonRadius *2);
    
    Class class = NSClassFromString(@"UITabBarButton");
    NSInteger index = 0;
    NSInteger itemWidth = CGRectGetWidth(self.bounds) / self.items.count;
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:class]) {
            CGRect rect = view.frame;
            rect.origin.x = index * itemWidth;
            rect.size.width = itemWidth;
            view.frame = rect;
            
            // 隐藏中间item
            if (index == ceil(self.items.count / 2)) {
//                view.hidden = YES;
            }
            
            index++;
        }
    }
    [self bringSubviewToFront:self.roundButton];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    /*
     判断self.hidden是防止push到其它页面后 点击roundButton的位置依旧响应roundButton点击事件
     判断当前点击是否落在roundButton上 YES:响应roundButton事件  NO:系统处理
     */
    if (self.hidden == NO)
    {
        // 将相对于tabBar触摸点位置转为相对于roundButton的坐标位置
        CGPoint newPoint = [self convertPoint:point toView:self.roundButton];
        // 如果在roundButton内 响应roundButton点击事件
        if ([self.roundButton pointInside:newPoint withEvent:event]) {
            return self.roundButton;
        } else {
            return [super hitTest:point withEvent:event];
        }
    }
    else
    {
        return [super hitTest:point withEvent:event];
    }
}


#pragma mark -

- (void)clickRoundButton {
    if (self.raisedDelegate && [self.raisedDelegate respondsToSelector:@selector(roundButtonClicked)]) {
        [self.raisedDelegate roundButtonClicked];
    }
}

#pragma mark -

- (UIButton *)roundButton {
    if (_roundButton == nil) {
        _roundButton = [[UIButton alloc] init];
        _roundButton.backgroundColor = kRoundButtonBackgroundColor;
        _roundButton.layer.cornerRadius = kRoundButtonRadius;
        _roundButton.layer.borderWidth = kRoundBorderWidth;
        _roundButton.layer.borderColor = kRoundButtonBorderColor;
        _roundButton.clipsToBounds = YES;
        [_roundButton addTarget:self action:@selector(clickRoundButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _roundButton;
}

@end
