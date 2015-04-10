// vertical alignment values
#import <UIKit/UIKit.h>

typedef enum UITextVerticalAlignment {
    UITextVerticalAlignmentTop,
    UITextVerticalAlignmentMiddle,
    UITextVerticalAlignmentBottom
} UITextVerticalAlignment;

@interface UILabel(VerticalAlignment)

// getter
-(UITextVerticalAlignment)textVerticalAlignment;

// setter
-(void)setTextVerticalAlignment:(UITextVerticalAlignment)textVerticalAlignment;

@end