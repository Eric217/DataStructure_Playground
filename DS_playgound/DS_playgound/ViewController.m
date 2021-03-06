//
//  ViewController.m
//  DS_playgound
//
//  Created by Eric on 2018/7/12.
//  Copyright © 2018 SDU_iOS_LAB. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+SplitController.h"

#import "SortMainController.h"
#import "TravesingController.h"
#import "GraphMainController.h"
#import "SelectTravesalController.h"
//#import "TestSwift.swift"

//#import "TestSwift-swift"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
        
    //测试
    [self addButton:@"测试：排序算法" frame:CGRectMake(300, 300, 140, 60) act:@selector(didClick)];
    [self addButton:@"测试：遍历二叉树" frame:CGRectMake(540, 300, 140, 60) act:@selector(didClick1)];
    [self addButton:@"测试：图相关算法" frame:CGRectMake(300, 120, 140, 60) act:@selector(didClick2)];
    
}

- (UIButton *)addButton:(NSString *)title frame:(CGRect)f act:(SEL)selector {
    UIButton *butt = [[UIButton alloc] initWithFrame:f];
    [butt setTitle:title forState:UIControlStateNormal];
    [butt setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [butt addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butt];
    return butt;
}

- (void)didClick {
    [self presentViewController:[SortMainController new] animated:1 completion:nil];
}

- (void)didClick1 {
   
 
    SelectTravesalController *conf = [[SelectTravesalController alloc] initWithRoot:self.view.window.rootViewController];
    UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:conf];
    
    [self showSplitWithMaster:masterNav detail:TravesingController.class delegate:conf];

}

- (void)didClick2 { 
    [self presentViewController:[GraphMainController new] animated:1 completion:nil];
}

@end
