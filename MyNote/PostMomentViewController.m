//
//  PostMomentViewController.m
//  MyNote
//
//  Created by yangjing on 2019/2/25.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import "PostMomentViewController.h"
#import "KetangUtility.h"
#import "KetangPersistentManager.h"

@interface PostMomentViewController ()

@property (strong, nonatomic) UITextView *inputView;

@end

@implementation PostMomentViewController

- (void)saveMoment{
    
    if (self.inputView.text.length == 0) {
        return;
    }
    
    if (self.inputView.text.length > 2000) {
        
        [self showAlertWithTitle:@"文字内容超过2000无法存储" message:nil buttonText:@"知道了"];
        return;
    }
    
    [self showModalLoading];
    NSString *content = self.inputView.text;
    NSNumber *timestamp = [KetangUtility timestamp];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:content, @"content",
                                                                        timestamp, @"timestamp",nil];
    BOOL saveSuccess = [KetangPersistentManager saveDictionary:dictionary];
    [self hideModalLoading];
    if (saveSuccess) {
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        NSNotification *notification = [NSNotification notificationWithName:@"newMomentSaved" object:nil];
        [center postNotification:notification];
        [self dismissViewControllerAnimated:YES completion:nil];

    }
    
}

- (void)cancel{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setSingleLineTitle:@"新建"];
    
//    UIBarButtonItem *finish = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveMoment)];
    
//    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self       action:@selector(cancel)];
//
//    self.navigationItem.rightBarButtonItem = finish;
//    self.navigationItem.leftBarButtonItem = cancel;
    
    [self setLeftNavigationButtonWithTitle:@"取消" target:self action:@selector(cancel)];
    [self setRightNavigationButtonWithTitle:@"确定" target:self action:@selector(saveMoment)];
    
    self.inputView = [[UITextView alloc] initWithFrame:CGRectMake(0, 84, [UIScreen mainScreen].bounds.size.width, 300)];
    [self.view addSubview:self.inputView];
    [self.inputView becomeFirstResponder];
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
