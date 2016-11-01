//
//  ViewController.m
//  ZJProgressHUD
//
//  Created by ZeroJ on 16/9/7.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ViewController.h"
#import "ZJProgressHUD.h"
#import "ZJTextOnlyHUDView.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray<NSString *> *titlesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const kCellID = @"kCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
    }
    cell.textLabel.text = self.titlesArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [ZJProgressHUD showStatus:@"正在努力加载中..."];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [ZJProgressHUD hideHUD];
            });
            break;
        case 1:
            [ZJProgressHUD showStatus:@"正在努力加载中..." andAutoHideAfterTime:1.0];
            break;
        case 2:
            
            [ZJProgressHUD showSuccess];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [ZJProgressHUD hideHUD];
            });
            break;
        case 3:
            [ZJProgressHUD showSuccessAndAutoHideAfterTime:1.f];
            break;
        case 4:
            [ZJProgressHUD showSuccessWithStatus:@"加载成功!!"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [ZJProgressHUD hideHUD];
            });
            break;
        case 5:
            // 显示加载成功的图片和文字提示, 1s后自动隐藏
            [ZJProgressHUD showSuccessWithStatus:@"加载成功!!" andAutoHideAfterTime:1.f];

            break;
        case 6:
            [ZJProgressHUD showProgress];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [ZJProgressHUD hideHUD];
            });
            break;
        case 7:
            // 显示加载动画, 需要加载完成后调用hideHUD隐藏
            [ZJProgressHUD showProgressWithStatus:@"正在努力加载中..."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [ZJProgressHUD hideHUD];
            });
            break;
        case 8: {
            /// 内部的HUDView是遵守ZJPrivateHUDProtocol的, 在显示的时候会被调整为居中显示
            ZJTextOnlyHUDView *custom = [[ZJTextOnlyHUDView alloc] init];
            
            custom.text = @"这是自定义的";
            custom.textColor = [UIColor blueColor];
   
            [ZJProgressHUD showCustomHUD:custom andAutoHideAfterTime:1.0];

        }
            break;
        case 9: {
            // 不遵守ZJPrivateHUDProtocol的, 在显示的时候会使用这里设置的frame
            UILabel *custom = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            custom.textColor = [UIColor blueColor];
            custom.text = @"这是自定义的";
            custom.backgroundColor = [UIColor blackColor];
            
            [ZJProgressHUD showCustomHUD:custom andAutoHideAfterTime:1.0];
        }
            break;
            
        default:
            break;
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (NSArray<NSString *> *)titlesArray {
    if (!_titlesArray) {
        _titlesArray = @[@"提示文字, 不会自动隐藏", @"提示文字, 会自动隐藏", @"提示成功 显示默认的图片, 不会自动隐藏", @"提示成功 显示默认的图片, 会自动隐藏", @"提示成功 显示默认的图片和设定的文字提示, 不会自动隐藏", @"提示成功 显示默认的图片和设定的文字提示, 会自动隐藏", @"提示正在加载 显示默认的图片 不会自动隐藏", @"提示正在加载 显示默认的图片和文字提示 不会自动隐藏", @"弹出自定义的提示框 不会自动隐藏", @"弹出自定义的提示框 会自动隐藏"];
    }
    return _titlesArray;
}

// 最初的时候是这样的 当然现在也可以这样来使用
- (void)original {
    /// 初始化contentView
    ZJProgressHUD *contentView = [[ZJProgressHUD alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
    contentView.backgroundColor = [UIColor blackColor];
    // 居中显示
    contentView.center = self.view.center;
    /// 初始化HUDView 和contentView大小一样
    UILabel *hudView = [[UILabel alloc] initWithFrame:contentView.bounds];
    hudView.textColor = [UIColor whiteColor];
    hudView.text = @"提示文字...";
    /// 设置/添加HUDView
    [contentView setHudView:hudView];
    // 被window弹出, 同时设置显示的时间, 当设置的时间小于等于0的时候将不会自动移除
    // 这里设置为0 则会一直显示在页面上, 直到手动调用hide方法才会被移除
    [contentView showWithTime:0];
    /// 这里模拟延时操作
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        /// 操作完成, 移除hud
        [contentView hide];
    });
}
@end
