//
//  OneCell.m
//  Demo_TableView_Layout
//
//  Created by imac27 on 15/11/24.
//  Copyright © 2015年 hyd. All rights reserved.
//

#import "OneCell.h"
#import "DataModel.h"
#define FDEVEICE_W ([UIScreen mainScreen].bounds.size.width)
#define FDEVEICE_H ([UIScreen mainScreen].bounds.size.height)
#define PADDING 5


@interface OneCell()

@property (nonatomic, strong) UIView *view1;

@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;

@end

@implementation OneCell


- (UIView *)view1 {
    if (!_view1) {
        _view1 = [[UIView alloc] init];
        [self.contentView addSubview:_view1];
    }
    return _view1;
}

- (UIView *)view2 {
    if (!_view2) {
        _view2 = [[UIView alloc] init];
        [self.contentView addSubview:_view2];
    }
    return _view2;
}

- (UIView *)view3 {
    if (!_view3) {
        _view3 = [[UIView alloc] init];
        [self.contentView addSubview:_view3];
    }
    return _view3;
}

- (UIButton *)leftBigButton {
    if (!_leftBigButton) {
        _leftBigButton = [[UIButton alloc] init];
        [self.contentView addSubview:_leftBigButton];
    }
    return _leftBigButton;
}

- (UIButton *)rightUpButton {
    if (!_rightUpButton) {
        _rightUpButton = [[UIButton alloc] init];
        [self.contentView addSubview:_rightUpButton];
    }
    return _rightUpButton;
}

- (UIButton *)rightDownButton {
    if (!_rightDownButton) {
        _rightDownButton = [[UIButton alloc] init];
        [self.contentView addSubview:_rightDownButton];
    }
    return _rightDownButton;
}

- (UILabel *)leftBigTitle {
    if (!_leftBigTitle) {
        _leftBigTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_leftBigTitle];
    }
    return _leftBigTitle;
}

- (UILabel *)rightUpTitle {
    if (!_rightUpTitle) {
        _rightUpTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_rightUpTitle];
    }
    return _rightUpTitle;
}

- (UILabel *)rightDownTitle {
    if (!_rightDownTitle) {
        _rightDownTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_rightDownTitle];
    }
    return _rightDownTitle;
}



- (void)setDataModel:(DataModel *)dataModel {
    _dataModel = dataModel;
    // 设置data
    [self setUpData];
    // 设置frame
    [self setUpFrame];
}

- (void)setUpData {
    [self.leftBigButton setBackgroundImage:[UIImage imageNamed:@"cat"] forState:UIControlStateNormal];
    
    
    [self.rightUpButton setBackgroundImage:[UIImage imageNamed:@"cat"] forState:UIControlStateNormal];
    [self.rightDownButton setBackgroundImage:[UIImage imageNamed:@"cat"] forState:UIControlStateNormal];
    
    self.leftBigTitle.text = @"测试题目";
    self.rightUpTitle.text = @"测试题目22";
    self.rightDownTitle.text = @"测试题目类型";
    
}

- (void)setUpFrame {
    
    CGFloat leftBigButtonW = ((FDEVEICE_W - 4 * PADDING) / 3) * 2 + PADDING;
    CGFloat rightButtonW = ((FDEVEICE_W - 4 * PADDING) / 3);
   
    
    self.leftBigButton.frame = CGRectMake(PADDING, 0, 2 * rightButtonW + 5,  rightButtonW * 2 + PADDING);
    self.leftBigButton.backgroundColor = [UIColor grayColor];
    // 文字背景視圖
    self.view1.frame = CGRectMake(PADDING, CGRectGetMaxY(self.leftBigButton.frame) - 40, CGRectGetWidth(self.leftBigButton.frame), 40);
    self.view1.backgroundColor = [UIColor blackColor];
    self.view1.alpha = 0.25;
    // 左边文字
    self.leftBigTitle.frame = CGRectMake(2 * PADDING, CGRectGetMaxY(self.leftBigButton.frame) - 40, leftBigButtonW - 20, 40);
    self.leftBigTitle.textAlignment = NSTextAlignmentCenter;
    
    // 右上边按钮
    self.rightUpButton.frame = CGRectMake(CGRectGetMaxX(self.leftBigButton.frame) + PADDING, 0, rightButtonW, rightButtonW);
    // 右上文字背景視圖
    self.view2.frame = CGRectMake(CGRectGetMinX(self.rightUpButton.frame), CGRectGetMaxY(self.rightUpButton.frame) - 40, CGRectGetWidth(self.rightUpButton.frame), 40);
    self.view2.backgroundColor = [UIColor blackColor];
    self.view2.alpha = 0.25;
    // 右上文字
    self.rightUpTitle.frame = CGRectMake(CGRectGetMinX(self.rightUpButton.frame), CGRectGetMaxY(self.rightUpButton.frame) - 40, rightButtonW , 40);
    self.rightUpTitle.textAlignment = NSTextAlignmentCenter;
    
    // 右下按钮
    self.rightDownButton.frame = CGRectMake(CGRectGetMaxX(self.leftBigButton.frame) + PADDING, CGRectGetMaxY(self.rightUpButton.frame) + PADDING, rightButtonW, rightButtonW);
    // 右下文字背景視圖
    self.view3.frame = CGRectMake(CGRectGetMinX(self.rightDownButton.frame), CGRectGetMaxY(self.rightDownButton.frame) - 40, CGRectGetWidth(self.rightDownButton.frame), 40);
    self.view3.backgroundColor = [UIColor blackColor];
    self.view3.alpha = 0.25;
    // 右下文字
    self.rightDownTitle.frame = CGRectMake(CGRectGetMinX(self.rightDownButton.frame), CGRectGetMaxY(self.rightDownButton.frame) - 40, rightButtonW, 40);
    self.rightDownTitle.textAlignment = NSTextAlignmentCenter;

    
        self.rowHeight = (rightButtonW * 2 + 3 * PADDING);
    

    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
