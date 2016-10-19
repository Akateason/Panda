//
//  TagSearchingCtrller.m
//  GroupBuying
//
//  Created by teason on 16/8/31.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "TagSearchingCtrller.h"
#import "TagSearchingCell.h"
#import "AFNetworking.h"
#import "XTSearchHandler.h"
#import "ArticleTag.h"
#import "Pic.h"

@interface TagSearchingCtrller () <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIButton *btCancel;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic,strong) XTSearchHandler    *searchHandler ;
@property (nonatomic,strong) NSArray            *listTag ;

@end

@implementation TagSearchingCtrller

#pragma - prop
- (void)setTagInfomationType:(TypeOfTagInformationTextfield)tagInfomationType
{
    _tagInfomationType = tagInfomationType ;
    
    NSLog(@"tagInfomationType : %ld",tagInfomationType) ;
}


#pragma mark - action
- (IBAction)btCancelOnClick:(id)sender
{
    if (!_searchBar.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入标签哦"] ;
        return ;
    }
    
    _block(nil) ;
    [self dismissViewControllerAnimated:YES completion:nil] ;
}


#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.

    self.searchBar.text = self.strWillEdit ;
    [self configureUI] ;
    
    self.searchHandler = [[XTSearchHandler alloc] init] ;
    TagSearchingCtrller * __weak weakSelf = self ;
    
    self.searchHandler.searchComplete = ^(NSURLSessionDataTask *task, id responseObject){
        ResultParsered *result = [ResultParsered yy_modelWithJSON:responseObject] ;
        if (result.code == 1) {
            NSMutableArray *tmplist = [@[] mutableCopy] ;
            NSArray *listDict = result.data[@"articleTagList"] ;
            for (NSDictionary *dic in listDict)
            {
                ArticleTag *aTag = [ArticleTag yy_modelWithDictionary:dic] ;
                [tmplist addObject:aTag] ;
            }
            
            weakSelf.listTag = tmplist ;
            [weakSelf.table reloadData] ;
        }
    } ;
}

- (void)configureUI
{
    _topView.backgroundColor = [UIColor whiteColor] ;
    [_btCancel setTitleColor:[UIColor xt_w_dark] forState:0] ;
    
    [_searchBar becomeFirstResponder] ;
    _searchBar.delegate = self ;
    
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate = self ;
}


#pragma mark - UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.searchHandler searchWithText:searchBar.text] ;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.searchHandler searchWithText:searchText] ;
}




#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1 ;
    }
    else if (section == 1) {
        return self.listTag.count ;
    }
    
    return 0 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TagSearchingCell *cell = [tableView dequeueReusableCellWithIdentifier:idTagSearchingCell] ;
    if (!cell) {
        cell = [[TagSearchingCell alloc] initWithStyle:0 reuseIdentifier:idTagSearchingCell] ;
    }
    // 点击添加
    if (indexPath.section == 0)
    {
        cell.cellType = typeConfirmAddTag ;
        cell.strDisplay = self.searchBar.text ;
    }
    // 搜索显示
    else if (indexPath.section == 1)
    {
        cell.cellType = typeDefaultDisplay ;
        cell.strDisplay = ((ArticleTag *)self.listTag[indexPath.row]).name ;
    }
    
    return cell ;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44. ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TagSearchingCell *cell = [tableView cellForRowAtIndexPath:indexPath] ;
    NSLog(@"你将要添加的是 : %@",cell.strDisplay) ;
    
    if (cell.strDisplay.length) {
        self.block(cell.strDisplay) ;
        [self dismissViewControllerAnimated:YES completion:nil] ;
    }
    else {
        [SVProgressHUD showErrorWithStatus:@"请输入标签"] ;
    }
    
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
