//
//  TwoViewController.m
//  CopyWY
//
//  Created by abnerzhang on 16/8/18.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "TwoViewController.h"
#import "UIImage+Gif.h"

#define kScreenWidth \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
#define kScreenHeight \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 100, 100, 100);
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, kScreenWidth, kScreenWidth)];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"602355" ofType:@"gif"];
    img.image = [UIImage animatedImageWithAnimatedGIFURL:[NSURL fileURLWithPath:filePath]];
    img.image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfFile:filePath]];
    img.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:img];
    

    
    
    // Do any additional setup after loading the view.
}

- (void)btnAction {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = @"可以加返回按钮";
    [self.navigationController pushViewController:vc animated:YES];
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
