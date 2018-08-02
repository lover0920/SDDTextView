# SDTextView
自定义带placeholder的TextView，并取消的textView中的内边距


```
#import <UIKit/UIKit.h>

@interface SDTextView : UITextView
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, copy) NSAttributedString *attributedPlaceholder;
@end
```
