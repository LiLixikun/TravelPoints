//
//  QDSetLoginPwdView.m
//  TravelPoints
//
//  Created by 冉金 on 2019/1/15.
//  Copyright © 2019年 Charles Ran. All rights reserved.
//

#import "QDSetLoginPwdView.h"

@implementation QDSetLoginPwdView
- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        _identifyLab = [[UILabel alloc] init];
        _identifyLab.text = @"请设置登录密码";
        _identifyLab.font = QDFont(22);
        [self addSubview:_identifyLab];
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#50C533"];
        [self addSubview:_lineView];
        
        _lineViewTop = [[UIView alloc] init];
        _lineViewTop.backgroundColor = [UIColor colorWithHexString:@"#DDDDDD"];
        [self addSubview:_lineViewTop];
        
        _lineViewCenter = [[UIView alloc] init];
        _lineViewCenter.backgroundColor = [UIColor colorWithHexString:@"#DDDDDD"];
        [self addSubview:_lineViewCenter];
        
        _lineViewBottom = [[UIView alloc] init];
        _lineViewBottom.backgroundColor = [UIColor colorWithHexString:@"#DDDDDD"];
        [self addSubview:_lineViewBottom];
        
        _pwdTF = [[UITextField alloc] init];
        _pwdTF.placeholder = @"请输入登录密码";
        [_pwdTF setValue:[UIColor colorWithHexString:@"#CCCCCC"] forKeyPath:@"placeholderLabel.textColor"];
        [_pwdTF setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
        [self addSubview:_pwdTF];
        
        _confirmPwdTF = [[UITextField alloc] init];
        _confirmPwdTF.placeholder = @"请确认登录密码";
        [_confirmPwdTF setValue:[UIColor colorWithHexString:@"#CCCCCC"] forKeyPath:@"placeholderLabel.textColor"];
        [_confirmPwdTF setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
        [self addSubview:_confirmPwdTF];
        
        _inviteTF = [[UITextField alloc] init];
        _inviteTF.placeholder = @"请填写邀请码(选填)";
        [_inviteTF setValue:[UIColor colorWithHexString:@"#CCCCCC"] forKeyPath:@"placeholderLabel.textColor"];
        [_inviteTF setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
        [self addSubview:_inviteTF];
        
        _registerBtn = [[UIButton alloc] init];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.backgroundColor = [UIColor colorWithHexString:@"#72BB37"];
        [self addSubview:_registerBtn];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_identifyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(SCREEN_HEIGHT*0.156);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.identifyLab);
        make.top.equalTo(self.identifyLab.mas_bottom).offset(SCREEN_HEIGHT*0.012);
        make.width.mas_equalTo(SCREEN_WIDTH*0.097);
        make.height.mas_equalTo(SCREEN_WIDTH*0.01);
    }];
    
    [_lineViewTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.mas_top).offset(SCREEN_HEIGHT*0.354);
        make.width.mas_equalTo(SCREEN_WIDTH*0.89);
        make.height.equalTo(@1);
    }];
    
    [_pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(SCREEN_WIDTH*0.053);
        make.bottom.equalTo(self.lineViewTop.mas_top).offset(-(SCREEN_HEIGHT*0.015));
    }];
    
    [_lineViewCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.lineViewTop.mas_top).offset(SCREEN_HEIGHT*0.088);
        make.width.and.height.equalTo(self.lineViewTop);
        make.height.equalTo(@1);
    }];

    [_confirmPwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(SCREEN_WIDTH*0.053);
        make.bottom.equalTo(self.lineViewCenter.mas_top).offset(-(SCREEN_HEIGHT*0.015));
    }];

    [_lineViewBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.and.height.equalTo(self.lineViewCenter);
        make.top.equalTo(self.lineViewCenter.mas_top).offset(SCREEN_HEIGHT*0.088);
    }];

    [_inviteTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.confirmPwdTF);
        make.bottom.equalTo(self.lineViewBottom.mas_top).offset(-(SCREEN_HEIGHT*0.015));
    }];
    
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.and.width.equalTo(self.lineViewBottom);
        make.top.equalTo(self.lineViewBottom.mas_bottom).offset(SCREEN_HEIGHT*0.068);
        make.height.mas_equalTo(SCREEN_HEIGHT*0.075);
    }];
}

@end
