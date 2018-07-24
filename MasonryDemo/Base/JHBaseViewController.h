//
//  JHBaseViewController.h
//  MasonryDemo
//
//  Created by qujiahong on 2018/7/23.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define JHRGB(r,g,b) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0]
#define JHRandomColor JHRGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;
@interface JHBaseViewController : UIViewController

@end
