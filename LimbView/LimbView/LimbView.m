//
//  LimbView.m
//  LimbView
//
//  Created by zhoushengjian on 2017/7/9.
//  Copyright © 2017年 zhuanbei. All rights reserved.
//  一个单元格35 一小格7

#import "LimbView.h"
#import "LimbCell.h"
#import "LimbLastCell.h"
#import "UIColor+hexcolor.h"

#define kCount 20
#define kInsetWidth (4*35)

@interface LimbView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) UILabel *moneyLabel;

@end

@implementation LimbView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupCollectionView];

        
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI {
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    label.textColor = [UIColor colorWithHex:@"#A1AFB4"];
    label.text = @"请选择借款金额";
    [label sizeToFit];
    label.center = CGPointMake(self.frame.size.width/2, label.frame.size.height/2);
    [self addSubview:label];
    
    UILabel *moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width-200)/2, CGRectGetMaxY(label.frame)+6, 200, 20)];
    moneyLabel.textColor = [UIColor colorWithHex:@"#013047"];
    moneyLabel.font = [UIFont systemFontOfSize:20];
    moneyLabel.textAlignment = NSTextAlignmentCenter;
    moneyLabel.text = @"600";
    [self addSubview:moneyLabel];
    self.moneyLabel = moneyLabel;
    
    UIView *redVerticalLine = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0, self.frame.size.height-25-14, 2, 25)];
    redVerticalLine.backgroundColor = [UIColor colorWithHex:@"#D71E13"];
    [self addSubview:redVerticalLine];
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-40, self.frame.size.width, 40) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.contentInset = UIEdgeInsetsMake(0, kInsetWidth, 0, kInsetWidth);
    [collectionView registerClass:[LimbCell class] forCellWithReuseIdentifier:@"LimbCell"];
    [collectionView registerClass:[LimbLastCell class] forCellWithReuseIdentifier:@"LimbLastCell"];
    [self addSubview:collectionView];
    
    
//    WLGradient *gradientView = [[WLGradient alloc] initWithFrame:CGRectMake(0, collectionView.frame.origin.y, self.frame.size.width, collectionView.frame.size.height)];
//    gradientView.startColor = [UIColor whiteColor];
//    gradientView.locationColor = [UIColor clearColor];
//    gradientView.locationColor1 = [UIColor clearColor];
//    gradientView.endColor = [UIColor whiteColor];
//    
//    gradientView.startPoint = CGPointZero;
//    gradientView.endPoint = (CGPoint){1, 0};
//    gradientView.location = 0.2;
//    gradientView.location1 = 0.8;
//    gradientView.userInteractionEnabled = NO;
//    [self addSubview:gradientView];
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kCount;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == kCount-1) {
        LimbLastCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LimbLastCell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"%ldk", indexPath.row];
        cell.lastTextLabel.text = [NSString stringWithFormat:@"%ldk", indexPath.row+1];
        return cell;
        
    }else {
    
        LimbCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LimbCell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"%ldk", indexPath.row];
        return cell;
    }
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(35, 50);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float moeny = (scrollView.contentOffset.x+kInsetWidth)/7*200;
    self.moneyLabel.text = [NSString stringWithFormat:@"%.f", moeny];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self adjustContentOffSet:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self adjustContentOffSet:scrollView];
}

- (void)adjustContentOffSet:(UIScrollView *)scrollView {
    CGFloat offsetx = scrollView.contentOffset.x;
    
    NSInteger offsetxInt = lround(offsetx);
    
    float a = offsetxInt % 7;
    
    
    if (scrollView.contentOffset.x > 0) {
        [UIView animateWithDuration:0.25 animations:^{
            [scrollView setContentOffset:CGPointMake(fabsf(a) > 3.5? (offsetxInt/7+1)*7 : offsetxInt/7*7, 0)];
        }];
    }else {
        [UIView animateWithDuration:0.25 animations:^{
            [scrollView setContentOffset:CGPointMake(fabsf(a) > 3.5? (offsetxInt/7-1)*7 : offsetxInt/7*7, 0)];
        }];
    }
}

@end
