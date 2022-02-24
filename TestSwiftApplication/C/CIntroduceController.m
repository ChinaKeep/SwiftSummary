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
    introduceMsg.frame  = CGRectMake(10, 60, UIScreen.mainScreen.bounds.size.width - 20, 300);
    introduceMsg.text = @"用C语言完全重写了UNIX操作系统（以前是使用汇编语言） 1.C语言标准 C被国际标准化组织ISO采纳,发布标准 1999年  发布 c99标准 2011    发布 c11标准 每一个函数都有自己的名称 每一个函数的名称都是唯一的 C语言程序运行之后，默认会自动执行main函数代码 C语言是区分大小写的  大小写敏感,case-sensitive  对于同一份源代码，经过不同的编译器编译出来的目标文件（体积、格式、运行效率）是不一样的   1、Windows： PE格式（经常以 .exe 作为文件扩展名） 2、Linux: ELF格式  3、Mac: Mach-o格式 ";
    introduceMsg.numberOfLines = 0;
    [self.view addSubview:introduceMsg];
    

    printf("%d", getchar());
    printf("\n hello word\n");
    
    UILabel *variableMsg = [[UILabel alloc]init];
    variableMsg.frame  = CGRectMake(10, introduceMsg.frame.size.height + 25, UIScreen.mainScreen.bounds.size.width - 20, 100);
    [self.view addSubview:variableMsg];
    variableMsg.textColor = UIColor.redColor;
    variableMsg.numberOfLines = 0;
    variableMsg.text = @"变量  变量使用前需要进行初始化操作 \n  可以同时定义多个同一类型的数据 \n  变量的作用域";
    
    int score;
    score = 150;
    printf("score:%d",score);
    
    /*
     字符串（String）
     用双引号包住的内容叫做： 字符串（由若干个【字符】组成的一串数据）
     */
    
    UILabel *stingMsg = [[UILabel alloc]init];
    stingMsg.frame  = CGRectMake(10, variableMsg.frame.size.height + variableMsg.frame.origin.y + 15, UIScreen.mainScreen.bounds.size.width - 20, 30);
    [self.view addSubview:stingMsg];
    stingMsg.textColor = UIColor.redColor;
    stingMsg.numberOfLines = 0;
    stingMsg.text = @" 字符串 ";
    
    int age = 100;
    printf("\n---%d",age);
    
    
    
    UILabel *decimal = [[UILabel alloc]init];
    decimal.frame  = CGRectMake(10, stingMsg.frame.size.height + stingMsg.frame.origin.y + 15, UIScreen.mainScreen.bounds.size.width - 20, 30);
    [self.view addSubview:decimal];
    decimal.textColor = UIColor.redColor;
    decimal.numberOfLines = 0;
    decimal.text = @"十进制";
    
    
    //C语言中数组名 一个指针常量，指向这个数组第一个元素的地址，数组的首地址
    /*
     0x14  //十六进制 20
     
     */
    printf("\n进制打印");
    int i1 = 20;        //十进制
    int i2 = 024;       //八进制
    int i3 = 0x14;      //十六进制
    int i4 = 0b10100;   //二进制
    
    printf("%d %d %d %d",i1,i2,i3,i4);
    // %d  %i  十进制
    int i = 20;
    printf("\n十进制：%d\n",i);     //decimal  十进制
    printf("十进制：%i\n",i);       //integer
    printf("八进制：%o\n",i);       //octal 八进制
    printf("十六进制：%x\n",i);      //hexadecimal 十六进制
    
    
    
    
}



@end
