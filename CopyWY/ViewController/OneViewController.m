//
//  OneViewController.m
//  CopyWY
//
//  Created by abnerzhang on 16/8/18.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "OneViewController.h"
#import "NavigationLabel.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define LabelWidth [UIScreen mainScreen].bounds.size.width / 5

#define TitlezHeight 40.0f

@interface OneViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *titleScrollView;
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) NSMutableArray *pageArray;
@property (nonatomic, strong) NSMutableArray *colorArray;
@end

@implementation OneViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.pageArray = [NSMutableArray arrayWithObjects:@"推荐", @"本地", @"国内", @"国际", @"体育", @"军事", @"政治", @"经济", @"文化", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 两种添加子视图控制器的方法
    [self setupChildViewController];
    //[self addChildViewControllers];
    [self addNavigationLabels];
    
    // Do any additional setup after loading the view.
}
/**
 *  添加子控制器
 */
- (void)setupChildViewController {
    for (int i = 0; i < self.pageArray.count; i ++) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = self.pageArray[i];
        //[self.view addSubview:vc.view];
        [self addChildViewController:vc];
        vc.view.backgroundColor = self.colorArray[i];
    }
}

/**
 *  添加子控制器
 */
- (void)addChildViewControllers {
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.title = @"C";
    [self addChildViewController:vc1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.title = @"JAVA";
    [self addChildViewController:vc2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.title = @"OC";
    [self addChildViewController:vc3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.title = @"Swift";
    [self addChildViewController:vc4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.title = @"JS";
    [self addChildViewController:vc5];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.title = @"JQuery";
    [self addChildViewController:vc6];
    
    UIViewController *vc7 = [[UIViewController alloc] init];
    vc7.title = @"HTML";
    [self addChildViewController:vc7];
    
    self.contentScrollView.contentSize = CGSizeMake(self.childViewControllers.count * kWidth, kHeight);
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.bounces = NO;
}

/**
 *  添加导航标签栏
 */
- (void)addNavigationLabels {
    CGFloat width = [UIScreen mainScreen].bounds.size.width/5;
    CGFloat height = self.titleScrollView.frame.size.height;
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        NavigationLabel *navigationLabel = [[NavigationLabel alloc] init];
        navigationLabel.tag = i + 99;
        navigationLabel.frame = CGRectMake(i * width, 0, width, height);
        navigationLabel.text = [self.childViewControllers[i] title];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [navigationLabel addGestureRecognizer:tap];
        navigationLabel.backgroundColor = self.colorArray[i];
        [self.titleScrollView addSubview:navigationLabel];
        if(i == 0) {    // 第一个Label标签
            navigationLabel.scale = 1.0;
        }
    }
    
    self.titleScrollView.contentSize = CGSizeMake(width * self.childViewControllers.count, height);
    self.titleScrollView.bounces = NO;
}


/**
 *  手势事件
 */
- (void)tap:(UITapGestureRecognizer *)tap {
    NSInteger index = tap.view.tag - 99;
    // 定位到指定位置
    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = index * kWidth;
    [self.contentScrollView setContentOffset:offset animated:YES];
}

/**
 *  懒加载titleScrollView控件
 *
 */
- (UIScrollView *)titleScrollView {
    if (!_titleScrollView) {
        _titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, TitlezHeight)];
        _titleScrollView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_titleScrollView];
    }
    return _titleScrollView;
}

/**
 *  懒加载colorArray数组
 *
 */
- (NSMutableArray *)colorArray {
    if (!_colorArray) {
        _colorArray = [NSMutableArray array];
        for (int i = 0; i < self.pageArray.count; i++) {
            int  red = arc4random() % 255;
            int  green = arc4random() % 255;
            int  blue = arc4random() % 255;
            UIColor *color = [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:1];
            [_colorArray addObject:color];
        }
    }
    return _colorArray;
}

/**
 *  懒加载contentScrollView控件
 *
 */
- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TitlezHeight, kWidth, kHeight - TitlezHeight)];
        _contentScrollView.contentSize = CGSizeMake(_contentScrollView.frame.size.width* self.pageArray.count, 0);
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.delegate = self;
        _contentScrollView.bounces = NO;
        _contentScrollView.backgroundColor = [UIColor whiteColor];
        // 这样写也可以, 但是没有标题栏
        //self.view = self.contentScrollView;
        [self.view insertSubview:_contentScrollView atIndex:0];
        [self scrollViewDidEndScrollingAnimation:_contentScrollView];
    }
    return _contentScrollView;
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (scrollView == self.contentScrollView) {
        // index: 当前显示的页面
        NSInteger index = scrollView.contentOffset.x/self.contentScrollView.frame.size.width;
        UIViewController *vc = self.childViewControllers[index];
        vc.view.frame = CGRectMake(scrollView.contentOffset.x, 0, self.contentScrollView.frame.size.width, self.contentScrollView.frame.size.height);
        [scrollView addSubview:vc.view];
        // 一些临时变量
        //CGFloat width = scrollView.frame.size.width;
        // 让对应的顶部标题居中显示
        NavigationLabel *label = self.titleScrollView.subviews[index];
        CGPoint titleOffsetX = self.titleScrollView.contentOffset;
        titleOffsetX.x = label.center.x - kWidth/2;
        // 左边偏移量边界
        if(titleOffsetX.x < 0) {
            titleOffsetX.x = 0;
        }
        CGFloat maxOffsetX = self.titleScrollView.contentSize.width - kWidth;
        // 右边偏移量边界
        if(titleOffsetX.x > maxOffsetX) {
            titleOffsetX.x = maxOffsetX;
        }
        // 修改偏移量
        self.titleScrollView.contentOffset = titleOffsetX;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.contentScrollView) {
        [self scrollViewDidEndScrollingAnimation:scrollView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scale = scrollView.contentOffset.x / scrollView.frame.size.width;
    // 获取需要操作的的左边的Label
    NSInteger leftIndex = scale;
    NavigationLabel *leftLabel = self.titleScrollView.subviews[leftIndex];
    // 获取需要操作的右边的Label
    NSInteger rightIndex = scale + 1;
    id rightLabel = (rightIndex == self.titleScrollView.subviews.count) ?  nil : self.titleScrollView.subviews[rightIndex];
    // 右边的比例
    CGFloat rightScale = scale - leftIndex;
    // 左边比例
    CGFloat leftScale = 1- rightScale;
    // 设置Label的比例
    leftLabel.scale = leftScale;
    if ([rightLabel isKindOfClass:[NavigationLabel class]]) {
        NavigationLabel *label = rightLabel;
        label.scale = rightScale;
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
