//
//  UIView+FindResponder.m
//  TDALScrollViewDemo
//
//  Created by Arlexovincy on 15/3/11.
//  Copyright (c) 2015年 Arlexovincy. All rights reserved.
//

#import "UIView+FindResponder.h"

@implementation UIView (FindResponder)

#pragma mark 递归找出第一响应者
+ (UITextField *)findFistResponder:(UIView *)view {
    for (UIView *child in view.subviews) {
        if ([child respondsToSelector:@selector(isFirstResponder)]
            &&
            [child isFirstResponder]) {
            return (UITextField *)child;
        }
        
        UITextField *field = [self findFistResponder:child];
        if (field) {
            return field;
        }
    }
    
    return nil;
}

+ (UITextView *)findFistResponderToTextView:(UIView *)view {
    for (UIView *child in view.subviews) {
        if ([child respondsToSelector:@selector(isFirstResponder)]
            &&
            [child isFirstResponder]) {
            return (UITextView *)child;
        }
        
        UITextView *field = [self findFistResponderToTextView:child];
        if (field) {
            return field;
        }
    }
    
    return nil;
}

+ (UIView *)findFistResponderUIView:(UIView *)view {
    for (UIView *child in view.subviews) {
        if ([child respondsToSelector:@selector(isFirstResponder)]
            &&
            [child isFirstResponder]) {
            return (UIView *)child;
        }
        
        UIView *field = [self findFistResponderUIView:child];
        if (field) {
            return field;
        }
    }
    
    return nil;
}

@end
