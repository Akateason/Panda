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
#import "XTTickConvert.h"

@interface MineEditAddCtrller () <UITableViewDelegate,UITableViewDataSource>
{
    int         selectedGender ;
    long long   ticker_birthday ;
}
@property (weak, nonatomic) IBOutlet UITableView    *table;
@property (weak, nonatomic) IBOutlet UIDatePicker   *datePicker;

@end


@implementation MineEditAddCtrller

#pragma mark - prop
- (void)setStrTitle:(NSString *)strTitle
{
    _strTitle = strTitle ;
    
    self.title = strTitle ;
}


#pragma mark - action
- (IBAction)finishBtOnClick:(id)sender
{
    switch (self.displayType)
    {
        case type_textField_words:
        case type_textField_number:
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
        case type_gender_choose:
        {
            self.blockValString(selectedGender == 1 ? @"女" : @"男") ;
        }
            break ;
        case type_birth_choose:
        {
            NSString *strDate = [XTTickConvert getDateWithTick:ticker_birthday
                                                AndWithFormart:TIME_STR_FORMAT_1] ;
            self.blockValString(strDate) ;
        }
            break ;
        default:
            break;
    }
    
    [self.navigationController popViewControllerAnimated:YES] ;
}


- (IBAction)pickDateValChange:(UIDatePicker *)datePicker
{
    NSDate *date = [datePicker date] ;
    NSLog(@"date : %@",date) ;
    ticker_birthday = [XTTickConvert getTickWithDate:date] ;
    NSString *strDate = [XTTickConvert getDateWithTick:ticker_birthday
                                        AndWithFormart:TIME_STR_FORMAT_1] ;
    self.strVal = strDate ;
    [_table reloadData] ;
}



#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _table.contentInset = UIEdgeInsetsMake(15., 0, 0, 0) ;
    _table.separatorStyle = 0 ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    
    
    if (self.displayType == type_birth_choose) {
        _datePicker.hidden = false ;
        _datePicker.maximumDate = [NSDate date] ;
        if (self.strVal.length > 0)
        {
            NSDate *dateBirthSend = [XTTickConvert getNSDateWithDateStr:self.strVal
                                                          AndWithFormat:TIME_STR_FORMAT_1] ;
            _datePicker.date = dateBirthSend ;
        }        
    }
    else if (self.displayType == type_gender_choose) {
        selectedGender = 0 ;
        if (self.strVal.length > 0)
        {
            if ([self.strVal isEqualToString:@"女"]) {
                selectedGender = 1 ;
            }
        }
    }
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.displayType == type_gender_choose) {
        return 2 ;
    }
    return 1 ;
}

static NSString *const kGenderCell = @"kGenderCell" ;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.displayType) {
        case type_textField_words:
        {
            MEDAVCtextfieldCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MEDAVCtextfieldCell] ;
            cell.textfield.keyboardType = UIKeyboardTypeDefault ;
            cell.textfield.placeholder = [@"请输入" stringByAppendingString:_strTitle] ;
            cell.textfield.text = self.strVal ;
            return cell ;
        }
            break;
        case type_textField_number:
        {
            MEDAVCtextfieldCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MEDAVCtextfieldCell] ;
            cell.textfield.keyboardType = UIKeyboardTypeNumberPad ;
            cell.textfield.placeholder = [@"请输入" stringByAppendingString:_strTitle] ;
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
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kGenderCell] ;
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGenderCell] ;
                cell.textLabel.font = [UIFont systemFontOfSize:14.] ;
                cell.tintColor = [UIColor xt_tabbarRedColor] ;
                cell.selectionStyle = 0 ;
            }
            cell.textLabel.text = indexPath.row == 0 ? @"男" : @"女" ;
            cell.accessoryType = (selectedGender == indexPath.row) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone ;
            return cell ;
        }
            break ;
        case type_birth_choose:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kGenderCell] ;
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGenderCell] ;
                cell.textLabel.font = [UIFont systemFontOfSize:14.] ;
                cell.selectionStyle = 0 ;
            }
            cell.textLabel.text = self.strVal ;
            return cell ;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.displayType == type_gender_choose)
    {
        selectedGender = (int)indexPath.row ;
        [_table reloadData] ;
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
