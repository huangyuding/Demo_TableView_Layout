//
//  TwoCell.h
//  Demo_TableView_Layout
//
//  Created by imac27 on 15/11/24.
//  Copyright © 2015年 hyd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataModel;
@interface TwoCell : UITableViewCell


@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *middleButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UILabel *leftTitle;
@property (nonatomic, strong) UILabel *middleTitle;
@property (nonatomic, strong) UILabel *rightTitle;
@property (nonatomic, assign) CGFloat rowHeight;



@property (nonatomic, strong) DataModel *dataModel;


@end
