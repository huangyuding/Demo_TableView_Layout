//
//  OneCell.h
//  Demo_TableView_Layout
//
//  Created by imac27 on 15/11/24.
//  Copyright © 2015年 hyd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataModel;


@interface OneCell : UITableViewCell

@property (nonatomic, strong) UIButton *leftBigButton;
@property (nonatomic, strong) UIButton *rightUpButton;
@property (nonatomic, strong) UIButton *rightDownButton;

@property (nonatomic, strong) UILabel *leftBigTitle;
@property (nonatomic, strong) UILabel *rightUpTitle;
@property (nonatomic, strong) UILabel *rightDownTitle;
@property (nonatomic, assign) CGFloat rowHeight;



@property (nonatomic, strong) DataModel *dataModel;


@end
