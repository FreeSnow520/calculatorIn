//
//  ContentViewController.m
//  qdjdbayi
//
//  Created by 200000549@qq.com on 16/8/1.
//  Copyright © 2016年 200000549@qq.com. All rights reserved.
//

#import "ContentViewController.h"
#define kScreenBounds ([[UIScreen mainScreen] bounds])
#define kScreenWidth (kScreenBounds.size.width)
#define kScreenHeight (kScreenBounds.size.height)
#define HomeColor [UIColor colorWithRed:0/255.0f green:130/255.0f blue:255/255.0f alpha:1]
#import "My.h"
#import "CustomTableViewCell.h"
#import "CustomCollectionViewCell.h"
#import "AFHTTPSessionManager.h"
@interface ContentViewController ()<UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *dataSource1;
@property (nonatomic, copy) NSString *wsbjbl;

@property (nonatomic, copy) NSString *label61Str;
@property (nonatomic, copy) NSString *label62Str;
@property (nonatomic, copy) NSString *label22Str;

@property (nonatomic, copy) NSMutableArray *dataSource2;
@property (nonatomic, copy) NSString *chang66Str;
@property (nonatomic, copy) NSString *chang77Str;

@property (nonatomic, copy) NSString *unknownStr;
@end

@implementation ContentViewController
{
    UIView *headView;
    UILabel *headLabel;
    UIView *view0;
    UIView *view1;
    UIView *view2;
    UIView *view3;
    UIView *view4;
    UIView *view5;
    UIView *view6;
    UIScrollView *s;
    UIButton *btn6, *btn61, *btn60;
    UITextField *tf0, *tf11, *tf12, *tf21, *tf22, *tf23, *tf24, *tf25, *tf26, *tf27, *tf28, *tf29, *tf31, *tf41, *tf42, *tf43, *tf44, *tf45, *tf46;
    UILabel *label21, *label22, *label61, *label62;
}

- (NSMutableArray *)dataSource2{
    if (_dataSource2 == nil) {
        _dataSource2 = [[NSMutableArray alloc]init];
    }
    return _dataSource2;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ([self.tag isEqualToString:@"aa"]) {
        
    }else{
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"www%@www", self.tag);
    NSString *stress = [NSString stringWithFormat:@"http://120.27.125.113:8005/api/ProjectDetial?P_ID=%@&U_ID=%@", self.tag, [defaults objectForKey:@"loginID"]];
    [manager GET:stress parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        id jsonObj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", jsonObj);
        tf0.text = jsonObj[@"data"][@"P_Name"];
        tf11.text = jsonObj[@"data"][@"P_gcjsqtf"];
        
        
        
        tf21.text =jsonObj[@"data"][@"P_fjtze"];
        tf22.text = [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_fjzblrl"] doubleValue] *100];
        tf23.text = [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_fjjaxfl"] doubleValue] *100];
        
        tf24.text = jsonObj[@"data"][@"P_sztze"];
        tf25.text =
        [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_szzblrl"] doubleValue] *100];
        tf26.text =
        [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_szjaxfl"] doubleValue] *100];
        
        tf27.text = jsonObj[@"data"][@"P_yllhtze"];
        tf28.text =
        [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_yllhzblrl"] doubleValue] *100];
        tf29.text =
        [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_yllhjaxfl"] doubleValue] *100];
        
        tf41.text =
        [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_glfl"] doubleValue] *100];
        tf42.text =
        [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_zjcbll"] doubleValue] *100];
        tf43.text =
        [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_zjgjtzgq"] doubleValue] *100];
        tf44.text = jsonObj[@"data"][@"P_jsq"];
        tf45.text = jsonObj[@"data"][@"P_hgq"];
        
        label21.text = jsonObj[@"data"][@"P_hjjaf"];
        label22.text =
        [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_zhzblrl"] doubleValue] *100];
        label61.text =
        [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_zbjirr"] doubleValue]*100.0f];
        label62.text =
        [NSString stringWithFormat:@"%.2f", [jsonObj[@"data"][@"P_tzlrl"]doubleValue]*100.0f ];
        
        if (tf45) {
            int b;
            if ( [tf45.text intValue] != 0) {
                b = [tf45.text intValue] / 4.1+1;
            }else{
                b = 0;
            }
            if ([tf45.text intValue] <= 20 && [tf45.text intValue] > 1) {
                
                self.collectionView.frame = CGRectMake(0, kWidth1*410, kScreenWidth-kWidth1*40, kWidth1*b*60+kWidth1*10);
                
                [view4 removeFromSuperview];
                view4.frame = CGRectMake(kWidth1*20, kWidth1*780, kWidth1*600, kWidth1*410+kWidth1*b*60+kWidth1*10);
                [s addSubview:view4];
                
                [view5 removeFromSuperview];
                view5.frame = CGRectMake(kWidth1*20, kWidth1*(780+20)+view4.frame.size.height, kWidth1*600, kWidth1*60+self.tableView.frame.size.height);
                [s addSubview:view5];
                
                [view6 removeFromSuperview];
                view6.frame = CGRectMake(kWidth1*20, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height, kWidth1*600, kWidth1*160);
                [s addSubview:view6];
                
                [btn60 removeFromSuperview];
                btn60.frame = CGRectMake(kWidth1*10, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
                [s addSubview:btn60];
                
                [btn6 removeFromSuperview];
                btn6.frame = CGRectMake(kWidth1*430, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
                [s addSubview:btn6];
                
                [btn61 removeFromSuperview];
                btn61.frame = CGRectMake(kWidth1*220, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
                [s addSubview:btn61];
                
                s.contentSize = CGSizeMake(kScreenWidth, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20+kWidth1*210);
                [self.collectionView reloadData];
                
            }else{
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入2-10之间的整数" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    
                    NSLog(@"取消");
                    
                }];
                
                [alertController addAction:cancelAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }
        
        
        if (tf44) {
            if ([tf44.text intValue] == 2 || [tf44.text intValue] == 3 ) {
                //            self.tableView.frame = CGRectMake(0, kWidth1*410, kScreenWidth-kWidth1*40,kWidth1*70*[textField.text intValue]);
                
                self.tableView.frame = CGRectMake(0, kWidth1*58, kScreenWidth-kWidth1*40, kWidth1*70*[tf44.text intValue]*4);
                [view5 removeFromSuperview];
                view5.frame = CGRectMake(kWidth1*20, kWidth1*(780+20)+view4.frame.size.height, kWidth1*600, kWidth1*60+kWidth1*70*[tf44.text intValue]*4);
                [s addSubview:view5];
                
                [view6 removeFromSuperview];
                view6.frame = CGRectMake(kWidth1*20, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height, kWidth1*600, kWidth1*160);
                [s addSubview:view6];
                
                [btn60 removeFromSuperview];
                btn60.frame = CGRectMake(kWidth1*10, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
                [s addSubview:btn60];
                
                [btn6 removeFromSuperview];
                btn6.frame = CGRectMake(kWidth1*430, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
                [s addSubview:btn6];
                
                [btn61 removeFromSuperview];
                btn61.frame = CGRectMake(kWidth1*220, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
                [s addSubview:btn61];
                
                s.contentSize = CGSizeMake(kScreenWidth, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20+kWidth1*210);
                
                //            for (int i = 66000; i < 66000+[textField.text intValue]-1; i++) {
                //                textField = (UITextField *)[self.view viewWithTag:i];
                //                textField.text = @"";
                //            }
                
                [self.tableView reloadData];
                
            }else{
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入2或者3" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    
                    NSLog(@"取消");
                    
                }];
                
                [alertController addAction:cancelAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }
        
        
        NSString *tableViewDS1Str = [jsonObj[@"data"][@"P_zjgjtz"] substringToIndex:[jsonObj[@"data"][@"P_zjgjtz"]length]-1];
        NSArray *tableViewDS1 = [tableViewDS1Str componentsSeparatedByString:@","];
        [self.dataSource1 addObjectsFromArray:tableViewDS1];
        
        NSString *tableViewDS2Str = [jsonObj[@"data"][@"P_wsbjbl"] substringToIndex:[jsonObj[@"data"][@"P_wsbjbl"]length]-1];
        self.unknownStr =
        self.unknownStr = [NSString stringWithFormat:@"'%@'", jsonObj[@"data"][@"P_wsbjbl"]];
        NSArray *tableViewDS2 = [tableViewDS2Str componentsSeparatedByString:@","];
        for (int i = 0; i < tableViewDS2.count; i++) {
            [self.dataSource addObject:[NSString stringWithFormat:@"%.2f", [tableViewDS2[i] doubleValue]*100]];
        }
        //[self.dataSource addObjectsFromArray:tableViewDS2];
        [self.tableView reloadData];
        
        
        NSString *tableViewDS3Str = [jsonObj[@"data"][@"P_hgbl"] substringToIndex:[jsonObj[@"data"][@"P_hgbl"]length]-1];
        NSArray *tableViewDS3 = [tableViewDS3Str componentsSeparatedByString:@","];
        for (int i = 0; i < tableViewDS3.count; i++) {
            [self.dataSource2 addObject:[NSString stringWithFormat:@"%.2f", [tableViewDS3[i] doubleValue]*100]];
        }
        //[self.dataSource2 addObjectsFromArray:tableViewDS3];
        NSLog(@"--gg--%@", self.dataSource2);
        [self.collectionView reloadData];
        
        

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    s = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight)];
    s.contentSize = CGSizeMake(kScreenWidth, kWidth1*3000);
    s.backgroundColor = [UIColor colorWithRed:237/255.0f green:238/255.0f blue:239/255.0f alpha:1];
    s.bounces = NO;
    s.userInteractionEnabled = YES;
    [self.view addSubview:s];
    headView = [[UIView alloc]initWithFrame:CGRectMake(kWidth1*0, 0, kWidth1*640, 64)];
    headView.backgroundColor = HomeColor;
    [self.view addSubview:headView];
    headLabel = [My LabelFrameX:220 andY:40 andW:200 andH:60 andTitle:@"项目建设" andTextColor:[UIColor whiteColor] andBgColor:nil andSize:30];
    headLabel.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:headLabel];
    
#pragma mark View0
    view0 = [[UIView alloc]initWithFrame:CGRectMake(kWidth1*20, kWidth1*20, kWidth1*600, kWidth1*70)];
    view0.backgroundColor = [UIColor whiteColor];
    [s addSubview:view0];
    tf0 = [[UITextField alloc]init];
    tf0.placeholder = @"请输入项目名称";
    tf0.frame = CGRectMake(0, 0, kWidth1*600, kWidth1*70);
    tf0.backgroundColor = [UIColor whiteColor];
    tf0.textColor = HomeColor;
    tf0.tag = 9988;
    tf0.delegate = self;
    [view0 addSubview:tf0];
   

#pragma mark View1
    view1 = [[UIView alloc]initWithFrame:CGRectMake(kWidth1*20, kWidth1*100, kWidth1*600, kWidth1*160)];
    view1.backgroundColor = [UIColor whiteColor];
    [s addSubview:view1];
    
    [view1 addSubview:[My LabelFrameX:20 andY:5 andW:200 andH:50 andTitle:@"项目概况" andTextColor:KRedColor andBgColor:nil andSize:30]];
    
    [view1 addSubview:[My View1withY:55]];
    
    
    [view1 addSubview:[My LabelFrameX:20 andY:58 andW:280 andH:40 andTitle:@"工程建设其他费用(万元)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:25]];
    
    tf11 = [My Textfield1withFrame:20 andY:100 andW:200 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    tf11.delegate = self;
    [view1 addSubview:tf11];
    tf11.text = @"0";
    
    [view1 addSubview:[My LabelFrameX:330 andY:58 andW:280 andH:40 andTitle:@"资本金比例(%)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:25]];
    
    tf12 = [My Textfield1withFrame:330 andY:100 andW:200 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    tf12.delegate = self;
    tf12.text = @"25";
    [view1 addSubview:tf12];
    
    
#pragma mark View2
    view2 = [[UIView alloc]initWithFrame:CGRectMake(kWidth1*20, kWidth1*280, kWidth1*600, kWidth1*340)];
    view2.backgroundColor = [UIColor whiteColor];
    [s addSubview:view2];
    
    //横排
    [view2 addSubview:[My LabelFrameX:20 andY:5 andW:140 andH:50 andTitle:@"项目类型" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
    
        [view2 addSubview:[My LabelFrameX:150 andY:5 andW:140 andH:50 andTitle:@"投资额(万元)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
    
        [view2 addSubview:[My LabelFrameX:300 andY:5 andW:140 andH:50 andTitle:@"总包利润率%" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
    
        [view2 addSubview:[My LabelFrameX:450 andY:5 andW:140 andH:50 andTitle:@"建安下浮率%" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
    
    //竖排
        [view2 addSubview:[My LabelFrameX:20 andY:60 andW:140 andH:50 andTitle:@"房建" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
            [view2 addSubview:[My LabelFrameX:20 andY:120 andW:140 andH:50 andTitle:@"市政" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
            [view2 addSubview:[My LabelFrameX:20 andY:180 andW:140 andH:50 andTitle:@"园林绿化" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
            [view2 addSubview:[My LabelFrameX:20 andY:240 andW:160 andH:50 andTitle:@"合计建安费" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
    
            [view2 addSubview:[My LabelFrameX:20 andY:300 andW:160 andH:50 andTitle:@"综合总包利润率" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
    
    //输入行算
    tf21 = [My Textfield1withFrame:150 andY:60 andW:120 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    [view2 addSubview:tf21];
    tf21.text = @"0";
    tf21.delegate = self;
    tf22 = [My Textfield1withFrame:300 andY:60 andW:120 andH:50 andPlaceStr:nil andTextColor:KRedColor];
        [view2 addSubview:tf22];
    tf22.delegate = self;
    tf22.text = @"0";
    tf23 = [My Textfield1withFrame:450 andY:60 andW:120 andH:50 andPlaceStr:nil andTextColor:KRedColor];
        [view2 addSubview:tf23];
    tf23.text = @"0";
    tf23.delegate = self;
    
    tf24 = [My Textfield1withFrame:150 andY:120 andW:120 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    [view2 addSubview:tf24];
    tf24.text = @"0";
    tf24.delegate = self;
    tf25 = [My Textfield1withFrame:300 andY:120 andW:120 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    [view2 addSubview:tf25];
    tf25.delegate = self;
    tf25.text = @"0";
    tf26 = [My Textfield1withFrame:450 andY:120 andW:120 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    [view2 addSubview:tf26];
    tf26.text = @"0";
    tf26.delegate = self;
    
    tf27 = [My Textfield1withFrame:150 andY:180 andW:120 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    [view2 addSubview:tf27];
    tf27.text = @"0";
    tf27.delegate = self;
    tf28 = [My Textfield1withFrame:300 andY:180 andW:120 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    [view2 addSubview:tf28];
    tf28.delegate = self;
    tf28.text = @"0";
    tf29 = [My Textfield1withFrame:450 andY:180 andW:120 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    [view2 addSubview:tf29];
    tf29.text = @"0";
    tf29.delegate = self;
    
    label21 = [My LabelFrameX:160 andY:235 andW:150 andH:60 andTitle:@"" andTextColor:KPurpleColor andBgColor:[UIColor clearColor] andSize:25];
    label21.textAlignment = NSTextAlignmentCenter;
    [view2 addSubview:label21];
    
    label22 = [My LabelFrameX:160 andY:293 andW:150 andH:60 andTitle:@"" andTextColor:KPurpleColor andBgColor:[UIColor clearColor] andSize:25];
    label22.textAlignment = NSTextAlignmentCenter;
    [view2 addSubview:label22];
    [view2 addSubview: [My ImageViewWithX:640-40-260 andY:250 andW:260 andH:90 andImage:@"3"]];
    
    
#pragma mark View3
    view3 = [[UIView alloc]initWithFrame:CGRectMake(kWidth1*20, kWidth1*640, kWidth1*600, kWidth1*130)];
    view3.backgroundColor = [UIColor whiteColor];
    [s addSubview:view3];
    
    [view3 addSubview:[My LabelFrameX:20 andY:5 andW:200 andH:50 andTitle:@"基准利率" andTextColor:KRedColor andBgColor:nil andSize:30]];
    
    [view3 addSubview:[My View1withY:55]];
    
    [view3 addSubview:[My LabelFrameX:20 andY:75 andW:280 andH:40 andTitle:@"基本利率(%)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:25]];
    
    tf31 = [My Textfield1withFrame:330 andY:68 andW:200 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    tf31.delegate = self;
    tf31.text = @"4.9";
    [view3 addSubview:tf31];

#pragma mark View4
    view4 = [[UIView alloc]initWithFrame:CGRectMake(kWidth1*20, kWidth1*790, kWidth1*600, kWidth1*410)];
    view4.backgroundColor = [UIColor whiteColor];
    [s addSubview:view4];
    
    [view4 addSubview:[My LabelFrameX:20 andY:5 andW:200 andH:50 andTitle:@"商务条件" andTextColor:KRedColor andBgColor:nil andSize:30]];
    
    [view4 addSubview:[My View1withY:55]];
    
    [view4 addSubview:[My LabelFrameX:20 andY:60 andW:220 andH:50 andTitle:@"管理费费率(%)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
    [view4 addSubview:[My LabelFrameX:20 andY:120 andW:220 andH:50 andTitle:@"资金成本利率(%)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
    [view4 addSubview:[My LabelFrameX:20 andY:180 andW:220 andH:50 andTitle:@"中建国际投资股权(%)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
    [view4 addSubview:[My LabelFrameX:20 andY:240 andW:160 andH:50 andTitle:@"建设期(年)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
    [view4 addSubview:[My LabelFrameX:20 andY:300 andW:160 andH:50 andTitle:@"回购期(年)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
        [view4 addSubview:[My LabelFrameX:20 andY:360 andW:160 andH:50 andTitle:@"回购比例(%)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:22]];
    
    
    tf41 = [My Textfield1withFrame:330 andY:65 andW:200 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    tf41.delegate = self;
    tf41.text = @"0";
    [view4 addSubview:tf41];
    
    tf42 = [My Textfield1withFrame:330 andY:123 andW:200 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    tf42.delegate = self;
    tf42.text = @"0";
    [view4 addSubview:tf42];
    
    tf43 = [My Textfield1withFrame:330 andY:183 andW:200 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    tf43.delegate = self;
    tf43.text = @"0";
    [view4 addSubview:tf43];
    
    tf44 = [My Textfield1withFrame:330 andY:243 andW:200 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    tf44.delegate = self;
    tf44.tag = 66;
    tf44.placeholder = @"输入2-3";
    [tf44 addTarget:self action:@selector(tf66:) forControlEvents:UIControlEventEditingChanged];
    [view4 addSubview:tf44];
    
    tf45 = [My Textfield1withFrame:330 andY:300 andW:200 andH:50 andPlaceStr:nil andTextColor:KRedColor];
    tf45.delegate = self;
    tf45.tag = 77;
    tf45.placeholder = @"输入2-20";
    [tf45 addTarget:self action:@selector(tf77:) forControlEvents:UIControlEventEditingChanged];
    [view4 addSubview:tf45];
    
    [view4 addSubview:self.collectionView];
    
#pragma mark View5
    view5 = [[UIView alloc]initWithFrame:CGRectMake(kWidth1*20, kWidth1*(710+20+80)+view4.frame.size.height, kWidth1*600, kWidth1*60)];
    view5.backgroundColor = [UIColor whiteColor];
    [s addSubview:view5];
    
    [view5 addSubview:[My View1withY:55]];
    
    [view5 addSubview:[My LabelFrameX:20 andY:5 andW:200 andH:50 andTitle:@"我司资本金" andTextColor:KRedColor andBgColor:nil andSize:30]];
    
        [view5 addSubview:[My LabelFrameX:320 andY:5 andW:200 andH:50 andTitle:@"资本金比例" andTextColor:KRedColor andBgColor:nil andSize:30]];
    
    [view5 addSubview:self.tableView];
    
#pragma mark View6
    view6 = [[UIView alloc]initWithFrame:CGRectMake(kWidth1*20, kWidth1*(710+20+20+80)+view4.frame.size.height+view5.frame.size.height, kWidth1*600, kWidth1*160)];
    view6.backgroundColor = [UIColor whiteColor];
    [s addSubview:view6];
    
    [view6 addSubview:[My LabelFrameX:20 andY:5 andW:200 andH:50 andTitle:@"计算结果" andTextColor:KRedColor andBgColor:nil andSize:30]];
    
    [view6 addSubview:[My View1withY:55]];
    
    [view6 addSubview:[My LabelFrameX:20 andY:60 andW:200 andH:50 andTitle:@"资本金IRR(%)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:25]];
    
    
    [view6 addSubview:[My LabelFrameX:320 andY:60 andW:300 andH:50 andTitle:@"投资利润率(%)" andTextColor:[UIColor blackColor] andBgColor:nil andSize:25]];
    
    label61 = [My LabelFrameX:20 andY:110 andW:200 andH:50 andTitle:@"" andTextColor:KPurpleColor andBgColor:[UIColor clearColor] andSize:30];
        [view6 addSubview:label61];
    
    label62 = [My LabelFrameX:320 andY:110 andW:200 andH:50 andTitle:@"" andTextColor:KPurpleColor andBgColor:[UIColor clearColor] andSize:30];
    
    [view6 addSubview:label62];
    
    
#pragma mark btn6
    
    btn60 = [[UIButton alloc]init];
    btn60.frame = CGRectMake(kWidth1*10, kWidth1*(710+20+20+80)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
    btn60.backgroundColor = HomeColor;
    [btn60 setTintColor:[UIColor whiteColor]];
    [btn60 setTitle:@"另存为" forState:UIControlStateNormal];
    btn60.layer.cornerRadius = 5.0f;
    btn60.clipsToBounds = YES;
    [btn60 addTarget:self action:@selector(lincunweiClicked) forControlEvents:UIControlEventTouchUpInside];
//    [s addSubview:btn60];
    
    btn6 = [[UIButton alloc]init];
    btn6.frame = CGRectMake(kWidth1*430, kWidth1*(710+20+20+80)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
    btn6.backgroundColor = HomeColor;
    [btn6 setTintColor:[UIColor whiteColor]];
    [btn6 setTitle:@"计算" forState:UIControlStateNormal];
    btn6.layer.cornerRadius = 5.0f;
    btn6.clipsToBounds = YES;
    [btn6 addTarget:self action:@selector(jisuanBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [s addSubview:btn6];
    
    
    btn61 = [[UIButton alloc]init];
    btn61.frame = CGRectMake(kWidth1*220, kWidth1*(710+20+20+80)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
    btn61.backgroundColor = HomeColor;
    [btn61 setTintColor:[UIColor whiteColor]];
    [btn61 setTitle:@"保存" forState:UIControlStateNormal];
    btn61.layer.cornerRadius = 5.0f;
    btn61.clipsToBounds = YES;
    [btn61 addTarget:self action:@selector(baocunBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [s addSubview:btn61];
    
    s.contentSize = CGSizeMake(kScreenWidth, kWidth1*(710+20+20+80)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20+kWidth1*210);
    
    
    tf11.textAlignment = NSTextAlignmentCenter;
    tf11.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf12.textAlignment = NSTextAlignmentCenter;
    tf12.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf21.textAlignment = NSTextAlignmentCenter;
    tf21.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf22.textAlignment = NSTextAlignmentCenter;
    tf22.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf23.textAlignment = NSTextAlignmentCenter;
    tf23.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf24.textAlignment = NSTextAlignmentCenter;
    tf24.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf25.textAlignment = NSTextAlignmentCenter;
    tf25.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf26.textAlignment = NSTextAlignmentCenter;
    tf26.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf27.textAlignment = NSTextAlignmentCenter;
    tf27.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf28.textAlignment = NSTextAlignmentCenter;
    tf28.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf29.textAlignment = NSTextAlignmentCenter;
    tf29.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf31.textAlignment = NSTextAlignmentCenter;
    tf31.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf41.textAlignment = NSTextAlignmentCenter;
    tf41.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf42.textAlignment = NSTextAlignmentCenter;
    tf42.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf43.textAlignment = NSTextAlignmentCenter;
    tf43.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf44.textAlignment = NSTextAlignmentCenter;
    tf44.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf45.textAlignment = NSTextAlignmentCenter;
    tf45.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tf46.textAlignment = NSTextAlignmentCenter;
    tf46.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    tf11.tag = 11;
    tf21.tag = 21;
    tf22.tag = 22;
    tf23.tag = 23;
    tf24.tag = 24;
    tf25.tag = 25;
    tf26.tag = 26;
    tf27.tag = 27;
    tf28.tag = 28;
    tf29.tag = 29;
    
    label21.tag = 221;
    label22.tag = 222;
    
#pragma mark - BACK
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth1*30 , kWidth1*40, kWidth1*100, kWidth1*60)];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backClicked) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:btn];
    
}

- (void)backClicked{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)baocunBtnClick{
    [AFHTTPSessionManager showHUD:@"加载中"];
    if ([self.tag isEqualToString:@"aa"]) {
        UITextField *tfa7 = (UITextField *)[self.view viewWithTag:77];
        NSMutableString *a7Mut = [[NSMutableString alloc]init];
        for (NSInteger i = 0; i < [tfa7.text intValue] ; i++) {
            UITextField *tfa71 = (UITextField *)[self.view viewWithTag:77000+i ];
            NSString *tfa72 = [NSString stringWithFormat:@"%.4f,", [tfa71.text doubleValue]/100];
            [a7Mut appendString:tfa72];
            
        }
        NSString *a7End = [NSString stringWithFormat:@"'%@'", a7Mut];
        NSLog(@"%@", a7End);
        
        UITextField *tfa6 = (UITextField *)[self.view viewWithTag:66];
        NSLog(@"%@", tfa6.text);
        NSMutableString *a6Mut = [[NSMutableString alloc]init];
        for (NSInteger i = 0; i < [tfa6.text intValue]+[tfa6.text intValue]*3 ; i++) {
            UITextField *tfa61 = (UITextField *)[self.view viewWithTag:66000+i ];
            NSString *tfa62 = [NSString stringWithFormat:@"%@,", tfa61.text];
            [a6Mut appendString:tfa62];
        }
        
        NSString *a6End = [NSString stringWithFormat:@"'%@'", a6Mut];
        NSLog(@"%@", a6End);
        
        
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString *strss = [NSString stringWithFormat:@"http://120.27.125.113:8005/api/ProjectInter?u_id=%@&name=%@&fjtze=%@&fjzblrl=%@&fjjaxfl=%@&sztze=%@&szzblrl=%@&szjaxfl=%@&yllhtze=%@&yllhzblrl=%@&yllhjaxfl=%@&gcjsqtf=%@&jsq=%@&hgq=%@&zjcbll=%@&hgbl=%@&zjgjtzgq=%@&zjgjtz=%@&jzll=%@&zbjbl=%@&glfl=%@&hjjaf=%@&zhzblrl=%@&wsbjbl=%@&zbjirr=%@&tzlrl=%@",[defaults objectForKey:@"loginID"] ,tf0.text, [NSString stringWithFormat:@"%@", tf21.text  ] , [NSString stringWithFormat:@"%.4f", [tf22.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf23.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%@", tf24.text ] , [NSString stringWithFormat:@"%.4f", [tf25.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf26.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%@", tf27.text ] , [NSString stringWithFormat:@"%.4f", [tf28.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf29.text doubleValue]/100.0f]  , [NSString stringWithFormat:@"%@", tf11.text ] , [NSString stringWithFormat:@"%@", tf44.text ] , [NSString stringWithFormat:@"%@", tf45.text ] , [NSString stringWithFormat:@"%.4f", [tf42.text doubleValue]/100.0f] ,a7End ,[NSString stringWithFormat:@"%.4f", [tf43.text doubleValue]/100.0f] ,a6End,[NSString stringWithFormat:@"%.4f", [tf31.text doubleValue]/100.0f] ,[NSString stringWithFormat:@"%.4f",[tf12.text doubleValue ]/100.0f] ,[NSString stringWithFormat:@"%.4f", [tf41.text doubleValue]/100.0f], label21.text, [NSString stringWithFormat:@"%.4f", [self.label22Str doubleValue]/100.0f] , self.wsbjbl, [NSString stringWithFormat:@"%.@", self.label61Str], [NSString stringWithFormat:@"%@", self.label62Str ]];
       strss = [strss stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [manager GET:strss parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            id jsonObj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@", jsonObj);
            [AFHTTPSessionManager removeHUD];
            if ([jsonObj[@"isok"] isEqualToString:@"true"]) {
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
                
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
            NSLog(@"%@", error);
            [AFHTTPSessionManager removeHUD];
        }];

    }else{
        UITextField *tfa7 = (UITextField *)[self.view viewWithTag:77];
        NSMutableString *a7Mut = [[NSMutableString alloc]init];
        for (NSInteger i = 0; i < [tfa7.text intValue] ; i++) {
            UITextField *tfa71 = (UITextField *)[self.view viewWithTag:77000+i ];
            NSString *tfa72 = [NSString stringWithFormat:@"%.4f,", [tfa71.text doubleValue]/100];
            [a7Mut appendString:tfa72];
            
        }
        NSString *a7End = [NSString stringWithFormat:@"'%@'", a7Mut];
        NSLog(@"%@", a7End);
        
        UITextField *tfa6 = (UITextField *)[self.view viewWithTag:66];
        NSLog(@"%@", tfa6.text);
        NSMutableString *a6Mut = [[NSMutableString alloc]init];
        for (NSInteger i = 0; i < [tfa6.text intValue]+[tfa6.text intValue]*3 ; i++) {
            UITextField *tfa61 = (UITextField *)[self.view viewWithTag:66000+i ];
            NSString *tfa62 = [NSString stringWithFormat:@"%@,", tfa61.text];
            [a6Mut appendString:tfa62];
        }
        
        NSString *a6End = [NSString stringWithFormat:@"'%@'", a6Mut];
        NSLog(@"%@", a6End);
        
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString *strss = [NSString stringWithFormat:@"http://120.27.125.113:8005/api/ProjectUpdate?p_id=%@&u_id=%@&name=%@&fjtze=%@&fjzblrl=%@&fjjaxfl=%@&sztze=%@&szzblrl=%@&szjaxfl=%@&yllhtze=%@&yllhzblrl=%@&yllhjaxfl=%@&gcjsqtf=%@&jsq=%@&hgq=%@&zjcbll=%@&hgbl=%@&zjgjtzgq=%@&zjgjtz=%@&jzll=%@&zbjbl=%@&glfl=%@&hjjaf=%@&zhzblrl=%@&wsbjbl=%@&zbjirr=%@&tzlrl=%@",self.tag ,[defaults objectForKey:@"loginID"] ,tf0.text, [NSString stringWithFormat:@"%@", tf21.text  ] , [NSString stringWithFormat:@"%.4f", [tf22.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf23.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%@", tf24.text ] , [NSString stringWithFormat:@"%.4f", [tf25.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf26.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%@", tf27.text ] , [NSString stringWithFormat:@"%.4f", [tf28.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf29.text doubleValue]/100.0f]  , [NSString stringWithFormat:@"%@", tf11.text ] , [NSString stringWithFormat:@"%@", tf44.text ] , [NSString stringWithFormat:@"%@", tf45.text ] , [NSString stringWithFormat:@"%.4f", [tf42.text doubleValue]/100.0f] ,a7End ,[NSString stringWithFormat:@"%.4f", [tf43.text doubleValue]/100.0f] ,a6End,[NSString stringWithFormat:@"%.4f", [tf31.text doubleValue]/100.0f] ,[NSString stringWithFormat:@"%.4f",[tf12.text doubleValue ]/100.0f] ,[NSString stringWithFormat:@"%.4f", [tf41.text doubleValue]/100.0f], label21.text, label22.text, self.unknownStr, self.label61Str, self.label62Str];
        NSLog(@"--ff--%@", strss);
    strss = [strss stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [manager GET:strss parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            id jsonObj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@", jsonObj);
            [AFHTTPSessionManager removeHUD];
            if ([jsonObj[@"isok"] isEqualToString:@"true"]) {
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
                
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
            NSLog(@"%@", error);
            [AFHTTPSessionManager removeHUD];
        }];

    }

}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 11) {
        [self.tableView reloadData];
    }
    
    if (textField.tag >= 21 && textField.tag <= 29) {
//        合计建安费=房建投资额*(1-房建建安下浮率)+市政投资额*(1-市政建安下浮率)+园林绿化投资额*(1-园林绿化建安下浮率)
//        综合总包利润率=(房建投资额*(房建总包利润率-房建建安下浮率)+市政投资额*(市政总包利润率-市政建安下浮率)+园林绿化投资额*(园林绿化总包利润率-园林绿化建安下浮率))/合计建安费
        double label21Double = [tf21.text doubleValue]*(1-[tf23.text doubleValue]/100.0f)+[tf24.text doubleValue]*(1-[tf26.text doubleValue]/100.0f)+[tf27.text doubleValue]*(1-[tf29.text doubleValue]/100.0f);
        label21.text = [NSString stringWithFormat:@"%.0lf", label21Double];
        
        double label22Double = ([tf21.text doubleValue]*([tf22.text doubleValue]-[tf23.text doubleValue])+[tf24.text doubleValue]*([tf25.text doubleValue]-[tf26.text doubleValue])+[tf27.text doubleValue]*([tf28.text doubleValue]-[tf29.text doubleValue]))/[label21.text doubleValue];
        NSLog(@"%lf", label22Double);
        label22.text = [NSString stringWithFormat:@"%.2lf", label22Double];
        
    }
    if (textField.tag == 77) {
        int b;
        if ( [textField.text intValue] != 0) {
            b = [textField.text intValue] / 4.1+1;
        }else{
            b = 0;
        }
        if ([textField.text intValue] <= 20 && [textField.text intValue] > 1) {
            
            self.collectionView.frame = CGRectMake(0, kWidth1*410, kScreenWidth-kWidth1*40, kWidth1*b*60+kWidth1*10);
            
            [view4 removeFromSuperview];
            view4.frame = CGRectMake(kWidth1*20, kWidth1*780, kWidth1*600, kWidth1*410+kWidth1*b*60+kWidth1*10);
            [s addSubview:view4];
            
            [view5 removeFromSuperview];
            view5.frame = CGRectMake(kWidth1*20, kWidth1*(780+20)+view4.frame.size.height, kWidth1*600, kWidth1*60+self.tableView.frame.size.height);
            [s addSubview:view5];
            
            [view6 removeFromSuperview];
            view6.frame = CGRectMake(kWidth1*20, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height, kWidth1*600, kWidth1*160);
            [s addSubview:view6];
            
            [btn60 removeFromSuperview];
            btn60.frame = CGRectMake(kWidth1*10, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
            [s addSubview:btn60];
            
            [btn6 removeFromSuperview];
            btn6.frame = CGRectMake(kWidth1*430, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
            [s addSubview:btn6];
            
            [btn61 removeFromSuperview];
            btn61.frame = CGRectMake(kWidth1*220, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
            [s addSubview:btn61];
            
            s.contentSize = CGSizeMake(kScreenWidth, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20+kWidth1*210);
            if ([textField.text isEqualToString:self.chang77Str]) {
                NSLog(@"123");
            }else{
                NSLog(@"456");
                [self.dataSource2 removeAllObjects];
                
            }
            
            [self.collectionView reloadData];
            
        }else{
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入2-10之间的整数" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                NSLog(@"取消");
                
            }];
            
            [alertController addAction:cancelAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }
    
    if (textField.tag == 66) {
        if ([textField.text intValue] == 2 || [textField.text intValue] == 3 ) {
            //            self.tableView.frame = CGRectMake(0, kWidth1*410, kScreenWidth-kWidth1*40,kWidth1*70*[textField.text intValue]);

            self.tableView.frame = CGRectMake(0, kWidth1*58, kScreenWidth-kWidth1*40, kWidth1*70*[textField.text intValue]*4);
            [view5 removeFromSuperview];
            view5.frame = CGRectMake(kWidth1*20, kWidth1*(780+20)+view4.frame.size.height, kWidth1*600, kWidth1*60+kWidth1*70*[textField.text intValue]*4);
            [s addSubview:view5];
            
            [view6 removeFromSuperview];
            view6.frame = CGRectMake(kWidth1*20, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height, kWidth1*600, kWidth1*160);
            [s addSubview:view6];
            
            [btn60 removeFromSuperview];
            btn60.frame = CGRectMake(kWidth1*10, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
            [s addSubview:btn60];
            
            [btn6 removeFromSuperview];
            btn6.frame = CGRectMake(kWidth1*430, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
            [s addSubview:btn6];
            
            [btn61 removeFromSuperview];
            btn61.frame = CGRectMake(kWidth1*220, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20, kWidth1*200, kWidth1*60);
            [s addSubview:btn61];
            
            s.contentSize = CGSizeMake(kScreenWidth, kWidth1*(780+20+20)+view4.frame.size.height+view5.frame.size.height+view6.frame.size.height+kWidth1*20+kWidth1*210);
            
            
            if ([textField.text isEqualToString:self.chang66Str]) {
                NSLog(@"123");
            }else{
                NSLog(@"456");
                [self.dataSource1 removeAllObjects];
                [self.dataSource removeAllObjects];
                
            }
            
            [self.tableView reloadData];
            
        }else{
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入2或者3" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                NSLog(@"取消");
                
            }];
            
            [alertController addAction:cancelAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [textField becomeFirstResponder];
    
    UITextField *tfBegin = (UITextField *)[self.view viewWithTag:66];
    NSLog(@"%@", tfBegin.text);
    if (textField.tag >= 66000 && textField.tag <= 66000+[tfBegin.text integerValue] *4 ) {
        NSLog(@"123");
        
//        s.contentOffset = CGPointMake(0, kWidth1*(710+20+20)+view4.frame.size.height+kWidth1*70*[textField.text intValue]*4);
    }
    
//    if (textField.tag >66000+[tfBegin.text integerValue]*4 && textField.tag <=66000+[tfBegin.text integerValue]*2) {
//        s.contentOffset = CGPointMake(0, kWidth1*(710+20+20)+view4.frame.size.height+kWidth1*70*[textField.text intValue]*4*2);
//    }
    
    if (textField.tag == 66) {
        self.chang66Str = textField.text;
    }
    
    if (textField.tag == 77) {
        self.chang77Str = textField.text;
    }
    
    if (textField.tag == 66000 || textField.tag == 66001 || textField.tag == 66002 || textField.tag == 66003 || textField.tag == 66004 || textField.tag == 66005 || textField.tag == 66006 || textField.tag == 66007 || textField.tag == 66008 || textField.tag == 66009 || textField.tag == 66010 || textField.tag == 66011 || textField.tag == 66012 ) {
        NSLog(@"ggggggggggggggg");
        s.contentOffset = CGPointMake(0, kWidth1*(780+20+20)+view4.frame.size.height+kWidth1*40);
    }
    

}

- (void)tf66:(UITextField *)textField{
    

}

- (void)tf77:(UITextField *)textField{


}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];


    return YES;
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    UITextField *tf = (UITextField *)[self.view viewWithTag:77];
    
    return [tf.text integerValue];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell *cell;
    if (cell == nil) {
        cell = [collectionView
        dequeueReusableCellWithReuseIdentifier:@"cellIde1" forIndexPath:indexPath];
    }
    
    cell.TF.tag = 77000+indexPath.row;
    cell.TF.delegate = self;
    cell.TF.textColor = KRedColor;
    if (self.dataSource2.count != 0) {
        cell.TF.text = self.dataSource2[indexPath.row];
    }else{
        cell.TF.text = @"";
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@",indexPath);
    
}

- (UICollectionViewFlowLayout *)flowLayout{
    
    if (_flowLayout == nil) {
        
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        
        _flowLayout.itemSize = CGSizeMake(kWidth1*137, kWidth1*50);
        
        _flowLayout.minimumInteritemSpacing = kWidth1*10;
        
        _flowLayout.minimumLineSpacing = kWidth1*10;
        
        _flowLayout.sectionInset = UIEdgeInsetsMake(kWidth1*10, kWidth1*10, kWidth1*10, kWidth1*10);
        
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        
    }
        return _flowLayout;
    }

- (UICollectionView *)collectionView{
    
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kWidth1*410, kScreenWidth-kWidth1*40, 0) collectionViewLayout:self.flowLayout];
        _collectionView.userInteractionEnabled = YES;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;

        [_collectionView registerNib:[UINib nibWithNibName:@"CustomCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellIde1"];
    }
    
    return _collectionView;
    
}

- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
    
}

- (NSMutableArray *)dataSource1{
    if (_dataSource1 == nil) {
        
        _dataSource1 = [[NSMutableArray alloc]init];
    }
    return _dataSource1;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kWidth1*70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    UITextField *tf = (UITextField *)[self.view viewWithTag:66];
    return [tf.text integerValue]*4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIde" forIndexPath:indexPath];
    cell.TF.tag = 66000+indexPath.row;
    cell.TF.delegate = self;
    UITextField *tf = (UITextField *)[self.view viewWithTag:66];

    cell.selectionStyle = UITableViewCellAccessoryNone;
    cell.TF.textColor = KRedColor;
    cell.Label.tag = 88000+indexPath.row;
    if (self.dataSource.count != 0) {
        cell.Label.text = self.dataSource[indexPath.row];
        cell.TF.text = self.dataSource1[indexPath.row];

    }else{
        if (indexPath.row == [tf.text integerValue]*4-1) {
            cell.TF.text = @"0";
            cell.Label.text = @"";
            
        }else{
            cell.TF.text = @"";
            cell.Label.text = @"";
        }
        
        if (indexPath.row == 0) {
            
            if ([tf11.text isEqualToString:@"0"]) {
                cell.TF.text = @"0";
            }else{
                cell.TF.text = @"";
            }
        }
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (UITableView *)tableView{
    
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kWidth1*410, kScreenWidth-kWidth1*40, 0) style:UITableViewStyleGrouped];
        _tableView.bounces = NO;
        _tableView.delegate = self;
        _tableView.userInteractionEnabled = YES;
        _tableView.dataSource = self;
        
        [_tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellIde"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIde3"];
        
    }
    
    return _tableView;
    
}


- (void)jisuanBtnClick{
    [AFHTTPSessionManager showHUD:@"加载中"];
    UITextField *tfa7 = (UITextField *)[self.view viewWithTag:77];
    NSMutableString *a7Mut = [[NSMutableString alloc]init];
    for (NSInteger i = 0; i < [tfa7.text intValue] ; i++) {
        UITextField *tfa71 = (UITextField *)[self.view viewWithTag:77000+i ];
        NSString *tfa72 = [NSString stringWithFormat:@"%.4f,", [tfa71.text doubleValue]/100];
        [a7Mut appendString:tfa72];
        
    }
    NSString *a7End = [NSString stringWithFormat:@"'%@'", a7Mut];
    NSLog(@"--kk--%@", a7End);
    
    UITextField *tfa6 = (UITextField *)[self.view viewWithTag:66];
    NSLog(@"%@", tfa6.text);
    NSMutableString *a6Mut = [[NSMutableString alloc]init];
    for (NSInteger i = 0; i < [tfa6.text intValue]+[tfa6.text intValue]*3 ; i++) {
        UITextField *tfa61 = (UITextField *)[self.view viewWithTag:66000+i ];
        NSString *tfa62 = [NSString stringWithFormat:@"%@,", tfa61.text];
        if (i == [tfa6.text intValue]+[tfa6.text intValue]*3 -1) {
            [a6Mut appendString:@"0,"];
        }else{
            [a6Mut appendString:tfa62];
        }
        
    }
    
    NSString *a6End = [NSString stringWithFormat:@"'%@'", a6Mut];
    NSLog(@"--hh--%@", a6End);
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    NSString *strss = [NSString stringWithFormat:@"http://120.27.125.113:8005/api/Calculation?fjtze=%@&fjzblrl=%@&fjjaxfl=%@&sztze=%@&szzblrl=%@&szjaxfl=%@&yllhtze=%@&yllhzblrl=%@&yllhjaxfl=%@&gcjsqtf=%@&jsq=%@&hgq=%@&zjcbll=%@&hgbl=%@&zjgjtzgq=%@&zjgjtz=%@&jzll=%@&zbjbl=%@&glfl=%@", [NSString stringWithFormat:@"%@", tf21.text  ] , [NSString stringWithFormat:@"%.4f", [tf22.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf23.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%@", tf24.text ] , [NSString stringWithFormat:@"%.4f", [tf25.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf26.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%@", tf27.text ] , [NSString stringWithFormat:@"%.4f", [tf28.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf29.text doubleValue]/100.0f]  , [NSString stringWithFormat:@"%@", tf11.text ] , [NSString stringWithFormat:@"%@", tf44.text ] , [NSString stringWithFormat:@"%@", tf45.text ] , [NSString stringWithFormat:@"%.4f", [tf42.text doubleValue]/100.0f] ,a7End ,[NSString stringWithFormat:@"%.4f", [tf43.text doubleValue]/100.0f] ,a6End,[NSString stringWithFormat:@"%.4f", [tf31.text doubleValue]/100.0f] ,[NSString stringWithFormat:@"%.4f",[tf12.text doubleValue ]/100.0f] ,[NSString stringWithFormat:@"%.4f", [tf41.text doubleValue]/100.0f]];
    
    NSLog(@"%@", strss);
    [manager GET:strss parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", json);
        NSLog(@"%@", json[@"info"]);
        [AFHTTPSessionManager removeHUD];
        if ([json[@"isok"] isEqualToString:@"true"]) {
            label21.text = json[@"data"][@"jaf"];
            
            label22.text = [NSString stringWithFormat:@"%.2f", [json[@"data"][@"zhzblyl"] doubleValue]*100];
            self.label22Str = json[@"data"][@"zhzblyl"];
            
            label61.text = [NSString stringWithFormat:@"%.2f",[json[@"data"][@"IRR"] doubleValue]*100];
            self.label61Str = json[@"data"][@"IRR"];
            NSLog(@"---hh--%@", self.label61Str);
            label62.text = [NSString stringWithFormat:@"%.2f", [json[@"data"][@"tzlyl"] doubleValue]*100];
            self.label62Str = json[@"data"][@"tzlyl"];
            
            NSMutableString *mStr = [[NSMutableString alloc]init];
            [self.dataSource removeAllObjects];
            for (NSInteger i = 0; i <= [tfa6.text intValue]+[tfa6.text intValue]*3-1 ; i++){
                
                [self.dataSource addObject:[NSString stringWithFormat:@"%.2f", [json[@"data"][@"zbjzb"][i] doubleValue] *100]];
                [mStr appendString:[NSString stringWithFormat:@"%@,",json[@"data"][@"zbjzb"][i]]];
            }
            NSLog(@"--hh--%@", self.dataSource);
//            [self.dataSource addObject:json[@"data"][@"zbjzb"][[tfa6.text intValue]+[tfa6.text intValue]*3]];
//            [mStr appendString:[NSString stringWithFormat:@"%@,",json[@"data"][@"zbjzb"][[tfa6.text intValue]+[tfa6.text intValue]*3]]];
            self.wsbjbl = [NSString stringWithFormat:@"'%@'", mStr];
            [self.dataSource1 removeAllObjects];
            for (NSInteger i = 0; i < [tfa6.text intValue]*4 ; i++){
                [self.dataSource1 addObject:json[@"data"][@"wsbj"][i]];
            }
            NSLog(@"--gg--%@", self.dataSource1);
            
            [self.tableView reloadData];
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"计算成功" preferredStyle:UIAlertControllerStyleAlert];
            
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

- (void)lincunweiClicked{
    [AFHTTPSessionManager showHUD:@"加载中"];
        UITextField *tfa7 = (UITextField *)[self.view viewWithTag:77];
        NSMutableString *a7Mut = [[NSMutableString alloc]init];
        for (NSInteger i = 0; i < [tfa7.text intValue] ; i++) {
            UITextField *tfa71 = (UITextField *)[self.view viewWithTag:77000+i ];
            NSString *tfa72 = [NSString stringWithFormat:@"%.4f,", [tfa71.text doubleValue]/100];
            [a7Mut appendString:tfa72];
            
        }
        NSString *a7End = [NSString stringWithFormat:@"'%@'", a7Mut];
        NSLog(@"%@", a7End);
        
        UITextField *tfa6 = (UITextField *)[self.view viewWithTag:66];
        NSLog(@"%@", tfa6.text);
        NSMutableString *a6Mut = [[NSMutableString alloc]init];
        for (NSInteger i = 0; i < [tfa6.text intValue]+[tfa6.text intValue]*3 ; i++) {
            UITextField *tfa61 = (UITextField *)[self.view viewWithTag:66000+i ];
            NSString *tfa62 = [NSString stringWithFormat:@"%@,", tfa61.text];
            [a6Mut appendString:tfa62];
        }
        
        NSString *a6End = [NSString stringWithFormat:@"'%@'", a6Mut];
        NSLog(@"%@", a6End);
        
        
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString *strss = [NSString stringWithFormat:@"http://120.27.125.113:8005/api/ProjectInter?u_id=%@&name=%@&fjtze=%@&fjzblrl=%@&fjjaxfl=%@&sztze=%@&szzblrl=%@&szjaxfl=%@&yllhtze=%@&yllhzblrl=%@&yllhjaxfl=%@&gcjsqtf=%@&jsq=%@&hgq=%@&zjcbll=%@&hgbl=%@&zjgjtzgq=%@&zjgjtz=%@&jzll=%@&zbjbl=%@&glfl=%@&hjjaf=%@&zhzblrl=%@&wsbjbl=%@&zbjirr=%@&tzlrl=%@",[defaults objectForKey:@"loginID"] ,tf0.text, [NSString stringWithFormat:@"%@", tf21.text  ] , [NSString stringWithFormat:@"%.4f", [tf22.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf23.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%@", tf24.text ] , [NSString stringWithFormat:@"%.4f", [tf25.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf26.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%@", tf27.text ] , [NSString stringWithFormat:@"%.4f", [tf28.text doubleValue]/100.0f] , [NSString stringWithFormat:@"%.4f", [tf29.text doubleValue]/100.0f]  , [NSString stringWithFormat:@"%@", tf11.text ] , [NSString stringWithFormat:@"%@", tf44.text ] , [NSString stringWithFormat:@"%@", tf45.text ] , [NSString stringWithFormat:@"%.4f", [tf42.text doubleValue]/100.0f] ,a7End ,[NSString stringWithFormat:@"%.4f", [tf43.text doubleValue]/100.0f] ,a6End,[NSString stringWithFormat:@"%.4f", [tf31.text doubleValue]/100.0f] ,[NSString stringWithFormat:@"%.4f",[tf12.text doubleValue ]/100.0f] ,[NSString stringWithFormat:@"%.4f", [tf41.text doubleValue]/100.0f], label21.text, [NSString stringWithFormat:@"%.4f", [self.label22Str doubleValue]/100.0f] , self.wsbjbl, [NSString stringWithFormat:@"%.@", self.label61Str], [NSString stringWithFormat:@"%@", self.label62Str ]];
        strss = [strss stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [manager GET:strss parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            id jsonObj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@", jsonObj);
            [AFHTTPSessionManager removeHUD];
            if ([jsonObj[@"isok"] isEqualToString:@"true"]) {
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
                
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
            NSLog(@"%@", error);
            [AFHTTPSessionManager removeHUD];
        }];
        
}


@end
