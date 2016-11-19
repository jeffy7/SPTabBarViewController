//
//  AViewController.m
//  OCTest
//
//  Created by je_ffy on 2016/11/8.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "AViewController.h"
#import "SDWebImageManager.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationItem.title = @"首页";
    //self.tabBarController.navigationItem.title = @"djdjsid";

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50)];
    [button addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"点击从服务端更新tabbar icon" forState:UIControlStateNormal];
    button.layer.borderWidth = 0.50f;
    button.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:button];
}

- (void)tapAction {
    [self.tabBarController.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx == 2) {
            [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:@"http://pic2.shangpin.com/e/s/16/06/14/20160614170443318123-0-0.jpg"] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                if (image) {
                    obj.selectedImage = image;
                    obj.image = image;
                }
            }];
        }
        
    }];

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
