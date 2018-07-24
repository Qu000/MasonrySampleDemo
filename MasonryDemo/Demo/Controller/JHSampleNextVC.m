//
//  JHSampleNextVC.m
//  MasonryDemo
//
//  Created by qujiahong on 2018/7/23.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

#import "JHSampleNextVC.h"

@interface JHSampleNextVC ()
/** 大视图*/
@property (nonatomic, strong) UIView * bigView;
/** label*/
@property (nonatomic, strong) UILabel * lab;
/** button*/
@property (nonatomic, strong) UIButton * btn;
@end

@implementation JHSampleNextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    
    [self setupView];
    [self setupLab];
    [self setupBtn];
    
    [self setupFrameWithMasonry];
}

- (void)setupView{
    UIView *bigView = [[UIView alloc]init];
    bigView.backgroundColor = JHRGB(255, 235, 227);
    [self.view addSubview:bigView];
    self.bigView = bigView;
}
- (void)setupLab{
    UILabel *lab = [[UILabel alloc]init];
    lab.backgroundColor = JHRandomColor;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"frame(10,10,7*高,30)";
    lab.numberOfLines = 0;
    [self.bigView addSubview:lab];
    self.lab = lab;
}
- (void)setupBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setBackgroundColor:JHRandomColor];
    [btn setTitle:@"frame(与lab同left，离lab20，self，宽*1/2)" forState:UIControlStateNormal];
    [self.bigView addSubview:btn];
    self.btn = btn;
}
- (void)setupFrameWithMasonry{
    WS(ws);
    
    [self.bigView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 300));
        make.center.equalTo(ws.view);
    }];
    
    NSInteger padding = 10;
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(padding);
        make.height.equalTo(@30);
        make.width.mas_equalTo(ws.lab.mas_height).multipliedBy(7);
        
    }];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.lab);
        make.top.equalTo(ws.lab.mas_bottom).offset(2*padding);
        make.right.equalTo(ws.bigView).offset(-10);
        make.height.mas_equalTo(ws.bigView.mas_width).multipliedBy(1/2);
    }];
}












@end
