//
//  MemoryController.m
//  TestSwiftApplication
//
//  Created by Keep on 2021/12/30.
//

#import "MemoryController.h"

struct Stu {
    int num;
    char name[30];
    char sex;
    float score;
};

@interface MemoryController ()

@end

@implementation MemoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"数据之间的转化";
     /*
      有补码的编码规则导致的，数据的取值范围为 【-128，127】
      补码 =  反码 + 1
      
      为什么需要类型？
      数据类型提供了，申请内存单元的大小和访问规则。
      数据类型是架设在线性内存上的一种逻辑
      
      */
    
    
#if 0
    
    char  0 - 127  ASCII
    short
    int
    long long
    
#endif
    
    struct Stu s;
    printf("学生：%p",s);
    
    struct Stu *p = malloc(sizeof(struct Stu));
    p->num = 100;
    p->sex = 'y';
    p->score = 100;
    strcpy(p->name, "张三");
    
    printf("\n学生：%p\n",p);
    
//    char a = 0xff;
//    printf("a的值为：%d\n",a);
    
    unsigned int  a1 = 1;
    int b = -100;
    
    printf("值为：%u\n",-100);
    
    if(a1+b > a1)
        printf("xxx\n");
    else
        printf("0000\n");
    
    //xxx
    printf("--------\n");
    
  
    
    foo();

    foot(-1);
    
    charlength();
    
    arguments(6,"张三");
    
    printf("交换函数");
    int m = 5;
    int n = 6;
    swap(m, n);
    printf("数字交换 m=:%d,n=:%d",m,n);
 
    printf("二级指针\n");
    twoPointer();
}

void  foo(void){
    unsigned int a = 6;
    int b = -20;
    printf("a+b的值是：%u\n",a+b);
    
    (a+b > 6)? puts(">6"):puts("<=6");
}

void foot(unsigned char max){
    for (int i = 0; i< max; i++) {
        printf("\n===%d",i);
    }
}

/*
二进制表示 -1
原码: 1000 0001
反码: 1111 1110  反码：对于负数，符数位不变，将数值位诸位取反为反码
补码: 1111 1111  补码：符数位不变，将反码 + 1 = 补码

二进制表示 -2
原码: 1000 0010
反码: 1111 1101
补码: 1111 1110


二进制表示 -3
原码: 1000 0011
反码: 1111 1100
补码: 1111 1101

二进制表示 -4
原码: 1000 0100
反码: 1111 1011
补码: 1111 1100
    
 。。。

 二进制表示 -n
 补码: 0000 0000
 */

int charlength(void){
    char a[1000];
    int i;
    for (int i = 0; i<1000; i++) {
        a[i] = -1 - i; // a是char类型，只有一个字节8位，所以最大存储256  从-1开始算起，少一位最终结果255===-----255-----
        printf("\n当前索引：%d 当前的值为：%c\n ",i,a[i]);
    }
    printf("\n-----%d-----\n",strlen(a)); //strlen 遇到0结束，所以只有255个
    return strlen(a);
}
/*
 进程空间
 */

//a.out 参数
//char *argv[] 指针数组

int arguments(int argc,char *argv[]){
    if (argc != 2) {
        printf("pls input: a.out num\n");
        return -1;
    }
    int num = atoi(argv[1]);
    for (int i = 0; i<num; i++) {
        printf("hello word\n");
    }
    return 0;
}

int recursive(int n){
    if (n == 5) {
        return 5;
    }else{
        return  recursive(n+1) +3;
    }
}

//交换函数
void swap(int a,int b){
    int temp = a;
    a = b;
    b = temp;
}

//二级指针
void twoPointer(void){
    int a = 100;
    int b = 300;
    int *p = &a;
    
    int **pp = &p;
    *pp = &b;
    *p = 500;
    
    printf("a = %d\n",a);
    printf("b = %d\n",b);
    
    
}

@end
