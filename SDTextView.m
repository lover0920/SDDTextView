//
//  SDTextView.m
//  freeStuff
//
//  Created by 孙号斌 on 2017/12/6.
//  Copyright © 2017年 孙号斌. All rights reserved.
//

#import "SDTextView.h"

@interface SDTextView()
@property (nonatomic, strong) UILabel *holderLabel;
@end
@implementation SDTextView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //label
    _holderLabel = [[UILabel alloc]init];
    _holderLabel.backgroundColor = [UIColor clearColor];
    _holderLabel.numberOfLines = 0;
    [self addSubview:_holderLabel];
    
    self.placeholderColor = RGB(199, 199, 205);
    self.font = [UIFont systemFontOfSize:16];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidChange)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    
}
#pragma mark - 重写setter方法
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    _holderLabel.text = placeholder;
    
    [self setNeedsLayout];
}
- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder
{
    _attributedPlaceholder = attributedPlaceholder;
    _holderLabel.attributedText = attributedPlaceholder;
    [self setNeedsLayout];
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    _holderLabel.textColor = placeholderColor;
}

//重写
- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    _holderLabel.font = font;
    [self setNeedsLayout];
}
- (void)setText:(NSString *)text
{
    [super setText:text];
    [self textDidChange];
}
- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self textDidChange];
}

#pragma mark - 通知的响应事件
- (void)textDidChange
{
    _holderLabel.hidden = self.hasText;
}


#pragma mark - 布局

- (void)layoutSubviews
{
    [super layoutSubviews];
    _holderLabel.left = 5;
    _holderLabel.top = 0;
    _holderLabel.width = self.width-10;
    if (_placeholder != nil && ![_placeholder isEqualToString:@""])
    {
        _holderLabel.height = [self sizeOfString:_placeholder
                                      attributes:@{NSFontAttributeName:_holderLabel.font}
                                           width:self.width-10].height;
        return;
    }
    _holderLabel.height = [self sizeOfString:_attributedPlaceholder.string
                                  attributes:@{NSFontAttributeName:_holderLabel.font}
                                       width:self.width-10].height;
    
}




- (CGSize)sizeOfString:(NSString *)text
            attributes:(NSDictionary *)attributes
                 width:(float)width
{
    CGSize size = CGSizeMake(width, MAXFLOAT);
    
    size = [text boundingRectWithSize:size
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:attributes
                              context:nil].size;
    
    return size;
}


#pragma mark - dealloc
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:UITextViewTextDidChangeNotification];
}
@end
