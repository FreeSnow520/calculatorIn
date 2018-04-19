//
//  ErpViewController.m
//  qdjdbayi
//
//  Created by 200000549@qq.com on 16/8/15.
//  Copyright © 2016年 200000549@qq.com. All rights reserved.
//

#import "ErpViewController.h"
#import "My.h"
#import "ERPTableViewCell.h"
#import "ContentViewController.h"
#import "AFNetworking.h"
#import "ErpModel.h"
#import "XiugaimimaViewController.h"
#define kScreenBounds ([[UIScreen mainScreen] bounds])
#define kScreenWidth (kScreenBounds.size.width)
#define kScreenHeight (kScreenBounds.size.height)
@interface ErpViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, deleteBtnClicked>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISegmentedControl * segmentedControl;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ErpViewController
{
    UIView *headView;
    UILabel *headLabel;
    UIView *heavView1;
    UITextField *searchTF;
}

#pragma mark - Handler Methods
- (void)indexDidChangeForSegmentedControl:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        
    }else {
        ContentViewController *vc = [[ContentViewController alloc]init];
        vc.tag = @"aa";
        [self presentViewController:vc animated:NO completion:nil];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    headView = [[UIView alloc]initWithFrame:CGRectMake(kWidth1*0, 0, kWidth1*640, 64)];
    headView.backgroundColor = [UIColor colorWithRed:0/255.0f green:130/255.0f blue:255/255.0f alpha:1];
    [self.view addSubview:headView];
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"投资管理", @"投资计算"]];
    
    _segmentedControl.frame = CGRectMake(kScreenWidth/ 2 - 90, headView.frame.size.height  - 30, 180, 30);
    
    _segmentedControl.selectedSegmentIndex = 0;
    _segmentedControl.tintColor = [UIColor colorWithRed:252/255.0 green:245/255.0 blue:248/255.0 alpha:1];
    
    [_segmentedControl addTarget:self action:@selector(indexDidChangeForSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    
    [headView addSubview:_segmentedControl];
    
//
//    headLabel = [My LabelFrameX:220 andY:40 andW:200 andH:60 andTitle:@"项目投资管理" andTextColor:[UIColor whiteColor] andBgColor:nil andSize:30];
//    headLabel.textAlignment = NSTextAlignmentCenter;
//    [headView addSubview:headLabel];
//    [headView addSubview:[My BtnwithImageFrameX:500 andY:40 andW:140 andH:60 andtitle:@"修改密码" andImage:nil andtitleColor:[UIColor whiteColor] andBGColor:[UIColor clearColor] target:self action:@selector(xiugaimimaClicked)]];
    
    self.view.backgroundColor =
    [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1.0f];
    heavView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kWidth1*640, 50)];
    heavView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:heavView1];
    
    searchTF = [[UITextField alloc]initWithFrame:CGRectMake(20, 10, kScreenWidth-100-20, 30)];
    searchTF.borderStyle = UITextBorderStyleRoundedRect;
    UIView *searchTFLeftView = [[UIView alloc]initWithFrame:CGRectMake(10, 4, 30, 30)];
    [searchTFLeftView addSubview:[My ImageViewWithX:15 andY:13 andW:30 andH:30 andImage:@"搜索"]];
    searchTF.leftView = searchTFLeftView;
    searchTF.placeholder = @"请输入搜索信息";
    searchTF.delegate = self;
    searchTF.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1];
    searchTF.leftViewMode = UITextFieldViewModeAlways;
    [heavView1 addSubview:searchTF];
    
    [heavView1 addSubview:[My BtnwithImageFrameX:500 andY:18 andW:100 andH:40 andtitle:@"搜索" andImage:nil andtitleColor:[UIColor colorWithRed:0/255.0f green:130/255.0f blue:255/255.0f alpha:1] andBGColor:nil target:self action:@selector(searchBtnClicked)]];
    
//    UIButton *footBtn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth1* 400, kScreenHeight-kWidth1*145,kWidth1* 100,kWidth1* 100)];
//    footBtn.layer.cornerRadius = kWidth1* 100/2.0f;
//    footBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
//    footBtn.layer.borderWidth = 1.0f;
//    [footBtn addTarget:self action:@selector(addClicked) forControlEvents:UIControlEventTouchUpInside];
//    [footBtn setImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
//    [self.view addSubview:footBtn];
    
    UIButton *editPWDBtn = [[UIButton alloc]initWithFrame:CGRectMake(16, kScreenHeight-kWidth1*145,kScreenWidth - 32,40)];
    editPWDBtn.layer.cornerRadius = 40/2.0f;
    editPWDBtn.backgroundColor = [UIColor colorWithRed:0/255.0f green:130/255.0f blue:255/255.0f alpha:1];
//    editPWDBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
//    editPWDBtn.layer.borderWidth = 1.0f;
    [editPWDBtn addTarget:self action:@selector(xiugaimimaClicked) forControlEvents:UIControlEventTouchUpInside];
    [editPWDBtn setTitle:@"修改密码" forState:UIControlStateNormal];
    [self.view addSubview:editPWDBtn];
//
//
//        [self.view addSubview:[My BtnwithImageFrameX:16 andY:kScreenHeight - 60 andW:140 andH:60 andtitle:@"修改密码" andImage:nil andtitleColor:[UIColor whiteColor] andBGColor:[UIColor clearColor] target:self action:@selector(xiugaimimaClicked)]];
}

- (void)xiugaimimaClicked{
    NSLog(@"123");
    XiugaimimaViewController *vc = [[XiugaimimaViewController alloc]init];
    [self presentViewController:vc animated:NO completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view addSubview:self.tableView];
    _segmentedControl.selectedSegmentIndex = 0;
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    ;
    
    NSString *stress = [NSString stringWithFormat:@"http://120.27.125.113:8005/api/Project?U_ID=%@", [defaults objectForKey:@"loginID"]];
    [manager GET:stress parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        id jsonObj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"---bbbb----%@", jsonObj);
        if (jsonObj[@"datas"] != [NSNull null]) {
            [self.dataSource removeAllObjects];
            for (NSDictionary *dict in jsonObj[@"datas"]) {
                ErpModel *model = [[ErpModel alloc]initWithDictionary:dict error:nil];
                [self.dataSource addObject:model];
            }
            
            [self.tableView reloadData];
        }

        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}


- (NSMutableArray *)dataSource{
    
    if (_dataSource == nil) {
        
        _dataSource = [[NSMutableArray alloc]init];
        
    }
    
    return _dataSource;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ERPTableViewCell *cell;
    if (cell == nil) {
           cell   = [tableView dequeueReusableCellWithIdentifier:@"cellIde" forIndexPath:indexPath];
    }
    ErpModel *model = self.dataSource[indexPath.row];
    cell.label1.text = @"项目名称";
    cell.label2.text = @"创建时间";
    cell.label3.text = model.P_Name;
    cell.label4.text = model.P_Date;
    cell.selectionStyle = UITableViewCellAccessoryNone;
    cell.delegate = self;
    return cell;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kWidth1*120;
}

- (UITableView *)tableView{
    
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+60, kScreenWidth, kScreenHeight-64-kWidth1*145-60) style:UITableViewStyleGrouped];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIde"];
        [_tableView registerNib:[UINib nibWithNibName:@"ERPTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellIde"];
    }
    
    return _tableView;
    
}



- (void)deleteBtn:(UITableViewCell *)cell{
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    ;
    
    ErpModel *model = self.dataSource[path.row];
    
    
    NSString *stress = [NSString stringWithFormat:@"http://120.27.125.113:8005/api/ProjectDel?u_id=%@&p_id=%@", [defaults objectForKey:@"loginID"], model.P_ID];
    [manager GET:stress parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        id jsonObj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", jsonObj);
//        [self.dataSource removeAllObjects];
//        for (NSDictionary *dict in jsonObj[@"datas"]) {
//            ErpModel *model = [[ErpModel alloc]initWithDictionary:dict error:nil];
//            [self.dataSource addObject:model];
//        }
        
        [self.dataSource removeObjectAtIndex:path.row];
        [self.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    NSLog(@"%ld", (long)path.row);
}
- (void)searchBtnClicked{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    ;
    searchTF.text = [searchTF.text stringByReplacingOccurrencesOfString:@" " withString: @""];
    NSString *stress = [NSString stringWithFormat:@"http://120.27.125.113:8005/api/Project?U_ID=%@&name=%@", [defaults objectForKey:@"loginID"], searchTF.text];
    [manager GET:stress parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        id jsonObj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"---sss---%@", jsonObj);
        
        if (jsonObj[@"datas"] != [NSNull null]) {
            [self.dataSource removeAllObjects];
            for (NSDictionary *dict in jsonObj[@"datas"]) {
                ErpModel *model = [[ErpModel alloc]initWithDictionary:dict error:nil];
                [self.dataSource addObject:model];
            }
            
            [self.tableView reloadData];
        }else {
            [AFHTTPSessionManager showHUD:@"暂无数据"];
            dispatch_after(2, dispatch_get_main_queue(), ^{
                [AFHTTPSessionManager removeHUD];
            });
        }

        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}


- (void)addClicked{
    ContentViewController *vc = [[ContentViewController alloc]init];
    vc.tag = @"aa";
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    ContentViewController *vc = [[ContentViewController alloc]init];
    ErpModel *model = self.dataSource[indexPath.row];
    vc.tag = model.P_ID;
    [self presentViewController:vc animated:NO completion:nil];
    NSLog(@"123");
}

@end
