//
//  MomentCell.h
//  MyNote
//
//  Created by yangjing on 2019/2/22.
//  Copyright © 2019年 yangjing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MomentCell : UITableViewCell

-(void)setContentWithDictionary:(NSDictionary *)dictionary;
+(MomentCell *)prepareCellForTableView:(UITableView *)tableView;
+(CGFloat)cellHeightFromText:(NSString *)text;
+(CGFloat)contentHeight:(NSString *)text;

@end
