//
//  LimbCell.m
//  LimbView
//
//  Created by zhoushengjian on 2017/7/9.
//  Copyright © 2017年 zhuanbei. All rights reserved.
//

#import "LimbCell.h"
#import "UIColor+hexcolor.h"

#define kLineColor [UIColor colorWithHex:@"#A0AEB3"]

@interface LimbCell ()

@property (weak, nonatomic) UIView *horizontalLine;

@property (strong, nonatomic) NSMutableArray *verticalLines;

@end

@implementation LimbCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = NO;
        [self setupUI];
        
    }
    return self;
}


- (void)setupUI {
    UIView *horizontalLine = [[UIView alloc] init];
    horizontalLine.backgroundColor = kLineColor;
    [self addSubview:horizontalLine];
    self.horizontalLine = horizontalLine;
    
    UIView *verticalLineBold = [[UIView alloc] init];
    verticalLineBold.backgroundColor = kLineColor;
    [self addSubview:verticalLineBold];
    self.verticalLineBold = verticalLineBold;
    
    self.verticalLines = [NSMutableArray new];
    for (int i=0; i<4; i++) {
        UIView *verticalLine = [[UIView alloc] init];
        verticalLine.backgroundColor = kLineColor;
        [self addSubview:verticalLine];
        [self.verticalLines addObject:verticalLine];
    }
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.font = [UIFont systemFontOfSize:12];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.textColor = kLineColor;
    [self addSubview:textLabel];
    self.textLabel = textLabel;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.horizontalLine.frame = CGRectMake(0, self.frame.size.height/2, self.frame.size.width, 0.5);
    
    self.verticalLineBold.frame = CGRectMake(0, self.horizontalLine.frame.origin.y-10, 1, 10);
    
    for (int i=0; i<self.verticalLines.count; i++) {
        UIView *verticalLine = self.verticalLines[i];
        verticalLine.frame = CGRectMake((i+1)*self.frame.size.width/5.0, self.verticalLineBold.frame.origin.y+3, 0.5, self.verticalLineBold.frame.size.height-3);

    }
    
    self.textLabel.frame = CGRectMake(self.verticalLineBold.center.x-50, CGRectGetMaxY(self.horizontalLine.frame)+5, 100, 15);
    
}


@end
