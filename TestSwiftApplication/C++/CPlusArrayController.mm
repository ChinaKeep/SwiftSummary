//
//  CPlusArrayController.m
//  TestSwiftApplication
//
//  Created by Keep on 2022/5/18.
//

#import "CPlusArrayController.h"
#include "string.h"


@interface CPlusArrayController ()<CAAnimationDelegate>
@property (nonatomic, assign)   int     animationDuration;
@property (nonatomic, assign)   UIView  * aniView;
@end

@implementation CPlusArrayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    //二维数组
    [self twoDimensionalArray];

    //指针改变
//    [self pointerChange];
    //赋值 截断
//    [self truncateLearn];
    
    //求次最大值
//    [self getSecondMax];
    //求最大值
//    [self getMaxNumber];
    
    //字符串写进自己分配的内存中
//    [self charAlloc];
    
    //二级指针
//    [self secondaryPointer];
    
    //堆内数据
//    [self heapStudy];
    
    //栈内数据
//    [self stackStudy];
    
//    数组调用
//    [self arrayFunc];
    
//    指针本质的理解
//    [self pointerUnderstand];
}
// 二维数组
- (void)twoDimensionalArray{
    int arr[3][4] = {1,2,3,4,5,6,7,8,9,10,11,12}; // 3 x 4 x 4 int类型占用4个字节
    printf("sizeArray:%lu\n",sizeof(arr)); //sizeArray:48
    
    printf("arr === %p\n",arr); //'int[4] (*)' 数组指针 arr = 0x16fa2f358
    
    printf("&arr = %p\n",&arr); //'int[4] (*)' 数组指针arr = 0x16f517358
    printf("&arr + 1 = %p\n",&arr + 1); //arr + 1 = 0x16f517388  48 = 3 * 16
    
    
    /*
     int arr[3][4] //三行四列的数组
     int[4] arr[3]            type arr[3]            type[3] arr
     int(*p)[3][4]            int[4] (*p)3           type (*p)3     type[3] *p
     */
    int(*p)[3][4] = &arr;
    
    int a[3][4] = {
        1,2,3,4,
        5,6,7,8,
        9,10,11,12
    }; // 3 x 4 x 4 int类型占用4个字节
    
    printf("a[1] == %p\n",a[1]); //a[1] == 0x16d52f338
    printf("a[1] == %p\n",&a[1][0]); //a[1] == 0x16d52f338
    printf("a[1] + 1 = %p\n",a[1]+1); //a[1] + 1 = 0x16d52f33c 相差4个字节一个int类型  a[1] == *(a+1) 解引用
    
    printf("*(a[1] + 1) = %d\n",*(a[1]+1)); //*(a[1] + 1) = 6 引用和解引用  取地址和取内容
     
    
    printf("a == %p\n",a); //a == 0x16d52f328 相差16
    printf("a+1 == %p\n",a+1); // a+1 == 0x16d52f338
    printf("a+ 1 + 1 = %p\n",a+1+1); // a+ 1 + 1 = 0x16d52f348
    
    
    printf("*(a+1) == %p\n",*(a+1)); //*(a+1) == 0x16d55f338
    printf("*(a+ 1) + 1 = %p\n",*(a+1)+1); //*(a+ 1) + 1 = 0x16d55f33c
    
    printf("*(*(a+1)+1) = %d\n",*(*(a+1)+1)); //*(*(a+1)+1) = 6 第一个*是取内容  第二个* 是解引用
    
    
}
// 指针修改
-(void)pointerChange{
    int a;
    int b;
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
 
 
 位（Bit）
 由于计算机只能识别0和1，所以每一个字节中的数据都是以二进制的形式存储的
 
 变量的内存地址：变量首字节的内存地址
 首字节：地址最小的那个字节
 变量是堆的形式存储的，所以先创建的变量的内存地址搞
 
 
 17: 原码 -  反码  - 补码
 int类型 属于有符号整数类型
 有符号数的二进制有三种表示方法： 原码 反码 补码
 
 三种表示方法均有符号位和数值位两部分：
 符号位：最高位作为符号位，用0表示正，用1表示负
 
 数值位：三种表示方法各不相同 表示绝对值的大小
 
 反码：
 正数的反码：和原码一样
 负数的反码：原码保持符号位不变、数值按位取反（0变1 、1变0）得到反码
 
 补码：
 正数的补码：和原码一样
 负数的补码：反码的末位加1，得到补码
      
 在计算机中 数值一律用补码来表示和存储
 
 
 大小端模式：决定了多字节数据的字节存储顺序
 
 按照 ： 123  1代表高位 3 代表低位
 
 大端模式：（Big-endian）:高低低高
 高字节放在低地址，低字节放在高地址
 
 小端模式：（Little-endian）:高高低低
 高字节 放在高地址，低字节放在低地址
 */

#if 0

0000 0000   0000 0000   0000 0000    0111 1111 // 127
0000 0000   0000 0000   0000 0000    0111 1111 // b = 127

0000 0000   0000 0000   0000 0001    1111 1111 // a = 255
0000 0000   0000 0000   0000 0000    1111 1111 // b = -1



#endif

//二进制截断行为 truncate
-(void)truncateLearn{
    int a = 255;
    printf("a = %d\n",a);
    
    char b = a;
    printf("b = %d\n",b);
    // a = 127
    // b = 127
    
    
    unsigned int A = 1;
    int B = -100;
    printf("A + B = %u\n",A+B); //A + B = 4294967197
    
    //栈 stack的 高地址 -->  低地址
    //堆 heap  低地址 ---->  高地址
    
    
}


/*
 为什么需要类型？
 数据类型提供了，申请内存单元的大小和访问规则。
 数据类型是架设在线性内存上的一种逻辑关系。
 */

//求次最值
-(void)getSecondMax{
    int arr[10] = {1,2,3,4,9,8,7,6,5,0};
    int max;
    int subMax;
    if (arr[0] > arr[1]) {
        max = arr[0];
        subMax = arr[1];
    }else{
        max = arr[1];
        subMax = arr[0];
    }
    for (int i = 2; i < 10; i++) {
        if (arr[i] > max) {
            subMax = max; //最大的变为次最大
            max = arr[i];
        }else if(subMax < arr[i]){
            subMax = arr[i];
        }else{
            
        }
    }
    printf("max:%d secondMax:%d",max,subMax);//max:9 secondMax:8
}
//求最大值
- (void)getMaxNumber{
    int arr[10] = {1,2,3,4,9,8,7,6,5,0};
    int max = arr[0];
    for (int i = 1; i < 10; i++) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    printf("max:%d\n",max); //max:9
}

int alloc(char **p,int num){
    *p = (char*)malloc(num);
    return *p == NULL? -1 : 1;
}
-(void)charAlloc{
    char *p = NULL;
    if (alloc(&p,100) > 0) {
        strcpy(p, "abcdefg");
    }
    printf("p===%s",p); //p===abcdefg
}

//二级指针
- (void)secondaryPointer{
    
    int a = 100;
    int b = 300;
    int *p = &a; //一级指针，指向的是a的地址，而a的地址存放的就是a的值100，所以指向的就是100
    
    *p = 200;

    
    printf("a== %d\n",a); //a == 200  通过p指针间接修改了a内容
    
    //指向地址的地址，就是指针，*m 存放的是一级指针p的地址
    int **m = &p;// **m 指向的是p的地址
    *m = &b; //现在*m 也就是p指向的地址，p指向的是b的地址
    
    *p = 500; //*p是 直接对b的地址内容进行修改
    
    printf("b === %d\n",b); //b === 500
    
}
//堆内数据
int * allocMem(int num){
    int *p = (int*)malloc(num); //int* 类型的指针p
    return p;
}
- (void)heapStudy{
    int *p = allocMem(sizeof(int)*10);
    if (p == NULL)
    exit(-1);
    
    for (int i = 0; i< 10; i++) {
        p[i] = i;
    }
    for (int i = 0; i<10; i++) {
        printf("%d=%s",p[i],"=="); //0===1===2===3===4===5===6===7===8===9===
    }
    free(p);//C语言的释放
}

double radians(float degress){
    return (degress * 3.1415926)/180.0;
}
//结构体
struct data{
    int a;
    int b;
    int c;
};
int a[5] = {1,2,3,4,5};

void func (int *array,int n){
    printf("sizeof(array) = %lu \n",sizeof(array));
}
void arraySize(int array[],int number){
    printf("arrayFunc:%lu\n",sizeof(array));
}
void arraySizeNumber(int array[1000],int number){
    printf("arraySizeNumber:%lu\n",sizeof(array));
}
void foo(char * p){
    printf("字符：%s",p);
}
void foo1(char p[]){
    //和上面的道理一样 === 等同的
}

//栈内数据
- (void)stackStudy{
    struct data d;
    d.a;
    d.b;
    d.c;
    //数组名作为起始地址访问成员
//    array[2]; *(array+2) *（2+array）2[array]  等价
     //下标法    偏移法
    //数组三要素： 其实地址、步长、范围
    int array[10];
    func(array, 10); //sizeof(array) = 8 指针的大小嘛就是8 其实传递的就是指针
    
    //数组大小验证
    arraySize(array, 100); //arrayFunc:8 传递的是数组指针，默认代表数组的其实地址
    //数组
    arraySizeNumber(array,10000); //arraySizeNumber:8
    
    char *p = "china";
    foo(p);
}

- (void)arrayFunc{
    
    int array[10];

//    array[2];  *(array+2)  *(2+ array)  2[array];


    printf("&array[0]    = %p\n",&array[0]);
    printf("&array[0] + 1= %p\n",&array[0]+1);


    printf("array   = %p\n",array);
    printf("array+1 = %p\n",array+1);


    // ˝◊Èµƒ»˝“™Àÿ£¨∆ ºµÿ÷∑£¨≤Ω≥§£¨∑∂Œß


    func(array,10);

}

// 指针的本质
- (void)pointerUnderstand{
    //数组作为整体使用，求大小，取地址
//    int a[10];
//    printf("%d\n",sizeof(a)); //40
//    printf("%d\n",sizeof(int[10])); //40
//
//
//    printf("%d\n",sizeof(&a)); //8
//
//    printf("%p\n",&a); //0x16f9633c0
//    printf("%p\n",&a+1);//0x16f9633e8 中间差了28 10进制为40
//
//
//    int(*p)[10] = &a; 数组指针类型
//    printf("%d\n",sizeof(p)); //8
    
    printf("=======\n");
    //指针的本质： 有类型的地址
    int a[5] = {1,2,3,4,5};
    /*
     &a + 1 取地址按照整体使用 +1 之后到 5后面了
     数组指针 x（int*） ==变成了 int*指针
     也就是说由 原来的数组指针 变为 int* 指针，指向从数组 变为 单个数组内容
     (int*)(&a+1) 此时指向的范围变小了 指向的是第6个
     ((int*)(&a+1)-1) 此时如果-1 就是减一个int类型 也就是到5的地址
     
     此时是int* 类型的 再进行取 *
     int*的位置上放的就是5 此时对这个地址进行取值
     此时取到的值是5
     */

    printf("%d\n",*((int*)(&a+1)-1)); //5
    /*
     ((int*)(&a+1)) 外层的大括号代表取内容
     */
    printf("%d\n",((int*)(&a+1))[-2] ); //4
    /*
     变为int* 类型的指针 后再进行取值后 为1
     */
    printf("=----=%d\n",*(int*)(&a+1)); // 1
    printf("=----=%d\n",*(int*)(&a+4)); // 1875310176 取的内存中存储的数据
    printf("=----=%d\n",*(int*)(&a+2)); // -2003216380 取的内存中存储的数据
  
    printf("=----=%d\n",(*(int*)(&a+1)) );

}
// 防盗水印动画
- (void)waterMoveAnimation{
    
    self.animationDuration = 25;
    
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 50, 100, 20);
    view.backgroundColor = UIColor.redColor;
    [self.view addSubview:view];
    self.aniView = view;
    
    [self tipAnimation:view fromPoint:view.center
               toPoint:CGPointMake(self.view.frame.size.width- view.frame.size.width, self.view.frame.size.height - view.frame.size.height)
                 angle: radians(30.0)];
}
#pragma mark 动画
- (void)tipAnimation:(UIView *)tipView fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint angle:(CGFloat)angle{
    //平移
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:fromPoint];
    CGPoint newtoPoint  = CGPointZero;
    if (self.aniView.center.x > self.view.frame.size.width - 120) {
        newtoPoint = CGPointMake(toPoint.x , toPoint.y) ;
    }else{
        newtoPoint = CGPointMake(fromPoint.x + toPoint.x , fromPoint.y + toPoint.y) ;
    }
    NSLog(@"移动中：%@",NSStringFromCGPoint(newtoPoint));
    [movePath addLineToPoint:newtoPoint];
    //移动的新中心点赋值
    self.aniView.center = newtoPoint;
    
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath.CGPath;
    moveAnim.duration = self.animationDuration;
    moveAnim.repeatCount = 1;
    moveAnim.removedOnCompletion = NO;
    moveAnim.fillMode = kCAFillModeForwards;
    moveAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    //旋转
//    CABasicAnimation *TransformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
//    TransformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//    //沿Z轴旋转
//    TransformAnim.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(angle,0,0,1)];
//    TransformAnim.cumulative = YES;
//    TransformAnim.duration = 10;
//    TransformAnim.repeatCount = FLT_MAX;
//    tipView.center = toPoint;
//    TransformAnim.removedOnCompletion = NO;
//    TransformAnim.fillMode = kCAFillModeForwards;
//    TransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    
    CABasicAnimation *TransformAnim = [CABasicAnimation animation];
   //必须加上transform才行，不然不起作用，z表示绕z轴旋转
    TransformAnim.keyPath = @"transform.rotation.z";
     //M_PI_2表示90度，在旋转时，使用度数都是使用类似的表达,M_PI代表180度的意思
    TransformAnim.byValue = @(M_PI_4);
    TransformAnim.beginTime = 0.f;
    TransformAnim.duration = 1.0f;
     //动画后保持最终的动画状态
    TransformAnim.removedOnCompletion = NO;
    TransformAnim.fillMode = kCAFillModeForwards;
    
    //动画组
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:moveAnim, TransformAnim, nil];
    animGroup.duration = self.animationDuration;
    animGroup.repeatCount = 1;
    animGroup.removedOnCompletion = NO;
    animGroup.delegate = self;
    animGroup.fillMode = kCAFillModeForwards;
    
    [tipView.layer addAnimation:animGroup forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"移动结束点：%@",NSStringFromCGPoint(self.aniView.center));
    if (self.aniView.center.x > self.view.frame.size.width - 120) {
        [self tipAnimation:self.aniView
                 fromPoint:self.aniView.center
                   toPoint:CGPointMake(100, 100)
                     angle:30];
    }else{
        [self tipAnimation:self.aniView
                 fromPoint:self.aniView.center
                   toPoint:CGPointMake(self.view.frame.size.width - 100, self.view.frame.size.height - 150)
                     angle:30];
    }
   
}

@end
