//
//  ViewController.m
//  ToastDemo
//
//  Created by ck_chan on 16/4/6.
//  Copyright © 2016年 ck_chan. All rights reserved.
//

#import "ViewController.h"
#import "Toast.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //要注意，直接放这里是不显示的。
    //[[UIApplication sharedApplication]keyWindow]还没有加载
    
    UILabel *download = [[UILabel alloc]initWithFrame:CGRectMake(10, 180, self.view.frame.size.width-20, 80)];
    download.text = @"demo下载地址：\nhttps://github.com/cjq002/ToastDemo.git";
    download.textAlignment = NSTextAlignmentCenter;
    download.numberOfLines = 0;
    [self.view addSubview:download];
}

- (IBAction)showAction:(id)sender {
    [[Toast shareInstance] makeToast:@"Toast提示框" duration:3.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
