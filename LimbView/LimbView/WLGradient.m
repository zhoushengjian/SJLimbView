//
//  TKGradient.m
//
//
//  Created by Shengjian on 3/6/15.
//  Copyright (c) 2015 WeiLicai. All rights reserved.
//

#import "WLGradient.h"

#define COLOR_RGBA(r,g,b,a) [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:a]


@implementation WLGradient

+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame]))
    {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor clearColor];
    
    self.startColor = COLOR_RGBA(0, 0, 0, 0);
    self.locationColor = COLOR_RGBA(0, 0, 0, 0.3);
    self.locationColor1 = COLOR_RGBA(0, 0, 0, 0.7);
    self.endColor   = COLOR_RGBA(0, 0, 0, 0.75);
    self.startPoint = CGPointZero;
    self.location = 0.2;
    self.location1 = 0.3;
    self.endPoint   = (CGPoint){0, 1};
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CAGradientLayer *grad = (CAGradientLayer *)self.layer;
    grad.colors     = @[(__bridge id)self.startColor.CGColor, (__bridge id)self.locationColor.CGColor , (__bridge id)self.locationColor1.CGColor ,(__bridge id)self.endColor.CGColor];
    grad.locations  = @[@0,@(self.location),@(self.location1),@1];
    grad.startPoint = self.startPoint;
    grad.endPoint   = self.endPoint;
}

- (void)setStartColor:(UIColor *)startColor {
    [self willChangeValueForKey:@"startColor"];
    _startColor = startColor;
    [self didChangeValueForKey:@"startColor"];
    [self setNeedsLayout];
}
- (void)setLocationColor:(UIColor *)locationColor{
    [self willChangeValueForKey:@"locationColor"];
    _locationColor = locationColor;
    [self didChangeValueForKey:@"locationColor"];
    [self setNeedsLayout];

}
- (void)setLocationColor1:(UIColor *)locationColor1{
    [self willChangeValueForKey:@"locationColor1"];
    _locationColor1 = locationColor1;
    [self didChangeValueForKey:@"locationColor1"];
    [self setNeedsLayout];

}

- (void)setEndColor:(UIColor *)endColor {
    [self willChangeValueForKey:@"endColor"];
    _endColor = endColor;
    [self didChangeValueForKey:@"endColor"];
    [self setNeedsLayout];
}

- (void)setStartPoint:(CGPoint)startPoint {
    [self willChangeValueForKey:@"startPoint"];
    _startPoint = startPoint;
    [self didChangeValueForKey:@"startPoint"];
    [self setNeedsLayout];
}
- (void)setLocation:(CGFloat)location{
    [self willChangeValueForKey:@"location"];
    _location = location;
    [self didChangeValueForKey:@"location"];
    [self setNeedsLayout];

}
- (void)setLocation1:(CGFloat)location1{
    [self willChangeValueForKey:@"location1"];
    _location1 = location1;
    [self didChangeValueForKey:@"location1"];
    [self setNeedsLayout];

}
- (void)setEndPoint:(CGPoint)endPoint {
    [self willChangeValueForKey:@"endPoint"];
    _endPoint = endPoint;
    [self didChangeValueForKey:@"endPoint"];
    [self setNeedsLayout];
}

@end
