//
//  JHTest5VC.m
//  MasonryDemo
//
//  Created by qujiahong on 2018/7/23.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

#import "JHTest5VC.h"
#define myKeyboardWillChangeFrameNotification @"keyboardWillChangeFrameNotification"
#define myKeyboardWillDisapplerNotification @"myKeyboardWillDisapplerNotification"

@interface JHTest5VC ()
/** text*/
@property (nonatomic, strong) UITextField * textField;
@end

@implementation JHTest5VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTextField];
    
}

- (void)setupTextField{
    
    self.textField = [UITextField new];
    self.textField.backgroundColor = JHRandomColor;
    self.textField.frame = CGRectMake(10, SCREEN_HEIGHT/2-40, SCREEN_WIDTH - 20, 40);
    self.textField.placeholder = @"我会上浮不被遮挡的～～～";
    [self.view addSubview:self.textField];
    
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerX.equalTo(self.view);
        make.bottom.mas_equalTo(-200);
        make.height.mas_equalTo(40);
    }];
    
//    //注册
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisapplerNotification:) name:UIKeyboardWillHideNotification object:nil];
    
   
}


#pragma mark - 监听键盘即将出现
- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification{
    NSLog(@"监听键盘即将出现");
    //获取键盘的基本信息-动画时长、键盘高度
    NSDictionary *userInfo = [notification userInfo];
    CGRect rect = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = CGRectGetHeight(rect);
    CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //修改下边距约束
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-keyboardHeight);
    }];
    
    //更新约束
    [UIView animateWithDuration:keyboardDuration animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

#pragma mark - 监听键盘即将消失
- (void)keyboardWillDisapplerNotification:(NSNotification *)notification{
    NSLog(@"监听键盘即将消失");
    //获取键盘的基本信息-动画时长
    NSDictionary *userInfo = [notification userInfo];
    CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    //修改为以前的约束[更新约束]
    [UIView animateWithDuration:keyboardDuration animations:^{
        [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerX.equalTo(self.view);
            make.bottom.mas_equalTo(-200);
            make.height.mas_equalTo(40);
        }];
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:YES];
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:myKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:myKeyboardWillDisapplerNotification object:nil];
    
}
@end
