#import <UIKit/UIKit.h>
#import <RCTView.h>

@interface BlurView : RCTView

@property (nonatomic) BOOL isVibrant;
@property (nonatomic, copy) NSString *blurType;

@end
