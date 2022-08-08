//
//  dSYMController.m
//  TestSwiftApplication
//
//  Created by Keep on 2022/7/14.
//

#import "dSYMController.h"

@interface dSYMController ()

@end

@implementation dSYMController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"dSYM日志分析";
    /*
     dSYM文件：指具有调试信息的目标文件
     
     dSYM中存储着文件名、方法名、行号等信息，是和可执行文件的16进制函数地址一一对应的，通过分析崩溃的崩溃文件可以准确知道具体的崩溃信息
     DWARF(Debuging With Arbitrary Format)是ELF 和 Mach-O等文件格式中用来存储和处理调试信息的标准格式。
     
     DWARF中的数据是高度压缩的，可以通过dwarfdump、otool等命令提取其中的可读信息。比如提取关键的调试信息 debug_info、debug_line
     dwarfdump --debug-line /Users/xxxx/Desktop/resource/TestBacktrace.app.dSYM > debug_line.txt

     */

    
    


}


@end
