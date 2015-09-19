#import "BlurView.h"

@implementation BlurView {
  UIVisualEffectView *_blurView;
  UIVisualEffectView *_vibrancyView;
}

- (void)setBlurType:(NSString *)blurType
{
  UIBlurEffect *blurEffect;

  if ([blurType isEqual: @"xlight"]) {
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
  } else if ([blurType isEqual: @"light"]) {
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
  } else if ([blurType isEqual: @"dark"]) {
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
  } else {
    return;
  }

  UIView *contentView;
  NSArray *subviews;
  if (_blurView) {
    contentView = (self.isVibrant ? _vibrancyView : _blurView).contentView;
    subviews = [contentView.subviews copy];
    [_blurView removeFromSuperview];
  }

  if (self.isVibrant) {
    UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    _vibrancyView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
  }

  _blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

  contentView = (self.isVibrant ? _vibrancyView : _blurView).contentView;
  for (UIView *subview in subviews) {
    [contentView addSubview:subview];
  }

  if (self.isVibrant) {
    [_blurView.contentView addSubview:_vibrancyView];
  }

  [self addSubview:_blurView];
}

- (void)insertReactSubview:(id<RCTComponent>)subview atIndex:(NSInteger)atIndex
{
  contentView = (self.isVibrant ? _vibrancyView : _blurView).contentView;
  [contentView addSubview:(UIView*)subview];
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  _blurView.frame = self.bounds;
}

@end
