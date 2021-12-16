//
//  CLanguageController.m
//  TestSwiftApplication
//
//  Created by Keep on 2021/11/2.
//

//#import "ClassTorch-Swift.h"
//#import "TestSwiftApplication-Swift.h"
#import "CLanguageController.h"
#import "CIntroduceController.h"
#import "ByteViewController.h"
#import "CharTypeController.h"
#import "DataTypeVC.h"
#import "OperatorController.h"

@interface CLanguageController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)   UITableView         * tableView;
@property (strong, nonatomic)   NSArray             * titleName;



@end

@implementation CLanguageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"C语言";
    self.view.backgroundColor = UIColor.whiteColor;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.titleName = @[@"C语言简介",@"字节",@"Char类型",@"数据类型",@"运算符"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.titleName.count;

}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.titleName[indexPath.row];
    return  cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            CIntroduceController *introduceVC = [[CIntroduceController alloc]init];
            [self.navigationController pushViewController:introduceVC animated:YES];
        }
            break;
        case 1:
        {
            ByteViewController *byteVC = [[ByteViewController alloc]init];
            [self.navigationController pushViewController:byteVC animated:YES];
        }
            break;
        case 2:
        {
            CharTypeController *charVC = [[CharTypeController alloc]init];
            [self.navigationController pushViewController:charVC animated:YES];
        }
            break;
        case 3:
        {
            DataTypeVC *charVC = [[DataTypeVC alloc]init];
            [self.navigationController pushViewController:charVC animated:YES];
        }
            break;
        case 4:
        {
            OperatorController *operatorVC = [[OperatorController alloc]init];
            [self.navigationController pushViewController:operatorVC animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
