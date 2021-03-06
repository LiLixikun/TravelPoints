//
//  QDSettingViewController.m
//  TravelPoints
//
//  Created by 冉金 on 2019/1/16.
//  Copyright © 2019年 Charles Ran. All rights reserved.
//

#import "QDSettingViewController.h"
#import "QDLoginAndRegisterVC.h"
#import <TYAlertView.h>

@interface QDSettingViewController ()<UITableViewDelegate, UITableViewDataSource>{
    UITableView *_tableView;
    UILabel *_exitCurrent;
    UILabel *_versionLab;
}

@end

@implementation QDSettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self showBack:YES];
    self.title = @"设置";
    [self initTableView];
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)initTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT*0.022, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark -- tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else{
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT*0.09;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //设置cell点击时的颜色
    UIView *backgroundViews = [[UIView alloc]initWithFrame:cell.frame];
    backgroundViews.backgroundColor = [UIColor whiteColor];
    if (indexPath.section == 0) {
        cell.textLabel.font = QDFont(15);
        if (indexPath.row == 0) {
            cell.textLabel.text = @"升级检查";
            _versionLab = [[UILabel alloc] init];
            _versionLab.text = @"当前版本1.0.3";
            _versionLab.font = QDFont(13);
            [cell.contentView addSubview:_versionLab];
            [_versionLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(cell.contentView);
                make.right.equalTo(cell.contentView.mas_right).offset(-(SCREEN_WIDTH*0.054));
            }];
        }else{
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
            cell.textLabel.text = @"关于我们";
        }
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
        _exitCurrent = [[UILabel alloc] init];
        _exitCurrent.text = @"退出当前用户";
        _exitCurrent.font = QDFont(15);
        [cell.contentView addSubview:_exitCurrent];
        [_exitCurrent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(cell.contentView);
            make.height.equalTo(@(SCREEN_HEIGHT*0.03));
        }];
    }
    return cell;
}

#pragma mark - 用户登出接口
- (void)logout{
    [WXProgressHUD showHUD];
    [[QDServiceClient shareClient] logoutWitStr:@"lyjfapp/sso/logout" SuccessBlock:^(QDResponseObject *responseObject) {
        [WXProgressHUD hideHUD];
        if (responseObject.code == 0) {
            //移除cookie
            [QDUserDefaults setObject:@"0" forKey:@"loginType"];
            [QDUserDefaults removeCookies];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [WXProgressHUD showErrorWithTittle:responseObject.message];
        }
    } failureBlock:^(NSError *error) {
        [WXProgressHUD hideHUD];
        [WXProgressHUD showInfoWithTittle:@"网络异常"];
    }];
}
- (void)showAlertView{
    TYAlertView *alertView = [[TYAlertView alloc] initWithTitle:@"提示" message:@"确定退出当前账户?"];
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {
    }]];
    [alertView addAction:[TYAlertAction actionWithTitle:@"确定" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {
        [self logout];
    }]];
    [alertView setButtonTitleColor:[UIColor colorWithHexString:@"#648AC7"] forActionStyle:TYAlertActionStyleCancel forState:UIControlStateNormal];
    [alertView setButtonTitleColor:[UIColor colorWithHexString:@"#648AC7"] forActionStyle:TYAlertActionStyleBlod forState:UIControlStateNormal];
    [alertView setButtonTitleColor:[UIColor colorWithHexString:@"#648AC7"] forActionStyle:TYAlertActionStyleDestructive forState:UIControlStateNormal];
    [alertView show];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
        }else{
            
        }
    }
    if (indexPath.section == 1) {
        [self showAlertView];
    }
}

@end
