//
//  Toast.h
//  ToastDemo
//
//  Created by ck_chan on 16/4/6.
//  Copyright © 2016年 ck_chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//声明定义一个ToastLabel对象
@interface ToastLabel : UILabel
- (void)setMessageText:(NSString *)text;
@end


//.h文件自身的声明定义
@interface Toast : NSObject{
    ToastLabel *toastLabel;
    NSTimer *countTimer;
}

//创建声明单例方法
+ (instancetype)shareInstance;

- (void)makeToast:(NSString *)message duration:(CGFloat)duration;

@end
