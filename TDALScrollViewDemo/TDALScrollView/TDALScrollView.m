//
//  TDALScrollView.m
//  NewTuanDai
//
//  Created by Arlexovincy on 15/3/4.
//  Copyright (c) 2015年 TD. All rights reserved.
//

#import "TDALScrollView.h"

@implementation TDALScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init{
    
    if (self = [super init]) {
        
        [self initial];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super initWithCoder:aDecoder]) {
        
        [self initial];
    }
    
    return self;
}

#pragma mark- 初始化
- (void)initial{

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    // 注册键盘显示的通知
    [center addObserver:self selector:@selector(keybordWillShow:) name:UIKeyboardWillShowNotification object:nil];
    // 注册键盘隐藏的通知
    [center addObserver:self selector:@selector(keybordWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark keybordWillShow
- (void)keybordWillShow:(NSNotification *)notification{

    CGRect keyboardRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [self removeConstraintWithView:self];
    UIView *currentView = self;
    UIView *supperView = self.superview;
    
    currentView.translatesAutoresizingMaskIntoConstraints = NO;
    CGFloat duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:duration animations:^{
    
        NSDictionary *views = NSDictionaryOfVariableBindings(currentView);
        NSDictionary *metrics = @{@"keyboardBottom":@(keyboardRect.size.height)};
        
        [supperView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[currentView]-0-|" options:0 metrics:nil views:views]];
        
        [supperView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[currentView]-keyboardBottom-|" options:0 metrics:metrics views:views]];
        
        [supperView layoutIfNeeded];
    }];
}

#pragma mark keybordWillHide
- (void)keybordWillHide:(NSNotification *)notification {

    [self removeConstraintWithView:self];
    UIView *currentView = self;
    UIView *supperView = self.superview;
    
    currentView.translatesAutoresizingMaskIntoConstraints = NO;
    CGFloat duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:duration animations:^{
        
        NSDictionary *views = NSDictionaryOfVariableBindings(currentView);
        
        [supperView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[currentView]-0-|" options:0 metrics:nil views:views]];
        
        [supperView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[currentView]-0-|" options:0 metrics:nil views:views]];
        
        [supperView layoutIfNeeded];
    }];
}

#pragma mark -
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
}

#pragma mark -
- (void)dealloc {
    //removeObserver
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

#pragma mark- 移除约束
- (void)removeConstraintWithView:(UIView*)view{
    
    for(NSLayoutConstraint *constraint in view.superview.constraints){
        if(constraint.firstItem==view||constraint.secondItem == view){
            [view.superview removeConstraint:constraint];
        }
    }
}

@end
