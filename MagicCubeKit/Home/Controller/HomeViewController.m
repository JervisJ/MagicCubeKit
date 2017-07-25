//
//  HomeViewController.m
//  MagicCubeKit
//
//  Created by LuisX on 2017/4/28.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation HomeViewController{
    NSArray *_menuArray;
    UITableView *_mainTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.mainTitle = @"MagicCubeKit";
    [self initailData];
    [self createMainViews];
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

- (void)initailData{
    _menuArray = @[@{@"UIViewController" : @"ViewController调用机制"},
                   @{@"Tangram" : @"七巧板界面动态化"},
                   @{@"SJBugVideoKit" : @"录屏、截屏"},
                   @{@"MagicAlertView" : @"弹框"},
                   @{@"MagicPermissionManager" : @"权限"},
                   @{@"MagicNetworkManager" : @"网络请求"},
                   @{@"MagicIconButton" : @"icon按钮"},
                   @{@"MagicScrollPage" : @"滚动分页"},
                   @{@"MagicImageDownloader" : @"图片下载"},
                   @{@"MagicWebProgress" : @"网页进度条"},
                   @{@"MagicLoading" : @"加载动画"},
                   @{@"MagicTimerButton" : @"倒计时按钮"},
                   @{@"WebViewJavascriptBridge" : @"JS交互"},
                   @{@"Reachability" : @"网络状态"},
                   @{@"iCarousel" : @"3D卡片"},
                   @{@"WYPopoverController" : @"气泡"},
                   @{@"UITableView+FDTemplateLayoutCell" : @"列表高度自适应"}];
}

- (void)createMainViews{
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _mainTableView.backgroundColor = [UIColor whiteColor];
    _mainTableView.dataSource = self;
    _mainTableView.delegate = self;
    [self.view addSubview:_mainTableView];
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.bottom.right.equalTo(self.view);
        
    }];
    
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSDictionary *menuDic = [_menuArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [menuDic.allKeys firstObject];
    cell.detailTextLabel.text = [menuDic.allValues firstObject];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _menuArray.count;
}

#pragma mark - 分割线顶头
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    cell.preservesSuperviewLayoutMargins = NO;
}

- (void)viewDidLayoutSubviews {
    [_mainTableView setSeparatorInset:UIEdgeInsetsZero];
    [_mainTableView setLayoutMargins:UIEdgeInsetsZero];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        NSString *routerSkipString = [NSString string];
        
        switch (indexPath.row) {
            case 0:
                routerSkipString = Router_Skip_ViewController;
                break;
            case 1:
                routerSkipString = Router_Skip_ExampleTangramViewController;
                break;
            case 2:
                routerSkipString = Router_Skip_ExampleSJBugVideoKitViewController;
                break;
            case 3:
                routerSkipString = Router_Skip_ExampleMagicAlertViewViewController;
                break;
            case 4:
                routerSkipString = Router_Skip_ExampleMagicPermissionManagerViewController;
                break;
            case 5:
                routerSkipString = Router_Skip_ExampleMagicNetworkingViewController;
                break;
            case 6:
                routerSkipString = Router_Skip_ExampleMagicButtonViewController;
                break;
            case 7:
                routerSkipString = Router_Skip_ExampleMagicScrollPageViewController;
                break;
            case 8:
                routerSkipString = Router_Skip_ExampleMagicImageDownloaderViewController;
                break;
            case 9:
                routerSkipString = Router_Skip_ExampleMagicWebProgressViewController;
                break;
            case 10:
                routerSkipString = Router_Skip_ExampleMagicLoadingViewController;
                break;
            case 11:
                routerSkipString = Router_Skip_ExampleMagicTimerButtonViewController;
                break;
            case 12:
                routerSkipString = Router_Skip_ExampleWebViewJavascriptBridgeViewController;
                break;
            case 13:
                routerSkipString = Router_Skip_ExampleReachabilityViewController;
                break;
            case 14:
                routerSkipString = Router_Skip_ExampleiCarouselViewController;
                break;
            case 15:
                routerSkipString = Router_Skip_ExampleWYPopoverControllerViewController;
                break;
            case 16:
                routerSkipString = Router_Skip_ExampleMagicDynamicViewController;
                break;
            default:
                break;
        }
        [MagicRouterManager showAnyViewControllerWithRouterURL:routerSkipString AddedNavigationController:self.navigationController];
    }
    
}
@end
