//
//  CLanguageController.m
//  TestSwiftApplication
//
//  Created by Keep on 2021/11/2.
//

#import "CLanguageController.h"
#import "CIntroduceController.h"


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
    
    self.titleName = @[@"C语言简介"];

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
        default:
            break;
    }
}

@end
