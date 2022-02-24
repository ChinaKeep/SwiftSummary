//
//  ArrayController.m
//  TestSwiftApplication
//
//  Created by Keep on 2021/12/24.
//

#import "ArrayController.h"

@interface ArrayController ()
@property (weak, nonatomic) IBOutlet UILabel *arrayName;

@end

@implementation ArrayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"数组";
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.arrayName.text = @"数组的定义： 元素类型 数组名【元素的数量】" ;
    //声明了一个数组ages,并且进行了初始化
    //ages可以存放5个int类型的元素
    int ages[5] = {20,18,19,17,21};
    
    //声明一个数组heights，并且进行了初始化
    //heights可以存放4个double类型的元素
    double heights[4] = {1.55,1.82,2.11,1.67};
    
    
    //遍历数组
    for (int i = 0 ; i < sizeof(heights)/sizeof(double) ; i ++) {
        printf("\n%f = %p\n",heights[i],&heights[i]);
    }
    /**
     1、如果没有初始化，数组元素的值是不确定的
     2、如果在声明的同时进行初始化，可以不指定元素的数量
     3、可以在声明的时候指初始化部分元素，其他元素默认会初始化为0
     
     */
    //gcc 编译器的首个元素默认是0
    int a[3];
    printf("0号位置的元素为:%d",a[0]);
    
    int c[5] = {};
    printf("\n编译器识别：%d",c[0]);
    
    /*
     数组的初始化元素数量不能超过数组的长度
     数组在声明的同时进行初始化，其长度不能是变量
     
     在数组声明以后，不能再通过大括号进行赋值
     
     数组名代表数组的地址，是固定值
     数组的索引若越界，访问的数值是不确定的
     
     */
    
    
}



@end
