//
//  CPlusViewController.m
//  TestSwiftApplication
//
//  Created by Keep on 2021/7/29.
//

#import "CPlusViewController.h"
#include <iostream>
#import "JITelephoneInputTextField.h"
#include <stdio.h>/*预处理命令*/

using namespace std;

@interface CPlusViewController ()<UITextFieldDelegate>

@end

@implementation CPlusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    cout << "hello word" << endl;
    
    int x = 10;//定义x为整型变量，且赋值为10
    printf("x=%d\n",x);
    
    x = 89;
    printf("x=%d\n",x);//输出x变量的值
    
    //以分号结尾都称为语句；
    x = x + 100;
    printf("x=%d\n",x);
    
    /*标识符
     C语言标识符命名规则
     C语言标识符使用来标识变量、函数或者其他用户自定义的项目名称
     C语言标识符内不允许出现特殊符号，比如@、#、￥、！等
     C语言区分大小写字母
     
     C99新增关键字：_Bool _Complex _Imaginary inline restrict
     
     C11新增关键字：_Alignas _Alignof _Atomic _Generic _Noretern _Static_assert _Thread_local
     */
    

    /*
        方法一：利用NSPredicate
        注：NSPredicate所属Cocoa框架，在密码、用户名等正则判断中经常用到。
        类似于SQL语句
        NOT 不是
        SELF 代表字符串本身
        IN 范围运算符
        那么NOT (SELF IN %@) 意思就是：不是这里所指定的字符串的值
        
     */
    //统计数组相同元素的个数
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    //需要统计的数组
    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"3",@"3",@"3", nil];
    NSSet *set = [NSSet setWithArray:array];
    for (NSString *setstring in set) {
        //需要去掉的元素数组
        NSMutableArray *filteredArray = [[NSMutableArray alloc]initWithObjects:setstring, nil];
        NSMutableArray *dataArray = array;
        NSPredicate * filterPredicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",filteredArray];
        //过滤数组
        NSArray * reslutFilteredArray = [dataArray filteredArrayUsingPredicate:filterPredicate];
        //NSLog(@"Reslut Filtered Array = %@",reslutFilteredArray);
        int number = (int)(dataArray.count-reslutFilteredArray.count);
        //NSLog(@"number :%d",number);
        [dic setObject:[NSString stringWithFormat:@"%d",number] forKey:setstring];
    }
    NSLog(@"dic :%@",dic);
        



    
    
    
    
    JITelephoneInputTextField *textField = [[JITelephoneInputTextField alloc]init];
    textField.frame = CGRectMake(100, 100, 200, 50);
    textField.numShowMode = JITelephoneInputTextField_numShowMode_344;
    textField.openFirstNumLimit = YES;
    textField.firstNum = 1;
    textField.delegate = self;
    [self.view addSubview:textField];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if([textField isKindOfClass:JITelephoneInputTextField.class]){
        JITelephoneInputTextField *field = (JITelephoneInputTextField*)textField;
        return [field telephoneTextFieldShouldChangeCharactersInRange:range withValueString:string];
    }else{
        return YES;
    }
}


@end
