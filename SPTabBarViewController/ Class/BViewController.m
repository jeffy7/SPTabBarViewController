//
//  BViewController.m
//  OCTest
//
//  Created by je_ffy on 2016/11/8.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.tabBarController.navigationItem.title = @"AAAAAAA";
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    [button addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    button.layer.borderWidth = 0.50f;
    button.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:button];
}

- (void)tapAction {
//    UIViewController *rootVC = [self.navigationController.viewControllers objectAtIndex:0];
//    [rootVC.tabBarController setSelectedIndex:2 ];
//    double delayInSeconds = 0.5;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^{
//        
//        [self.navigationController popToRootViewControllerAnimated:NO];
//
//    });
    
    [CCLogSystem activeDeveloperUI];
    
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
