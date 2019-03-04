//
//  BaseViewController.m
//  MyNote
//
//  Created by yangjing on 2019/2/21.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import "BaseViewController.h"
#import "KetangUtility.h"
#import "UIButton+Ketang.h"

@interface BaseViewController ()

@property(nonatomic, strong) UIActivityIndicatorView *loading;
@property(nonatomic, strong) UIView *modal;

@end

@implementation BaseViewController

-(void)navigationBack{
    
    if (self.navigationController != nil) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)setBackButton{
    
    UIButton *button = [UIButton navigationBackButtonWithTitle:@"返回" target:self action:@selector(navigationBack)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *offset = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    CGFloat buttonOffset;
    if ([KetangUtility screenWidth] >=414) {
        //iPhone 6+, iPhone 6s +
        buttonOffset = -12;
    } else{
        buttonOffset = -8;
    }
    offset.width = buttonOffset;
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:offset, barButton, nil];
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    
    return YES;
}

- (void)setSingleLineTitle:(NSString *)title {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = titleLabel;
    
}

-(void)showLoading{
    
    if (self.loading == nil) {
        self.loading = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(([KetangUtility screenWidth] -20)/2, ([KetangUtility screenHeight] -20)/2, 20, 20)];
        self.loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    }
    
    [self.loading startAnimating];
    [self.view addSubview:self.loading];
    
}
-(void)hideLoading{
    
    [self.loading stopAnimating];
    [self.loading removeFromSuperview];
    
}

- (void)showModalLoading{
    
    if (self.modal == nil) {
        self.modal = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [KetangUtility screenWidth], [KetangUtility screenHeight])];
        self.modal.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    }
    
    UIView *black = [[UIView alloc] initWithFrame:CGRectMake(([KetangUtility screenWidth] - 80)/2, ([KetangUtility screenHeight] - 80)/2, 80, 80)];
    black.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    black.layer.cornerRadius = 12;
    black.layer.masksToBounds = YES;
    [self.modal addSubview:black];
    
    UIActivityIndicatorView *modalLoading = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(([KetangUtility screenWidth] - 80)/2, ([KetangUtility screenHeight] - 80)/2, 80, 80)];
    modalLoading.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self.modal addSubview:modalLoading];
    [modalLoading startAnimating];
    
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    [window addSubview:self.modal];
    
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message buttonText:(NSString *)buttonText{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:buttonText style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)hideModalLoading{
    
    [self.modal removeFromSuperview];
    
}

- (void)setLeftNavigationButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton navigationBackButtonWithTitle:title target:target action:action];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *offset = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    CGFloat buttonOffset;
    if ([KetangUtility screenWidth] >=414) {
        //iPhone 6+, iPhone 6s +
        buttonOffset = -12;
    } else{
        buttonOffset = -8;
    }
    offset.width = buttonOffset;
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:offset, barButton, nil];
}

- (void)setRightNavigationButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton navigationBackButtonWithTitle:title target:target action:action];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *offset = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    CGFloat buttonOffset;
    if ([KetangUtility screenWidth] >=414) {
        //iPhone 6+, iPhone 6s +
        buttonOffset = -12;
    } else{
        buttonOffset = -8;
    }
    offset.width = buttonOffset;
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:offset, barButton, nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIColor *gray = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    self.view.backgroundColor = gray;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.72 blue:0.46 alpha:1];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
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
