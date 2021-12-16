//
//  DataTypeController.m
//  TestSwiftApplication
//
//  Created by Keep on 2021/12/10.
//

#import "DataTypeVC.h"

@interface DataTypeVC ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeName;
@property (weak, nonatomic) IBOutlet UILabel *derivedType;
@property (weak, nonatomic) IBOutlet UILabel *intTypeLabel;

@end

@implementation DataTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"数据类型-整型";
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.text = @"void 类型  基本类型（basic types）  枚举类型（enumerated types） 派生类型（derived types）";
    
    self.typeName.text = @"基本类型包含：字符类型（character types） 有符号整数类型（signed integer types）无符号整数类型（unsigned integer types） 浮点类型（floating types）";
    
    self.derivedType.text = @"派生类型包含：数组类型（array types） 结构体类型（structure types） 联合体类型（union types） 函数类型（function types） 指针类型（pointer types） 原子类型（atomic types）";
    
    
    // long l1;  和     signed long l2 是等价的
    // unsigned long Bool类型
    
    //整数类型的大小
    /*
     1 == sizeof(char)  占用一个字节
      关于基本数据类型大小的实现方案，统称为：数据模型。有4种常见的数据模型
     32位系统
     LP32(2/4/4): int为16位、long、指针为32位
     Win16 API 系统
     
     ILP32(4/4/4): int、long、指针均为32位
     Win32 API
     Unix、类Unix系统（Linux、Mac OS X）
     
     64位系统
     LLP64(4/4/8): int、long为32位、指针为64位
     Win64 API
     
     LP64(4/8/8): int为32位、long、指针为64位
     Unix、类Unix系统（Linux、Mac OS X）
     
     还有一种比较少见的数据模型
     ILP64(8/8/8): int、long、指针均为64位
     仅出现于某些早期64位Unix系统（例如 Unicos on Cray）
     
     */
    
    self.intTypeLabel.text = @"char类型的取值范围为：【-128,127】";
     
    char c1 = 0xBD;
    unsigned char c2 = 0xBD;
    printf("\n %d %d \n",c1,c2);// -67 189
    
    /*
     unsigned char的取值范围是【0，255】
     也就是【0，2^8-1】
     
     有n个二进制位的有符号数的取值范围是
     [-2^n-1,2^n-1 -1]
     
     有n个二进制位的无符号数的取值范围
     【0，2^n - 1】
     
     
     
     float:单精度浮点类型，占用32bit,可以保证精确到小数点后6位
     
     double:双精度浮点类型，占用64bit，可以保证精确到小数点后15位
     
     */
   
    //07-40 完
    
    /*
     整数、浮点数字面量
     
     */
    //十进制小时
    float f4 = 1.2e3F; // 1.2 * 10^3 = 1200.0

    //十六进制小数
    // 1.125 * 2^10
    float f5 = 0x1.2p10F; // 0x1.3p10F
    double d5 = 0x1.2p10; // 0x1.2p10
    
    /*
     类型转换
     强制类型转换
     
     
     */
    
    
    
}


@end
