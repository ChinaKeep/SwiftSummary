//
//  CLanguageControllerViewController.m
//  TestSwiftApplication
//
//  Created by Keep on 2022/3/14.
//

#import "CpLanguageController.h"
#include <stdio.h>

struct DataStruct {
    int a;
    int b;
    int c;
    int d;
};
// 指针：有类型的地址
/*
 返回堆里的数组
 通过返回值
 */
char * getMem(int n){
    char *p = (char *)malloc(n);
    return  *p;
}

@interface CpLanguageController ()

@end

@implementation CpLanguageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"C语言";
    self.view.backgroundColor = UIColor.whiteColor;
    
    struct DataStruct d;
    
    int array[10];
    printf("&array[0] = %p\n",&array[0]); //&array[0] = 0x16afcf3c0
    printf("&array[0] + 1 = %p\n",&array[0]+1); //&array[0] + 1 = 0x16afcf3c4

    int a = 100;
    int b = 300;
    
    int *p = &a; *p = 200; //*p 指向的 是a的地址 ， a存储的是100
    printf("a = %d\n p=:%p\n",a,p); //a = 200 *p指的内容就是100
    
    // *pp 里面放的是p的内容，p的内容里面原来就是a的地址
    int **pp = &p; *pp = &b;
    *p = 500;
    
    printf("b:%d\n",b); //b:500
    
    int array1[10] = {9,8,7,6,5,4,3,2,1,0};
    selectSort(array1, 10);
    for (int i = 0; i< 10; i++) {
//        printf("%d\n",array1[i]);
    }
 
//    int *p1 = getMem(sizeof(int)*10);
//    if(p == NULL){
//        exit(-1);
//    }
//    free(p);
    
    //二级指针使用
    secondaryPointer();
    //获取最大债
    getMaxValue();
    //求次最大值
    getSecondMax();
    //构造类型
    getStuInfo();
    //截断行为
    truncateBehavior();
    
    //有符号和无符号相加
    addUnsignedAndSigned();
    
    //二级指针调用
    secondLevelPointerUse();
    
    //二维数组
    twoDimensionalArray();
    
    //二维数组取值
    twoDimensionalArrayValue();
}
//二维数组取值
void twoDimensionalArrayValue(){
    int arr[3][4] = {1,2,3,4,5,5,6,7,8,9,10,11,12};
    printf("a[1] = %p\n",arr[1]);
    printf("a[1] = %p\n",&arr[1][0]);
    
}
//二维数组
void twoDimensionalArray(){
    int arr[3][4];
    printf("%d\n",sizeof(arr)); //48
    
    //数组指针
    printf("arr = %p\n",&arr);          //arr = 0x16d9b72a8
    printf("arr + 1= %p\n",&arr + 1);   //arr + 1= 0x16b1ff2d8
    printf("arr + 2 = %p\n",&arr + 2);  //arr + 2 = 0x16b1ff308
    
    //int[4] arr[3]     type arr[3]             type[3] arr
    //int(*p)[3][4]  <- int[4] (*p)[3]  <-      type (*p)[3] <- type[3] *p;
    
    int(*p)[3][4] = &arr;
    printf("arr地址：%p\n",&arr); // arr地址：0x16f0172a8
    
    
    printf("p = %p\n",p);           // p = 0x16f0172a8
    printf("p+1 = %p\n",p+1);       // p+1 = 0x16f0172d8
    
    printf("*p === %p\n",&p); //*p === 0x16f2db2a0
}
// 二级指针的调用
void secondLevelPointerUse(){
    char *p;
    int result = secondLevelpointerReview(&p, 100);
    printf("result:%d\n",result);//result:1
    strcpy(p, "china");
    printf("%s\n",p); //china
    free(p);
    
}
//二级指针
int secondLevelpointerReview(char ** p,int n){
    *p = (char *)malloc(n);
    return  *p == NULL ? -1 : 1;
}

//有符号和无符号相加
void addUnsignedAndSigned(){
    int b = -6;
    unsigned int a = 20;
    int c = a + b;
    
    printf("c = %d\n",c);//c = 14
}


// 大数据赋给小数据 截断行为truncate
void truncateBehavior(){
   
    /*
     int a = 127;
     a = 127
     b = 127
     */
    
    int a = 255;
    /*
     二进制表示 -1
     原码: 1000 0001
     反码: 1111 1110  反码：对于负数，符数位不变，将数值位诸位取反为反码
     补码: 1111 1111  补码：符数位不变，将反码 + 1 = 补码
     
     a = 255
     b = -1
     */
    printf("a = %d\n",a);
    char b = a;
    
    printf("b = %d\n",b);
   
    
}
#if 0
    0000 0000   0000 0000   0000 0000     0111 1111
    0000 0000   0000 0000   0000 0000     0111 1111

    0000 0000   0000 0000   0000 0000     1111 1111

 
#endif

struct Stu{
    int num;
    char name[30];
    char sex;
};
// 构造类型
void getStuInfo(){
    int a;
    a = 10;
    
    struct Stu s;
    s.num = 100;
    strcpy(s.name, "keep");
    s.sex = 'y';
    
    struct Stu *ps = (struct Stu *)malloc(sizeof(struct Stu));
    ps->num = 101;
    strcpy(ps->name, "UUU");
    
    printf("name=%s,num = %d\n",ps->name,ps->num);
}
/// 一次循环求次最值
void  getSecondMax(){
    int arr[10]= {1,2,3,4,9,8,7,6,5,0};
    int max;
    int subMax;
    if (arr[0] > arr[1]) {
        max = arr[0];subMax = arr[1];
    }else{
        max = arr[1];subMax = arr[0];
    }
    for (int i = 2; i < 10; i++) {
        if (arr[i] > max) {
            subMax = max; //假设subMax 等于最大值，知道遇到比max更大的值
            max = arr[i];
        }else if (subMax <arr[i] ){
            subMax = arr[i];
        }
    }
    printf("\nmax=:%d subMax=:%d\n",max,subMax); //max=:9 subMax=:8

}
//求最大值
void getMaxValue(){
    int arr[10]= {1,2,3,4,9,8,7,6,5,0};
    int max = arr[0];
    for (int i = 1; i < 10; i++) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    printf("max:%d",max);
}
//二级指针使用
void secondaryPointer(){
    char *p = NULL;
    p = (char *)malloc(100);
    strcpy(p, "abcd");
    printf("P:%s\n",p);
}
/**
    当做参数传递
 当一维数组作参数的时候，要想到，他是一个构造类型
 要想到的是类型的起始地址、步长、寻址范围，有没有传递过去
 */
void selectSort(int *p,int n){
    int tmp;
    for (int i = 0; i < n-1; i++){
        for (int j = i + 1; j < n; j++) {
            if (p[i] > p[j]) {
                tmp = p[i];
                p[i] = p[j];
                p[j] = tmp;
            }
        }
    }
}


@end
