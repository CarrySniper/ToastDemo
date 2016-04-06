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
}

- (IBAction)showAction:(id)sender {
    [[Toast shareInstance] makeToast:@"Toast提示框" duration:3.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
