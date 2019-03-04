//
//  MomentDetailViewController.m
//  MyNote
//
//  Created by yangjing on 2019/2/21.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import "MomentDetailViewController.h"
#import "KetangUtility.h"

@interface MomentDetailViewController ()

@property (nonatomic, strong) NSDictionary *dictionary;

@end

@implementation MomentDetailViewController

- (MomentDetailViewController *)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    self.dictionary = dictionary;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackButton];
    // Do any additional setup after loading the view.
    
    [self setSingleLineTitle:[self.dictionary objectForKey:@"yearAndMonthAndDay"]];
    NSString *content = [self.dictionary objectForKey:@"content"];
    
    CGSize contentSize = CGSizeMake([KetangUtility screenWidth] - 40, 999999);
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil];
    CGRect contentRect = [content boundingRectWithSize:contentSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    
    UILabel *contentText = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width - 40, contentRect.size.height)];
    contentText.text = content;
    contentText.textColor = [UIColor blackColor];
    contentText.font = [UIFont systemFontOfSize:15];
    contentText.numberOfLines = 0;
    contentText.textAlignment = NSTextAlignmentLeft;
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, [KetangUtility screenWidth], [KetangUtility screenHeight] - 64)];
    scroll.contentSize = CGSizeMake(contentRect.size.width, contentRect.size.height + 40);
    [scroll addSubview:contentText];
    
    [self.view addSubview:scroll];
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
