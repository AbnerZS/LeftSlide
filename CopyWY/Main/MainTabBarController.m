//
//  MainTabBarController.m
//  CopyWY
//
//  Created by abnerzhang on 16/8/18.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 最多5个
    OneViewController *vc1 = [[OneViewController alloc] init];
    [self addChildViewController:vc1 withImage:[UIImage imageNamed:@"1"] selectedImage:[UIImage imageNamed:@"2"] withTittle:@"One"];
    
    TwoViewController *vc2 = [[TwoViewController alloc] init];
    [self addChildViewController:vc2 withImage:[UIImage imageNamed:@"1"] selectedImage:[UIImage imageNamed:@"2"] withTittle:@"Two"];
    
    ThreeViewController *vc3 = [[ThreeViewController alloc] init];
    [self addChildViewController:vc3 withImage:[UIImage imageNamed:@"1"] selectedImage:[UIImage imageNamed:@"2"] withTittle:@"购物车"];
    
    FourViewController *vc4 = [[FourViewController alloc] init];
    [self addChildViewController:vc4 withImage:[UIImage imageNamed:@"1"] selectedImage:[UIImage imageNamed:@"2"] withTittle:@"Four"];
    
}


- (void)addChildViewController:(UIViewController *)controller withImage:(UIImage *)image selectedImage:(UIImage *)selectImage withTittle:(NSString *)tittle{
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:controller];
    [nav.tabBarItem setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [nav.tabBarItem setSelectedImage:[selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //    nav.tabBarItem.title = tittle;
    //    controller.navigationItem.title = tittle;
    controller.title = tittle;//这句代码相当于上面两句代码
    [self.tabBar setTintColor:[UIColor redColor]];
    //[nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    nav.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    [self addChildViewController:nav];
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
