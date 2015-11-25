//
//  ViewController.m
//  Demo_TableView_Layout
//
//  Created by imac27 on 15/11/24.
//  Copyright © 2015年 hyd. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"
#import "OneCell.h"
#import "TwoCell.h"

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define StatusBarHeight (IOS7==YES ? 20 : 0)
#define BackHeight      (IOS7==YES ? 0 : 15)

#define fNavBarHeigth (IOS7==YES ? 64 : 44)
#define FDEVEICE_W ([UIScreen mainScreen].bounds.size.width)
#define FDEVEICE_H ([UIScreen mainScreen].bounds.size.height)
#define PADDING 5


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *contentArray;
@property (nonatomic, assign) CGFloat heightRow;
@property (nonatomic, assign) CGFloat heightRow2;

@end

@implementation ViewController

/**
 *  懒加载表格
 */
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50 + StatusBarHeight + PADDING / 2, FDEVEICE_W, FDEVEICE_H - 50 - StatusBarHeight - PADDING / 2) style:UITableViewStylePlain];
        
      //  OneCell *cell = [_tableView registerClass:[OneCell class] forCellReuseIdentifier:@"Cell"];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        // 设置没有分隔线
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

/**
 *  懒加载数组
 */

- (NSMutableArray *)contentArray {
    if (!_contentArray) {
        _contentArray = [NSMutableArray array];
        NSArray *array = [NSArray array];
        array = [DataModel dataArray];
        //[self.tableView reloadData];
        [_contentArray addObjectsFromArray:array];
        [self.tableView reloadData];
        
    }
    return _contentArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建两个按钮
    [self setUpButton];
    // 创建表格
    [self tableView];
}

- (void)setUpButton {
    
    // 最新按钮
    UIButton *btnOne = [[UIButton alloc] initWithFrame:CGRectMake(PADDING, StatusBarHeight, FDEVEICE_W / 2 - 8, 47.5)];
    btnOne.backgroundColor = [UIColor grayColor];
    [btnOne setTitle:@"最新" forState:UIControlStateNormal];
    [btnOne addTarget:self action:@selector(clickNewButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnOne];
    
    // 下划线
   // UIView *line = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btnOne.frame), CGRectGetMinY(btnOne.frame), 1, 50)];
    //[self.view addSubview:line];
    
    // 最热门
    UIButton *btnTwo = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btnOne.frame) + 5, CGRectGetMinY(btnOne.frame), FDEVEICE_W / 2 - 7, 47.5)];
    btnTwo.backgroundColor = [UIColor grayColor];
    [btnTwo setTitle:@"最热门" forState:UIControlStateNormal];
    [btnTwo addTarget:self action:@selector(clickHot:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTwo];
    
}

// 最新按钮点击事件
- (void)clickNewButton:(UIButton *)button {
    
    NSLog(@"最新按钮点击");
}

// 最热门点击按钮

- (void)clickHot:(UIButton *)button {
    NSLog(@"最热门点击");
}


#pragma mark -- TableViewdataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"fsdf");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%ld", self.contentArray.count);
    return self.contentArray.count;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (0 == indexPath.row) {
        static NSString *ID = @"Cell";
        OneCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[OneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.dataModel = (DataModel *)self.contentArray[indexPath.row];
       /* cell.heightRow = ^(CGFloat height) {
            self.heightRow = height;
            NSLog(@"%lf", height);
        };*/
        [cell.leftBigButton addTarget:self action:@selector(clickLeftBigButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.rightUpButton addTarget:self action:@selector(clickRightUpButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.rightDownButton addTarget:self action:@selector(clickRightDownButton:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;

    } else {
        static NSString *ID = @"Cell2";
        TwoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[TwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.dataModel = (DataModel *)self.contentArray[indexPath.row];
        /*cell.heightRow = ^(CGFloat height) {
            self.heightRow2 = height;
            NSLog(@"%lf", height);
        };*/
       [cell.leftButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
       [cell.middleButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
       [cell.rightButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

        
        return cell;

    }

}


- (void)clickButton:(UIButton *)button {
    NSLog(@"=========");
}

- (void)clickLeftBigButton:(UIButton *)button {
    NSLog(@"点击了bigButton");
}

- (void)clickRightUpButton:(UIButton *)button {
    NSLog(@"点击了右上按钮");
}

- (void)clickRightDownButton:(UIButton *)button {
    NSLog(@"点击了右下按钮");
}

// 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //return 300;
    CGFloat rowHeight = ((FDEVEICE_W - 4 * 5) / 3);
    
    if (indexPath.row == 0) {
        return rowHeight * 2 + (PADDING * 3) / 2;
    } else {
        return rowHeight + PADDING;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
