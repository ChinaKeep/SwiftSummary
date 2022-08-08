//
//  ArrayPointerController.m
//  TestSwiftApplication
//
//  Created by Keep on 2022/7/29.
//

#import "ArrayPointerController.h"

@interface ArrayPointerController ()

@end

@implementation ArrayPointerController

//数组指针 int （*p)[4]  指针数组 int *p [4]
void func (int (*p)[4], int n){ //按照一维数组的类型就行传递，数组指针类型
    for (int i  = 0; i< n; i++) {
        for (int j = 0 ; j < 4; j++) {
            printf("%d\t",p[i][j]); //制表符
        }
        putchar(10); //putchar输出字符，因为10是整数，所以系统只能将其转换为对应的ASCII字符，ASCII中10对应的是，line feed（换行）所以，此语句才实现了换行功能
    }
}
/*
 一维数组名本质是  一级指针
 二维数组名本质是  数组指针
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"数组指针";
    self.view.backgroundColor  = UIColor.whiteColor;
    
    UILabel *textLb = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.view.frame.size.width-20, 200)];
    textLb.numberOfLines = 0;
    [self.view addSubview:textLb];
    textLb.text = @"二维数组在逻辑上是二维的，但是在存储上却是一维的，正是这个特点，也可以用一维数组的方式去访问二维数据的";
    
    // 线性存储和线性访问
//    [self lineStroe];
    //数组指针
//    [self arrayPoint];
    //指针数组
    [self pintArray];
}

//指针数组
- (void)pintArray{
    int a[5][5];
    int (*p) [4];
    p =  (int(*)[4])a ; //强制类型转换
    printf("%d \n",&p[4][2] - &a[4][2]); // (4*4 + 2*4) - (4*5 + 2*4) =  -4
    
}


// 数组指针
- (void)arrayPoint{
    int arr[10];
    int *p = arr;
    int(*pa)[10] = &arr; //对一维数组取地址，等价于数组指针而不是二级指针
    /*
     int (*pName)[N]; //数组指针
     语法解析： （）的优先级笔 【】 高， *号和pName 构成一个指针的定义，指针的类型为 int[N]
     别名： typedef int(*TYPE)[N]
     */
    
    typedef int(*QQ)[4]; //数组指针
    QQ q;
    
    printf("q = %p\n",q);//q = 0x0
    printf("q+1 = %p\n",q+1);// q+1 = 0x10
    
    
    int array[12] = {1,2,3,4,5,6,7,8,9,10,11,12};
    int (*pointer)[6] = (int(*)[6])array;
    for (int i = 0; i < sizeof(array)/sizeof(int[6]); i++) {
        for (int j = 0 ; j < 6; j++) {
            printf("%d\t",pointer[i][j]); //一维数组 用二维数组的方式打印
        }
        putchar(10);
    }
}

// 线性存储
- (void)lineStroe{
    int a[3][4] = {1,2,3,4,5,6,7,8,9,10,11,12};
    
    int *p = (int*)a;
    for (int i = 0; i< 12; i++) {
        printf("%d = ",p[i]); //1 = 2 = 3 = 4 = 5 = 6 = 7 = 8 = 9 = 10 = 11 = 12 = 可以是因为线性存储，给一个指针就可以访问了
    }
    printf("\n======\n");
    func(a, 3);// 起始地址 步长  范围
    //1    2    3    4
    //5    6    7    8
    //9    10    11    12
    printf("\n======\n");
    for (int i = 0; i<3; i++) {
        for (int j = 0; j<4; j++) {
            printf("%d\t",*(*(a+i)+j));
        }
        puts("\n");
    }
}

@end

