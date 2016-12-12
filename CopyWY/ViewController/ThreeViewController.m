//
//  ThreeViewController.m
//  CopyWY
//
//  Created by abnerzhang on 16/8/18.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "ThreeViewController.h"
#import "ThreeTableViewCell.h"
#import "OtherTableViewCell.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

static NSString *const CellIdentifier = @"threeCell";
static NSString *const OtherIdentifier = @"OtherCell";

@interface ThreeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tableArray;
@property (nonatomic, strong) NSMutableArray *selectCells;
@property (nonatomic, assign) BOOL isSelectBtn;
@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.isSelectBtn = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(btnAction)];
    // Do any additional setup after loading the view.
}

- (void)btnAction {
    self.isSelectBtn = !self.isSelectBtn;
    if (self.isSelectBtn) {
        self.navigationItem.rightBarButtonItem.title = @"完成";
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor redColor];
    } else {
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    }
    [self.tableView reloadData];
}
- (NSMutableArray *)tableArray {
    if (!_tableArray) {
        _tableArray = [NSMutableArray arrayWithObjects:@"全部", @"商品1", @"商品2", @"商品3", @"商品4", nil];
    }
    return _tableArray;
}

- (NSMutableArray *)selectCells {
    if (!_selectCells) {
        _selectCells = [NSMutableArray array];
    }
    return _selectCells;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[ThreeTableViewCell class] forCellReuseIdentifier:CellIdentifier];
        [_tableView registerClass:[OtherTableViewCell class] forCellReuseIdentifier:OtherIdentifier];

    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.isSelectBtn) {
        OtherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OtherIdentifier];
        [cell.textLabel setText:self.tableArray[indexPath.row]];
        return cell;
    } else {
        ThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        [cell.textLabel setText:self.tableArray[indexPath.row]];
        return cell;
        
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ThreeTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[OtherTableViewCell class]]) {
        return;
    }
    
    cell.isSelected = !cell.isSelected;
    
    // 判断是否点击全部
    if (indexPath.row == 0) { // 全部
        if (cell.isSelected == YES) {
            // 选中其他所有cell
            [self selectAllCell];
        } else {
            // 取消所有cell选中
            [self unSelectAllCell];
        }
        return;
    }
    
    // 没有点击全部cell
    
    // 记录选中的cell,肯定不是全部
    if (cell.isSelected) {
        [self.selectCells addObject:cell];
    } else {
        [self.selectCells removeObject:cell];
    }
    
    // 判断选择所有cell
    if (self.selectCells.count == self.tableArray.count - 1) {
        // 选中全部cell（全部）
        [self selectTotalCell];
    } else {
        // 取消选中全部cell（全部）
        [self unSelectTotalCell];
    }
}

// 选中全部cell
- (void)selectTotalCell
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    ThreeTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.isSelected = YES;
}

// 取消全部cell
- (void)unSelectTotalCell
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    ThreeTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.isSelected = NO;
}

// 取消选中所有cell
- (void)unSelectAllCell
{
    // 取消之前所有选中cell
    [self.selectCells removeAllObjects];
    
    NSInteger count = self.tableArray.count;
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        ThreeTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.isSelected = NO;
    }
}

// 选中所有cell
- (void)selectAllCell
{
    // 取消之前所有选中cell
    [self.selectCells removeAllObjects];
    
    NSInteger count = self.tableArray.count;
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        ThreeTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.isSelected = YES;
        
        if (i > 0) {
            [self.selectCells addObject:cell];
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
