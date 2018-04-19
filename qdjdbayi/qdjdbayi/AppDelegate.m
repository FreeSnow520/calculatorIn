//
//  AppDelegate.m
//  qdjdbayi
//
//  Created by 200000549@qq.com on 16/8/1.
//  Copyright © 2016年 200000549@qq.com. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginTableViewController.h"
@interface AppDelegate ()
@property (nonatomic, strong) UIView *showdowView;//阴影保护

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    LoginTableViewController *vc = [[LoginTableViewController alloc]init];
    self.window.rootViewController = vc;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    //        self.showdowView.hidden = self.showdowView.hidden?NO:YES;
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    self.showdowView.hidden = NO;
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    self.showdowView.hidden = YES;
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(UIView *)showdowView {
    if (_showdowView == nil) {
        _showdowView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"密码"]];
        
        _showdowView.backgroundColor = [UIColor whiteColor];
        imageView.frame = CGRectMake(0, 0, 50, 50);
        imageView.center = _showdowView.center;
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.frame.size.height + imageView.frame.origin.y + 20, _showdowView.frame.size.width, 20)];
        label.text = @"内部使用";
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        [_showdowView addSubview:imageView];
        [_showdowView addSubview:label];
        [[UIApplication sharedApplication].keyWindow addSubview:_showdowView];
        
    }
    return _showdowView;
}
- (void)someMethod {
    self.showdowView.hidden = NO;
    //    self.showdowView.hidden = self.showdowView.hidden?NO:YES;
}

@end
