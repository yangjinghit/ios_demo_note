//
//  MomentsListViewController.m
//  MyNote
//
//  Created by yangjing on 2019/2/21.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import "MomentsListViewController.h"
#import "MomentCell.h"
#import "MomentDetailViewController.h"
#import "PostMomentViewController.h"
#import "KetangPersistentManager.h"
#import "KetangUtility.h"
#import "BlankView.h"
#import "RetryView.h"
#import "UIImage+Ketang.h"

@interface MomentsListViewController ()

@property (nonatomic, strong) NSArray *moment;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *blankView;
@property (nonatomic, strong) UIView *retryView;
@property (nonatomic, strong) UIImageView *cover;
@property (nonatomic) BOOL tableShowed;

@end

@implementation MomentsListViewController

-(void)showCover{
    
    self.cover = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [KetangUtility screenWidth], [KetangUtility screenHeight])];
    self.cover.image = [UIImage imageNamed:@""];
    self.cover.userInteractionEnabled = YES;
    self.cover.contentMode = UIViewContentModeScaleAspectFill;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.cover];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(([KetangUtility screenWidth] -200)/2, [KetangUtility screenHeight] - 84, 200, 44)];
    [button setTitle:@"进入" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.cornerRadius = 6;
    button.layer.masksToBounds = YES;
    
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:0.3] andSize:button.frame.size] forState:UIControlStateHighlighted];
    [self.cover addSubview:button];
    [button addTarget:self action:@selector(hideCover) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)hideCover{
    [self.cover removeFromSuperview];
    [self loadMoment];
}

- (void)viewWillAppear:(BOOL)animated{
    
    if (self.tableView != nil) {
        
        NSIndexPath *selectingRow = [self.tableView indexPathForSelectedRow];
        if (selectingRow != nil) {
            
            [self.tableView deselectRowAtIndexPath:selectingRow animated:YES];
        }
    }
}

- (void)handleView{
    [self hideLoading];
    
    if (self.moment == nil) {
        [self.tableView removeFromSuperview];
        [self.blankView removeFromSuperview];
        [self.retryView removeFromSuperview];
        
        [self.view addSubview:self.retryView];
        self.tableShowed = NO;
        return;
    }
    
    if ([self.moment count] == 0) {
        [self.tableView removeFromSuperview];
        [self.blankView removeFromSuperview];
        [self.retryView removeFromSuperview];
        
        [self.view addSubview:self.blankView];
        self.tableShowed = NO;
        return;
    }
    
    if (self.tableShowed) {
        [self.tableView beginUpdates];
        NSIndexPath *theRow = [NSIndexPath indexPathForRow:0 inSection:0];
        NSArray *insertRows = [NSArray arrayWithObject:theRow];
        [self.tableView insertRowsAtIndexPaths:insertRows withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
        return;
    }
    
    [self.tableView reloadData];
    [self.tableView removeFromSuperview];
    [self.blankView removeFromSuperview];
    [self.retryView removeFromSuperview];
    [self.view addSubview:self.tableView];
    self.tableShowed = YES;
}

- (void)loadMoment{
    [self showLoading];
    NSMutableArray *momentBeforeSorting = [KetangPersistentManager getMoment];
    self.moment = [momentBeforeSorting sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *a, NSDictionary *b) {
        NSNumber *aTimestamp = [a objectForKey:@"timestamp"];
        NSNumber *bTimestamp = [b objectForKey:@"timestamp"];
        if (aTimestamp > bTimestamp) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        if (bTimestamp > aTimestamp) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
        
    }];
    
    [self performSelector:@selector(handleView) withObject:nil afterDelay:1];
    
}

- (void)post{
    
    PostMomentViewController *postViewController = [[PostMomentViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:postViewController];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showCover];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.blankView = [BlankView blankViewWithText:@"空空如也" buttonText:@"写一条" target:self action:@selector(post)];
    
    
    self.retryView = [RetryView retryViewWithText:@"哦，，，，出错了" buttonText:@"重试" target:self action:@selector(loadMoment)];
    self.retryView.backgroundColor = [UIColor redColor];
    
    
//    UIBarButtonItem *postItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(post)];
//    self.navigationItem.rightBarButtonItem = postItem;
//
    
    [self setRightNavigationButtonWithTitle:@"写笔记" target:self action:@selector(post)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(loadMoment) name:@"newMomentSaved" object:nil];
    
    [self setSingleLineTitle:@"笔记"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.moment == nil) {
        return 0;
    }
    return [self.moment count];
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    MomentCell *cell = [MomentCell prepareCellForTableView:tableView];

//    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"7",@"day",
//                                                                        @"星期六",@"dayOfWeek",
//                                                                        @"2015年8月", @"yearAndMonth",
//                                                                        @"向狂响着致敬", @"content",nil];
//
    NSInteger row = indexPath.row;
    NSDictionary *dictionary = self.moment[row];
    
    NSNumber *timestamp = [dictionary objectForKey:@"timestamp"];
    
    NSMutableDictionary *dateDictionary = [KetangUtility dateThen:timestamp];
    NSString *year = [dateDictionary objectForKey:@"year"];
    NSString *month = [dateDictionary objectForKey:@"month"];
    NSString *yearAndMonth = [NSString stringWithFormat:@"%@年%@月", year, month];
    [dateDictionary setObject:yearAndMonth forKey:@"yearAndMonth"];
    [dateDictionary addEntriesFromDictionary:dictionary];
    
    [cell setContentWithDictionary:dateDictionary];
    return cell;
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSDictionary *dictionary = self.moment[row];
    NSString *content = [dictionary objectForKey:@"content"];
    
    return [MomentCell cellHeightFromText:content];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    NSDictionary *dictionary = self.moment[row];
    
    NSNumber *timestamp = [dictionary objectForKey:@"timestamp"];
    
    NSMutableDictionary *dateDictionary = [KetangUtility dateThen:timestamp];
    NSString *year = [dateDictionary objectForKey:@"year"];
    NSString *month = [dateDictionary objectForKey:@"month"];
    NSString *day = [dateDictionary objectForKey:@"day"];

    NSString *yearAndMonth = [NSString stringWithFormat:@"%@年%@月%@日", year, month, day];
    [dateDictionary setObject:yearAndMonth forKey:@"yearAndMonthAndDay"];
    [dateDictionary addEntriesFromDictionary:dictionary];
    
    MomentDetailViewController *detail = [[MomentDetailViewController alloc] initWithDictionary:dateDictionary];
    [self.navigationController pushViewController:detail animated:YES];
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
