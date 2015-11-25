//
//  TwoCell.m
//  Demo_TableView_Layout
//
//  Created by imac27 on 15/11/24.
//  Copyright © 2015年 hyd. All rights reserved.
//

#import "TwoCell.h"
#import "DataModel.h"
#define FDEVEICE_W ([UIScreen mainScreen].bounds.size.width)
#define FDEVEICE_H ([UIScreen mainScreen].bounds.size.height)
#define PADDING 5


@interface TwoCell()

@property (nonatomic, strong) UIView *view1;

@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;

@end



@implementation TwoCell

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

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] init];
        [self.contentView addSubview:_leftButton];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] init];
        [self.contentView addSubview:_rightButton];
    }
    return _rightButton;
}

- (UIButton *)middleButton {
    if (!_middleButton) {
        _middleButton = [[UIButton alloc] init];
        [self.contentView addSubview:_middleButton];
    }
    return _middleButton;
}

- (UILabel *)leftTitle {
    if (!_leftTitle) {
        _leftTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_leftTitle];
    }
    return _leftTitle;
}

- (UILabel *)rightTitle {
    if (!_rightTitle) {
        _rightTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_rightTitle];
    }
    return _rightTitle;
}

- (UILabel *)middleTitle {
    if (!_middleTitle) {
        _middleTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_middleTitle];
    }
    return _middleTitle;
}



- (void)setDataModel:(DataModel *)dataModel {
    _dataModel = dataModel;
    // 设置data
    [self setUpData];
    // 设置frame
    [self setUpFrame];
}

- (void)setUpData {
    [self.leftButton setImage:[UIImage imageNamed:@"cat"] forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:@"cat"] forState:UIControlStateNormal];
    [self.middleButton setImage:[UIImage imageNamed:@"cat"] forState:UIControlStateNormal];
    
    self.leftTitle.text = @"测试题目";
    self.middleTitle.text = @"测试题目22";
    self.rightTitle.text = @"测试题目类型";
    
}


- (void)setUpFrame {
    
   // static NSInteger tagInt = 1;
    CGFloat ButtonW = ((FDEVEICE_W - 4 * PADDING) / 3);
    
    self.leftButton.frame = CGRectMake(PADDING, PADDING / 2, ButtonW,  ButtonW);
    //self.leftButton.tag = tagInt++;
    // 文字背景視圖
    self.view1.frame = CGRectMake(PADDING, CGRectGetMaxY(self.leftButton.frame) - 40, CGRectGetWidth(self.leftButton.frame), 40);
    self.view1.backgroundColor = [UIColor blackColor];
    self.view1.alpha = 0.25;
    // 左边文字
    self.leftTitle.frame = CGRectMake(2 * PADDING, CGRectGetMaxY(self.leftButton.frame) - 40, ButtonW, 40);
    self.leftTitle.textAlignment = NSTextAlignmentCenter;
    
    // 中间按钮
    self.middleButton.frame = CGRectMake(CGRectGetMaxX(self.leftButton.frame) + PADDING, PADDING / 2, ButtonW, ButtonW);
    //self.middleButton.tag = tagInt++;
    // 中间文字背景視圖
    self.view2.frame = CGRectMake(CGRectGetMinX(self.middleButton.frame), CGRectGetMaxY(self.middleButton.frame) - 40, CGRectGetWidth(self.middleButton.frame), 40);
    self.view2.backgroundColor = [UIColor blackColor];
    self.view2.alpha = 0.25;
    // 中间文字
    self.middleTitle.frame = CGRectMake(CGRectGetMinX(self.middleButton.frame), CGRectGetMaxY(self.middleButton.frame) - 40, ButtonW , 40);
    self.middleTitle.textAlignment = NSTextAlignmentCenter;
    
    
    // 右边按钮
    self.rightButton.frame = CGRectMake(CGRectGetMaxX(self.middleButton.frame) + PADDING, PADDING / 2, ButtonW, ButtonW);
    //self.rightButton.tag = tagInt++;
    // 右文字背景視圖
    self.view3.frame = CGRectMake(CGRectGetMinX(self.rightButton.frame), CGRectGetMaxY(self.rightButton.frame) - 40, CGRectGetWidth(self.rightButton.frame), 40);
    self.view3.backgroundColor = [UIColor blackColor];
    self.view3.alpha = 0.25;
    // 右文字
    self.rightTitle.frame = CGRectMake(CGRectGetMinX(self.rightButton.frame), CGRectGetMaxY(self.rightButton.frame) - 40, ButtonW, 40);
    self.rightTitle.textAlignment = NSTextAlignmentCenter;
    
    /*if (self.heightRow) {
        self.heightRow(ButtonW + 2 * PADDING);
    }*/
    self.rowHeight = (ButtonW + 2 * PADDING);
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
