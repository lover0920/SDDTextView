//
//  SDTextView.h
//  freeStuff
//
//  Created by 孙号斌 on 2017/12/6.
//  Copyright © 2017年 孙号斌. All rights reserved.
//  添加Placeholder属性

#import <UIKit/UIKit.h>

@interface SDTextView : UITextView
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, copy) NSAttributedString *attributedPlaceholder;
@end
