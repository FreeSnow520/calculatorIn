//
//  LoginTableViewController.m
//  hongjiugongchangban
//
//  Created by 200000549@qq.com on 16/6/13.
//  Copyright © 2016年 青岛节点网络技术有限公司. All rights reserved.
//

#import "LoginTableViewController.h"
#import "WebServiceHelper.h"
#import "My.h"
#import "ContentViewController.h"
#import "AFHTTPSessionManager.h"
#import "ErpViewController.h"
@interface LoginTableViewController ()<WebServiceDelegate, UITextFieldDelegate>
@end

@implementation LoginTableViewController
{
    UITextField *uTF;
    UITextField *pTF;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:[My ImageViewWithX:215 andY:100 andW:210 andH:210 andImage:@"计算器"]];
    [self.view addSubview:[My ImageViewWithX:40 andY:400 andW:40 andH:40 andImage:@"用户名"]];
    [self.view addSubview:[My ImageViewWithX:40 andY:500 andW:40 andH:40 andImage:@"密码"]];
    uTF = [My TextfieldwithFrame:100 andY:400 andW:400 andH:40 andPlaceStr:@"请输入用户名" andTextColor:nil];
    uTF.delegate = self;
    [self.view addSubview:uTF];
    [self.view addSubview:[My ViewwithX:40 andY:450 andW:540 andBgColor:[UIColor whiteColor]]];
    pTF = [My TextfieldwithFrame:100 andY:500 andW:400 andH:40 andPlaceStr:@"请输入密码" andTextColor:nil];
    pTF.delegate = self;
    pTF.secureTextEntry = YES;
    [self.view addSubview:pTF];
    [self.view addSubview:[My ViewwithX:40 andY:550 andW:540 andBgColor:[UIColor whiteColor]]];

    UIButton * btn = [My BtnwithImageFrameX:70 andY:600 andW:500 andH:70 andtitle:@"登录" andImage:nil andtitleColor:[UIColor whiteColor] andBGColor:[UIColor colorWithRed:0/255 green:130.0/255 blue:255.0/255 alpha:1] target:self action:@selector(BtnClicked)];
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = btn.frame.size.height/2;
    [self.view addSubview:btn];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(16, [UIScreen mainScreen].bounds.size.height - 40,[UIScreen mainScreen].bounds.size.width - 32, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"仅供本公司销售内部使用";
    [self.view addSubview:label];
    
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(someMethod)
//                                                 name:UIApplicationDidEnterBackgroundNotification
//                                               object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(someMethod)
//                                                 name:UIApplicationDidBecomeActiveNotification object:nil];

    
}




- (void)BtnClicked{
    [AFHTTPSessionManager showHUD:@"加载中"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *a = [NSString stringWithFormat:@"http://120.27.125.113:8005/api/Login?usercode=%@&password=%@", uTF.text, pTF.text];
    [manager GET:a parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", json);
        [AFHTTPSessionManager removeHUD];
        if ([json[@"isok"] isEqualToString:@"true"]) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:json[@"data"][@"U_ID"] forKey:@"loginID"];
            ErpViewController *vc1 = [[ErpViewController alloc]init];
            [self presentViewController:vc1 animated:NO completion:nil];
            
        }else{
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号密码输入不正确" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                NSLog(@"取消");
                
            }];
            
            [alertController addAction:cancelAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
        [AFHTTPSessionManager removeHUD];
    }];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
