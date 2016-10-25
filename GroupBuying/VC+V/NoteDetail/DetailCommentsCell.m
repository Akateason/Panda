//
//  DetailCommentsCell.m
//  GroupBuying
//
//  Created by teason on 16/9/18.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "DetailCommentsCell.h"
#import "CommentCell.h"
#import "Comment.h"

@interface DetailCommentsCell () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *seperateline;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIButton *btMore;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIView *baseline;

@end

@implementation DetailCommentsCell

+ (CGFloat)calculateHeight:(NSArray *)comments
{
    if (!comments || !comments.count) {
        return 100 +  32 + 15 ;
    }
    
    float allHeight = 32 + 15 ;
    for (Comment *acomment in comments) {
        allHeight += [CommentCell calculateHeight:acomment] ;
    }
    
    return allHeight ;
}


- (IBAction)btMoreOnClick:(id)sender
{
    NSLog(@"更多") ;
}

- (void)setComments:(NSArray *)comments
{
    _comments = comments ;
    
    if (!comments) {
        return ;
    }
    
    _labelTitle.text = [NSString stringWithFormat:@"评论 %lu",(unsigned long)comments.count] ;
    
    if (!comments.count)
    {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, 100)] ;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, 20)] ;
        label.text = @"暂无评论" ;
        label.textAlignment = NSTextAlignmentCenter ;
        label.textColor = [UIColor xt_w_dark] ;
        label.font = [UIFont systemFontOfSize:14] ;
        label.center = bgView.center ;
        [bgView addSubview:label] ;
        
        _table.backgroundView = bgView ;
        return ;
    }
    
    
    [_table reloadData] ;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _seperateline.backgroundColor = [UIColor xt_seperate] ;
    _labelTitle.textColor = [UIColor xt_w_dark] ;
    [_btMore setTitleColor:[UIColor xt_w_light] forState:0] ;
    _baseline.backgroundColor = [UIColor xt_seperate] ;
    
    _table.scrollEnabled = false ;
    _table.dataSource = self ;
    _table.delegate = self ;
    [_table registerNib:[UINib nibWithNibName:kID_CommentCell bundle:nil] forCellReuseIdentifier:kID_CommentCell] ;
    _table.separatorStyle = 0 ;
    
}




#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.comments.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_CommentCell] ;
    cell.aComment = self.comments[indexPath.row] ;
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CommentCell calculateHeight:(Comment *)self.comments[indexPath.row]] ;
}











- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
