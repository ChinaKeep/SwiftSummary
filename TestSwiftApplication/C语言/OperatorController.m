//
//  OperatorController.m
//  TestSwiftApplication
//
//  Created by Keep on 2021/12/16.
//

#import "OperatorController.h"

@interface OperatorController ()

@end

@implementation OperatorController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"运算符";
    printf("%d\n",7/4);
    
    /*
    
     1、整数与整数进行运算，结果依然是整数
     2、整数除以整数时，直接剔除小数部分，并非四舍五入
     3、浮点数与浮点数进行运算，结果依然是浮点数
     4、整数与浮点数进行运算，结果是浮点数
     
     
     模运算结果的正负性跟随运算符左边的操作数
     
     */
}

@end
