//
//  SPTabBarViewController.m
//  SPTabBarViewController
//
//  Created by je_ffy on 2016/11/19.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "SPTabBarViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"
#import "EViewController.h"

#import "SPTabBar.h"
#import "SPTabBarView.h"
#import "SPTabBarItemView.h"

#define Use_System  0

@interface SPTabBarViewController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) SPTabBarView *tabBarView;

@end

@implementation SPTabBarViewController

- (id)init {
    if (self = [super init]) {
        [self addAllChildVcs];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTabBar];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!Use_System) {
        [self prepareTabBar];
    }
}
- (void)setUpTabBar {
    [self setValue:[[SPTabBar alloc] init] forKey:@"tabBar"];
}

- (void)addAllChildVcs {
    UIViewController *aVC = [[AViewController alloc] init];
 
    UINavigationController *navAVC = [[UINavigationController alloc] initWithRootViewController:aVC];
    
    UIViewController *bVC = [[BViewController alloc] init];

    UIViewController *cVC = [[CViewController alloc] init];

    UIViewController *dVC = [[DViewController alloc] init];

    UIViewController *eVC = [[EViewController alloc] init];

    self.viewControllers = [NSArray arrayWithObjects:navAVC,bVC,cVC,dVC,eVC, nil];
    self.delegate = self;
    if (Use_System) {
        [self setUpSystemItemBar];
    }
    
}

- (void)setUpSystemItemBar {
    NSArray *selectImages = @[@"nav_mall_press", @"nav_finding_press", @"nav_classification_press", @"nav_icon_shopping-cart_press", @"nav_mine_press"];
    NSArray *unSelectImages = @[@"nav_mall", @"nav_finding", @"nav_classification", @"nav_icon_shopping-cart", @"nav_mine"];

    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage *selectedImage = [UIImage imageNamed:[selectImages objectAtIndex:idx]];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *unselectedImage = [UIImage imageNamed:[unSelectImages objectAtIndex:idx]];

        obj.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        obj.titlePositionAdjustment = UIOffsetMake(0, -6);
        obj.title = nil;
        obj.image = unselectedImage;
        obj.selectedImage = selectedImage;
    }];
}


- (void)prepareTabBar {
    if (_tabBarView == nil) {
        _tabBarView = [[SPTabBarView alloc] init];
        _tabBarView.backgroundColor = [UIColor clearColor];
        _tabBarView.frame = CGRectMake(0, -20, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
        __weak typeof(self) weakself = self;
        _tabBarView.tapBarViewCallBack = ^(SPTabBarItemView *itemView,NSInteger index){
            [weakself tapItemView:itemView index:index];
        };
        
        SPTabBarItemView *item0 = [[SPTabBarItemView alloc] init];
        item0.normalImageView.image = [UIImage imageNamed:@"nav_mall"];
        item0.selectImageView.image = [UIImage imageNamed:@"nav_mall_press"];
        item0.canSelect = YES;
        
        SPTabBarItemView *item2 = [SPTabBarItemView new];
        item2.normalImageView.image = [UIImage imageNamed:@"nav_finding"];
        item2.selectImageView.image = [UIImage imageNamed:@"nav_finding_press"];
        item2.canSelect = YES;
        
        SPTabBarItemView *item1 = [SPTabBarItemView new];
        item1.normalImageView.image = [UIImage imageNamed:@"nav_classification"];
        item1.selectImageView.image = [UIImage imageNamed:@"nav_classification_press"];
        item1.canSelect = YES;
        
        SPTabBarItemView *item3 = [SPTabBarItemView new];
        item3.normalImageView.image = [UIImage imageNamed:@"nav_icon_shopping-cart"];
        item3.selectImageView.image = [UIImage imageNamed:@"nav_icon_shopping-cart_press"];
        item3.canSelect = YES;
        
        SPTabBarItemView *item4 = [SPTabBarItemView new];
        item4.normalImageView.image = [UIImage imageNamed:@"nav_mine"];
        item4.selectImageView.image = [UIImage imageNamed:@"nav_mine_press"];
        item4.canSelect = YES;
        
        NSArray *items = [NSArray arrayWithObjects:item0,item1,item2,item3,item4,nil];
        
        [_tabBarView setItems:items];
    }
    
    self.tabBar.clipsToBounds = NO;
    [self.tabBar addSubview:_tabBarView];
    
}

- (void)tapItemView:(SPTabBarItemView *)itemView index:(NSInteger)index {
    self.selectedViewController = [self.viewControllers objectAtIndex:index];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
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
