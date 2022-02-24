//
//  OperatorController.m
//  TestSwiftApplication
//
//  Created by Keep on 2021/12/16.
//

#import "OperatorController.h"

@interface OperatorController ()
@property (weak, nonatomic) IBOutlet UILabel *operatorName;
@property (weak, nonatomic) IBOutlet UILabel *operatorCompare;

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
    printf("请输入两个整数\n");
    int v1,v2;
    scanf("%d%d",&v1,&v2);
    printf("%d和%d的平均数是%f\n",v1,v2,(v1+v2)/2.0);
    
    //隐式类型转换
    //在进行一些算数运算时，小类型会被隐式转换成大类型
//    char < short < int < long < long long < float < double < long double
    printf("----------\n");
    // 注意：任何小于int的整数类型，在运算时都会隐式转换为int类型
    printf("%zd",sizeof('A')); //字符相当于其ASCII值65 int类型4个字节
    
    
    self.operatorName.text = @"当一个表达式中同时使用多个运算符时 会根据运算符的优先级和结合性，来决定运算符的执行顺序 优先级越高（优先值越小，越先被执行）优先级一样，根据结合性决定执行顺序  可以使用小括号来调整优先级 当自己记不住（不确定）运算符的优先级时，多使用小括号即可 自增 自减运算符 前缀（prefix） 自增运算符：++a  自减运算符： --a 后缀（postfix）:自增运算符： a++  自减运算符：a--";
    
    printf("-----\n");
    
    int a = 1;
    // 此时 a = 4 + 1 最后赋值
    //       2    3     3     4
    int b = ++a + ++a + a++ + a++;
    printf("%d %d \n",a,b);
    
    
    self.operatorName.text = @"比较运算符：";
    
    
    
    
    
    
    
     
    
    
}

@end
