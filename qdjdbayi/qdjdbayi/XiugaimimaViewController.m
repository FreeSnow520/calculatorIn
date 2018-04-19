//
//  XiugaimimaViewController.m
//  qdjdbayi
//
//  Created by 200000549@qq.com on 2016/10/9.
//  Copyright © 2016年 200000549@qq.com. All rights reserved.
//

#import "XiugaimimaViewController.h"
#import "AFHTTPSessionManager.h"
@interface XiugaimimaViewController ()

@end

@implementation XiugaimimaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)fanhuiBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)xiugaiBtnClicked:(id)sender {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    ;
    
    if (![self.tf2.text isEqualToString:self.tf3.text]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"两次输入的新密码不一样" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            NSLog(@"取消");
            
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        NSString *a = [NSString stringWithFormat:@"http://120.27.125.113:8005/api/Password?u_id=%@&password=%@&newpassword=%@", [defaults objectForKey:@"loginID"], self.tf1.text, self.tf2.text];
        [manager GET:a parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            id jsonObj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            NSLog(@"--mm--%@", jsonObj);
            if ([jsonObj[@"isok"] isEqualToString:@"true"]) {
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"修改成功" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    
                    NSLog(@"取消");
                    
                }];
                
                
                
                [alertController addAction:cancelAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }else{
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:jsonObj[@"info"] preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    
                    NSLog(@"取消");
                    
                }];
                
                [alertController addAction:cancelAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"==mm==%@", error);
        }];
    }
                        



}

@end
