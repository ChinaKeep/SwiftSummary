//
//  CharTypeController.m
//  TestSwiftApplication
//
//  Created by Keep on 2021/11/18.
//

#import "CharTypeController.h"
#import <Masonry.h>
@interface CharTypeController ()

@end

@implementation CharTypeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"Char类型";
    UILabel *charLabel = [[UILabel alloc]init];
    charLabel.numberOfLines = 0;
    [self.view addSubview:charLabel];
    [charLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@300);
    }];
    
    charLabel.text = @"字符使用单引号 字符串使用双引号 一个char类型的变量占用一个字节的内存 所以它只能存储一个单字节字符 26个英文字母的大小写（a~z,A~Z)、10个阿拉伯数字（0~9）等都是单字节字符";
    /*
     
     字符使用单引号   字符串使用双引号
     一个char类型的变量占用一个字节的内存
     所以它只能存储一个单字节字符
     
     26个英文字母的大小写（a~z,A~Z)、10个阿拉伯数字（0~9）等都是单字节字符
     计算机中的数据都是以二进制形式存储的，字符数据也不例外
     每一个字符都会被转化成对应的整数值进行存储
     
     在1967年，美国发布了ASCII码表，里面规定了128个单字节字符
     对应的整数值（ASCII码值）
    
     GBK主要支持的是CJK汉字字符（C指中国、J指日本、K指朝鲜）,而UTF-8支持几乎世界上所有的文字字符
     
     
     
     */
    
    
    char c = 'J';
    
    printf("%c",c);
    
    int i = 97;
    char c1 = 'A'; //65
    char c2 = 'a'; //97
    
    printf("i：%d  c1:%d  c2:%d",i,c1,c2);
    
    
    char *s = "码";
    printf("%p",s);
    
    /*
     转义序列（Escape sequences）
     转义序列，一般也叫做转义字符，是一些有特殊含义的字符
     */
    printf("\nhello\tword!");//  \t水平制表符
    
    printf("\nhello\vword!!\n"); // \v垂直制表符
    
    char  c3 = '"';
    printf("%c",c3);
    
    
    char c4 = '\063';
    printf("\n%d %c",c4,c4); //51 3  51对应的ASCII码 为3
    
    char c5 = '\x72';
    printf("\n %c",c5);
    
    
    /*
     转义序列
     \nnn  任意八进制值
     \xnn  任意十六进制值
     
     */
    printf("---------\n");
    printf("\xD0\xA1\xC2\xEB\xB8\xE7");
    printf("\n-----000-----\n");
    printf("\xD0\xA1\xC2\xEB\xB8\xE7");
    printf("\n-----111-----\n");

    char *s1 = "小码哥";
    printf("s1:%p",s1);
    
    printf("\n-----222-----\n");

    
    printf("\x07\x66\x1A\x33");
     
    UILabel *scanfFunc = [[UILabel alloc]init];
    scanfFunc.text = @"scanf函数\n读取键盘输入的数据 \n空白字符包括： 空格（''）、 Tab('\t')、Enter('\n')在格式化字符串中，任意长（长度>=0）连续空白字符 能匹配输入的任意长（长度>=0）连续空白字符  \n              \n注意：不要在最后匹配空格，否则可能存在一直无法匹配成功的情况 ";
    scanfFunc.numberOfLines = 0;
    [self.view addSubview:scanfFunc];
    [scanfFunc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(@200);
        make.height.equalTo(@500);
    }];
    
    NSLog(@"\n=====================\n");
    int age = 8;
    scanf("值是：%d",&age); //进行匹配  当中途有匹配失败时，将结束匹配
    printf("你的年龄是：%d岁",age);
    
    
    
    
    
}




@end
