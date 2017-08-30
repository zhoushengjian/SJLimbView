//
//  TKGradient.h
//
//
//  Created by Shengjian on 3/6/15.
//  Copyright (c) WeiLicai. All rights reserved.
//


//IB_DESIGNABLE

#import <UIKit/UIKit.h>

@interface WLGradient : UIView

@property (nonatomic, strong) IBInspectable UIColor  *startColor;
@property (nonatomic, strong) IBInspectable UIColor  *locationColor;
@property (nonatomic, strong) IBInspectable UIColor  *locationColor1;
@property (nonatomic, strong) IBInspectable UIColor  *endColor;
@property (nonatomic, assign) IBInspectable CGPoint  startPoint;
@property (nonatomic, assign) IBInspectable CGFloat  location;
@property (nonatomic, assign) IBInspectable CGFloat  location1;
@property (nonatomic, assign) IBInspectable CGPoint  endPoint;



@end
