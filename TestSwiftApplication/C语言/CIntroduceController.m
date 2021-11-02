//
//  CIntroduceController.m
//  TestSwiftApplication
//
//  Created by Keep on 2021/11/2.
//

#import "CIntroduceController.h"
#include <stdio.h>/*预处理命令*/

@interface CIntroduceController ()

@end

@implementation CIntroduceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"C语言简介";
    
    UILabel *introduceMsg = UILabel.alloc.init;
    introduceMsg.frame  = CGRectMake(10, 100, UIScreen.mainScreen.bounds.size.width - 20, 100);
    introduceMsg.text = @"用C语言完全重写了UNIX操作系统（以前是使用汇编语言）";
    introduceMsg.numberOfLines = 0;
    [self.view addSubview:introduceMsg];
    
    //1.C语言标准
    /*
     C被国际标准化组织ISO采纳,发布标准
     1999年  发布 c99标准
     2011    发布 c11标准
     
     */
    printf("hello word")
    
    
    
    
    
}



@end
