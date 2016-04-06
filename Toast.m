//
//  Toast.m
//  ToastDemo
//
//  Created by ck_chan on 16/4/6.
//  Copyright © 2016年 ck_chan. All rights reserved.
//

#import "Toast.h"

#define DeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define DeviceHeight ([UIScreen mainScreen].bounds.size.height)

static int changeCount;

@implementation Toast

/**
 *  实现声明单例方法 GCD
 *
 *  @return 单例
 */
+ (instancetype)shareInstance
{
    static Toast *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[Toast alloc] init];
    });
    return singleton;
}

/**
 *  初始化方法
 *
 *  @return 自身
 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        toastLabel = [[ToastLabel alloc]init];
        
        countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
        countTimer.fireDate = [NSDate distantFuture];//关闭定时器
    }
    return self;
}

/**
 *  弹出并显示Toast
 *
 *  @param message  显示的文本内容
 *  @param duration 显示时间
 */
- (void)makeToast:(NSString *)message duration:(CGFloat)duration
{
    if ([message length] == 0) {
        return;
    }
    [toastLabel setMessageText:message];
    [[[UIApplication sharedApplication]keyWindow] addSubview:toastLabel];
    
    toastLabel.alpha = 0.8;
    countTimer.fireDate = [NSDate distantPast];//开启定时器
    changeCount = duration;
}

/**
 *  定时器回调方法
 */
- (void)changeTime
{
    //NSLog(@"时间：%d",changeCount);
    if(changeCount-- <= 0){
        countTimer.fireDate = [NSDate distantFuture];//关闭定时器
        [UIView animateWithDuration:0.2f animations:^{
            toastLabel.alpha = 0;
        } completion:^(BOOL finished) {
            [toastLabel removeFromSuperview];
        }];
    }
}
@end

#pragma mark - ToastLabel的方法
@implementation ToastLabel

/**
 *  ToastLabel初始化，为label设置各种属性
 *
 *  @return ToastLabel
 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor blackColor];
        self.numberOfLines = 0;
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:15];
    }
    return self;
}

/**
 *  设置显示的文字
 *
 *  @param text 文字文本
 */
- (void)setMessageText:(NSString *)text{
    [self setText:text];
    
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(DeviceWidth-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font} context:nil];
    
    CGFloat width = rect.size.width + 20;
    CGFloat height = rect.size.height + 20;
    CGFloat x = (DeviceWidth-width)/2;
    CGFloat y = DeviceHeight-height - 59;
    
    self.frame = CGRectMake(x, y, width, height);
}

@end
