//
//  PagerViewController.m
//  MagicCubeKit
//
//  Created by LuisX on 2017/8/25.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "PagerViewController.h"

@interface PagerViewController ()

@end

@implementation PagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor randomFlatColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(show)];
    [self.view addGestureRecognizer:tap];
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

- (void)show{
     UIViewController *vc = [UIViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end