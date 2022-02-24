//
//  ByteViewController.m
//  TestSwiftApplication
//
//  Created by Keep on 2021/11/5.
//

#import "ByteViewController.h"

@interface ByteViewController ()

@end

@implementation ByteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"字节->内存";
    /*
     字节 （Byte,B）一种基本存储单位（在计算机领域用来计量存储容量）
     
     1字 = 2B(字的应为 word,1字 等于2 字节)
     
     1KB = 1024B （千字节）
     1MB = 1024KB
     1GB = 1024MB
     
     1TB = 1024GB
        
     */
    
    int a = 10;
    printf("a:%d",a);
    
    
    /**
     C语言标准规定：一个 int 类型的变量至少占用2个字节的内存空间
     64位操作系统中，占用4个字节
            
     sizeof 可以检测某一数据类型占用的大小
            
     */
    printf("占用字节大小：%lu",sizeof(a));
    printf("%p",&a); //%p 可以打印内存地址
    
    
    /*
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
}


@end
