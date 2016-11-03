//
//  MineUserEditCtrl.m
//  GroupBuying
//
//  Created by TuTu on 16/9/26.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "MineUserEditCtrl.h"
#import "MineEditHeadCell.h"
#import "MineEditCell.h"
#import "MineEditAddCtrller.h"
#import "UserOnDevice.h"
#import "User.h"
#import "XTTickConvert.h"
#import "UIImage+AddFunction.h"
#import "Resource.h"
#import "YYModel.h"
#import "Pic.h"
#import "SVProgressHUD.h"

@interface MineUserEditCtrl () <UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    MineEditAddCtrller *editAddVC ;
    UIImage            *imgHeadOrigin ;
    NSArray            *list_keypathWillBeObservered ;
}

@property (nonatomic,strong)         User        *userCurrent ;
@property (weak, nonatomic) IBOutlet UITableView *table ;

@end

@implementation MineUserEditCtrl

#pragma mark - prop
- (User *)userCurrent
{
    if (!_userCurrent) {
        _userCurrent = [UserOnDevice currentUserOnDevice] ;
    }
    return _userCurrent ;
}



#pragma mark - life

- (void)dealloc
{
    for (NSString *keypath in list_keypathWillBeObservered)
    {
        [self removeObserver:self
                  forKeyPath:keypath
                     context:nil] ;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"个人资料" ;
    list_keypathWillBeObservered = @[@"userCurrent.headPic",@"userCurrent.nickName",@"userCurrent.gender",@"userCurrent.birthday",@"userCurrent.intruduce",@"userCurrent.mobile",@"userCurrent.name",@"userCurrent.signature"] ;
    [self configureUI] ;
    [self addUserCurrentObserver] ;
}

- (void)addUserCurrentObserver
{
    for (NSString *keypath in list_keypathWillBeObservered) {
        [self addObserver:self
               forKeyPath:keypath
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:nil] ;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
    if ([list_keypathWillBeObservered containsObject:keyPath]) {
        [self uploadCurrentUser] ;
    }
    else {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context] ;
    }
}



- (void)configureUI
{
    _table.contentInset = UIEdgeInsetsMake(15., 0, 0, 0) ;
    _table.dataSource = self ;
    _table.delegate = self ;
    _table.separatorColor = [UIColor xt_seperate] ;
    _table.backgroundColor = [UIColor xt_seperate] ;
    [_table registerNib:[UINib nibWithNibName:kID_MineEditHeadCell bundle:nil] forCellReuseIdentifier:kID_MineEditHeadCell] ;
    [_table registerNib:[UINib nibWithNibName:kID_MineEditCell bundle:nil] forCellReuseIdentifier:kID_MineEditCell] ;
}




#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1 ;
    }
    else if (section == 1) {
        return 5 ;
    }
    else if (section == 2) {
        return 2 ;  // 5 ;
    }
    
    return 0 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    NSInteger row = indexPath.row ;
    if (section == 0)
    {
        // 头像
        MineEditHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:kID_MineEditHeadCell] ;
        cell.headPic = self.userCurrent.headPic ;
        return cell ;
    }
    else if (section == 1) {
        if (row == 0) {
            return [self getEditCellWithKey:@"昵称" val:self.userCurrent.nickName] ;
        }
        else if (row == 1) {
            return [self getEditCellWithKey:@"性别" val:self.userCurrent.gender] ;
        }
        else if (row == 2) {
            NSString *strDate = (self.userCurrent.birthday > 0) ?
            [XTTickConvert getDateWithTick:self.userCurrent.birthday
                            AndWithFormart:TIME_STR_FORMAT_1]
            :
            @"" ;
            return [self getEditCellWithKey:@"生日" val:strDate] ;
        }
        else if (row == 3) {
            return [self getEditCellWithKey:@"简介" val:self.userCurrent.intruduce] ;
        }
        else if (row == 4) {
            return [self getEditCellWithKey:@"个性签名" val:self.userCurrent.signature] ;
        }
    }
    else if (section == 2) {
        if (row == 0) {
            return [self getEditCellWithKey:@"手机号码" val:self.userCurrent.mobile] ;
        }
        else if (row == 1) {
            return [self getEditCellWithKey:@"真实姓名" val:self.userCurrent.name] ;
        }
//        else if (row == 2) {
//            return [self getEditCellWithKey:@"身份证" val:nil] ;
//        }
//        else if (row == 3) {
//            return [self getEditCellWithKey:@"支付宝" val:nil] ;
//        }
//        else if (row == 4) {
//            return [self getEditCellWithKey:@"银行卡" val:nil] ;
//        }
    }
    
    return nil ;
}


- (MineEditCell *)getEditCellWithKey:(NSString *)key
                                 val:(NSString *)val
{
    MineEditCell *cell = [_table dequeueReusableCellWithIdentifier:kID_MineEditCell] ;
    cell.strTitle = key ;
    cell.strValue = val ;
    return cell ;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    return 54. ;
}

static NSString *const kIdentifierFooter = @"mycell_footer" ;

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kIdentifierFooter] ;
    if (!footer) {
        footer = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:kIdentifierFooter] ;
        UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, 15.)] ;
        bView.backgroundColor = [UIColor xt_seperate] ;
        footer.backgroundView = bView ;
    }
    return footer ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15. ;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section ;
    NSInteger row = indexPath.row ;
    
    if (section == 0)
    {
        // 头像
        SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:nil andMessage:nil] ;
        [alertView addButtonWithTitle:@"取消" type:SIAlertViewButtonTypeDestructive handler:nil] ;
        [alertView addButtonWithTitle:@"拍照" type:SIAlertViewButtonTypeDefault handler:^(SIAlertView *alertView){
            [self startCameraControllerFromViewController:self
                                            usingDelegate:self];
        }] ;
        [alertView addButtonWithTitle:@"本地相册" type:SIAlertViewButtonTypeDefault handler:^(SIAlertView *alertView){
            [self startAlbum] ;
        }] ;
        alertView.positionStyle = SIALertViewPositionBottom ;
        [alertView show] ;
    }
    else
    {
        editAddVC = [self getEditAddVC] ;
        MineUserEditCtrl __weak *weakSelf = self ;
        
        if (section == 1) {
            if (row == 0) {
                //@"昵称"
                editAddVC.strTitle = @"昵称" ;
                editAddVC.strVal = self.userCurrent.nickName ;
                editAddVC.displayType = type_textField_words ;
                editAddVC.blockValString = ^(NSString *str){
                    weakSelf.userCurrent.nickName = str ;
                    [weakSelf.table reloadData] ;
                } ;
            }
            else if (row == 1) {
                //@"性别"
                editAddVC.strTitle = @"性别" ;
                editAddVC.strVal = self.userCurrent.gender ;
                editAddVC.displayType = type_gender_choose ;
                editAddVC.blockValString = ^(NSString *str){
                    weakSelf.userCurrent.gender = str ;
                    [weakSelf.table reloadData] ;
                } ;
            }
            else if (row == 2) {
                //@"生日"
                editAddVC.strTitle = @"生日" ;
                NSString *strDate = [XTTickConvert getDateWithTick:self.userCurrent.birthday
                                                    AndWithFormart:TIME_STR_FORMAT_1] ;
                if (self.userCurrent.birthday == 0) {
                    strDate = [XTTickConvert getStrWithNSDate:[NSDate date] AndWithFormat:TIME_STR_FORMAT_1] ;
                }
                editAddVC.strVal = strDate ;
                editAddVC.displayType = type_birth_choose ;
                editAddVC.blockValString = ^(NSString *str){
                    NSDate *dateBirth = [XTTickConvert getNSDateWithDateStr:str
                                                              AndWithFormat:TIME_STR_FORMAT_1] ;
                    long long tick = [XTTickConvert getTickWithDate:dateBirth] ;
                    weakSelf.userCurrent.birthday = tick ;
                    [weakSelf.table reloadData] ;
                } ;

            }
            else if (row == 3) {
                //@"简介"
                editAddVC.strTitle = @"简介" ;
                editAddVC.strVal = self.userCurrent.intruduce ;
                editAddVC.displayType = type_textview ;
                editAddVC.blockValString = ^(NSString *str){
                    weakSelf.userCurrent.intruduce = str ;
                    [weakSelf.table reloadData] ;
                } ;
            }
            else if (row == 4) {
                // 个性签名
                editAddVC.strTitle = @"个性签名" ;
                editAddVC.strVal = self.userCurrent.signature ;
                editAddVC.displayType = type_textview ;
                editAddVC.blockValString = ^(NSString *str){
                    weakSelf.userCurrent.signature = str ;
                    [weakSelf.table reloadData] ;
                } ;
            }
        }
        else if (section == 2) {
            if (row == 0) {
                //@"手机号码"
                editAddVC.strTitle = @"手机号码" ;
                editAddVC.strVal = self.userCurrent.mobile ;
                editAddVC.displayType = type_textField_number ;
                editAddVC.blockValString = ^(NSString *str){
                    weakSelf.userCurrent.mobile = str ;
                    [weakSelf.table reloadData] ;
                } ;
            }
            else if (row == 1) {
                //@"真实姓名"
                editAddVC.strTitle = @"真实姓名" ;
                editAddVC.strVal = self.userCurrent.name ;
                editAddVC.displayType = type_textField_words ;
                editAddVC.blockValString = ^(NSString *str){
                    weakSelf.userCurrent.name = str ;
                    [weakSelf.table reloadData] ;
                } ;
            }
            else if (row == 2) {
                //@"身份证"
//                editAddVC.strTitle = @"身份证" ;
////                editAddVC.strVal = self.userCurrent.name ;
//                editAddVC.displayType = type_textField_words ;
//                editAddVC.blockValString = ^(NSString *str){
////                    weakSelf.userCurrent.name = str ;
//                } ;
            }
            else if (row == 3) {
                //@"支付宝"
            }
            else if (row == 4) {
                //@"银行卡"
            }
        }
        
        [self.navigationController pushViewController:editAddVC animated:YES] ;
    }
    
}

- (BOOL)startCameraControllerFromViewController: (UIViewController*) controller
                                  usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   UINavigationControllerDelegate>) delegate
{
    // here, check the device is available  or not
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera] == NO)
        || (delegate == nil)|| (controller == nil)) return NO;
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = YES;
    cameraUI.delegate = delegate;
    [controller presentViewController:cameraUI animated:YES completion:^{}];
    
    return YES;
}
- (void)startAlbum
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}

#pragma mark --
#pragma mark - imagePickerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [SVProgressHUD show] ;
    imgHeadOrigin = [info objectForKey:UIImagePickerControllerEditedImage];

    NSURLSessionUploadTask* uploadTask =
    [ServerRequest uploadTaskWithImage:imgHeadOrigin
                            completion:^(NSURLResponse *response, NSDictionary *responseObject, NSError *error) {
                                [SVProgressHUD dismiss] ;
                                if ([responseObject[@"code"] integerValue] == 1) {
                                    Resource *resource = [Resource yy_modelWithJSON:responseObject[@"data"][@"resource"]] ;
                                    Pic *aPic = [[Pic alloc] initWithResource:resource] ;
                                    self.userCurrent.headPic = aPic ;
                                    
                                    [self dismissViewControllerAnimated:YES
                                                             completion:^{
                                                                 NSLog(@"head geted") ;
                                                                 [_table reloadData] ;
                                                             }];
                                }
                                else {
                                    [SVProgressHUD showErrorWithStatus:@"图片上传失败"] ;
                                }
                                
                            }] ;
    [uploadTask resume] ;
}











#pragma mark - private
- (MineEditAddCtrller *)getEditAddVC
{
    return (MineEditAddCtrller *)[[self class] getCtrllerFromStory:@"Mine" controllerIdentifier:@"MineEditAddCtrller"] ;
}

- (void)uploadCurrentUser
{
    [ServerRequest updateUserInfo:self.userCurrent
                          success:^(id json) {
                              ResultParsered *result = [ResultParsered yy_modelWithJSON:json] ;
                              if (result.code == 1) {
                                  // cache on device ..
                                  [UserOnDevice cacheUserCurrent:self.userCurrent] ;
                              }
                          } fail:^{
                              
                          }] ;
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
