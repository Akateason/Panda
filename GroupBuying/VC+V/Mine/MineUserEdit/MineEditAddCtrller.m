//
//  MineEditAddCtrller.m
//  GroupBuying
//
//  Created by TuTu on 16/9/27.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MineEditAddCtrller.h"
#import "MEDAVCtextfieldCell.h"
#import "MEDAVCtextviewCell.h"

@interface MineEditAddCtrller () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;

@end


@implementation MineEditAddCtrller

- (IBAction)finishBtOnClick:(id)sender
{
    switch (self.displayType)
    {
        case type_textField_words:
        case type_textField_number:
        case type_gender_choose:
        case type_birth_choose:
        {
            MEDAVCtextfieldCell *cell = [_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] ;
            self.blockValString(cell.textfield.text) ;
        }
            break;
        case type_textview:
        {
            MEDAVCtextviewCell *cell = [_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] ;
            self.blockValString(cell.textview.text) ;
        }
            break;
        default:
            break;
    }
    
}

#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate = self ;
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.displayType) {
        case type_textField_words:
        {
            MEDAVCtextfieldCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MEDAVCtextfieldCell] ;
            cell.textfield.keyboardType = UIKeyboardTypeDefault ;
            cell.textfield.text = self.strVal ;
            return cell ;
        }
            break;
        case type_textField_number:
        {
            MEDAVCtextfieldCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MEDAVCtextfieldCell] ;
            cell.textfield.keyboardType = UIKeyboardTypeNumberPad ;
            cell.textfield.text = self.strVal ;
            return cell ;
        }
            break;
        case type_textview:
        {
            MEDAVCtextviewCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MEDAVCtextviewCell] ;
            cell.textview.text = self.strVal ;
            return cell ;
        }
            break;
        case type_gender_choose:
        {
            
        }
            break ;
        case type_birth_choose:
        {
            
        }
            break ;
        default:
            break;
    }
    return nil ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.displayType) {
        case type_textField_words:
        case type_textField_number:
        case type_gender_choose:
        case type_birth_choose:
        {
            return 43. ;
        }
            break;
        case type_textview:
        {
            return 97. ;
        }
            break;
        default:
            break;
    }
    return 0 ;
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
