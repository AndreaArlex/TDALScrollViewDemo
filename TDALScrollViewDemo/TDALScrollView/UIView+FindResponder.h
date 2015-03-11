//
//  UIView+FindResponder.h
//  TDALScrollViewDemo
//
//  Created by Arlexovincy on 15/3/11.
//  Copyright (c) 2015年 Arlexovincy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FindResponder){

    
}

+ (UITextField *)findFistResponder:(UIView *)view;
+ (UITextView *)findFistResponderToTextView:(UIView *)view;
+ (UIView *)findFistResponderUIView:(UIView *)view;

@end
