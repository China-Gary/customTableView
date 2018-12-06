//
//  ViewController.m
//  CustmTableView
//
//  Created by 樊建鑫 on 2018/12/6.
//  Copyright © 2018 樊建鑫. All rights reserved.
//

#import "ViewController.h"

#import "LYTableViewInfo.h"

@interface ViewController ()<UITextFieldDelegate>{
    LYTableViewInfo *_tableViewInfo;
    UITextField*_beishuTF;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     [self creatTableView];
    [self reloadTableView];
}
#pragma mark - Creat View
- (void)creatTableView{
    _tableViewInfo = [[LYTableViewInfo alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-20) style:UITableViewStylePlain];
    [self.view addSubview:[_tableViewInfo getTableView]];
}
-(void)reloadTableView {
    //清除所有section（按情况调用）
    [_tableViewInfo clearAllSection];
    
    //添加section
    [self addsection1];
    [self addsection2];
    [self addsection3];
    [self addsection4];
    //刷新tableView
    [[_tableViewInfo getTableView] reloadData];
}
#pragma mark -创建有数据的view1/section1
-(void)addsection1 {
    LYTableViewCellInfo *profileCell = [LYTableViewCellInfo cellForMakeSel:@selector(addCellview:cellInfo:) makeTarget:self actionSel:@selector(didsection1:indexPath:) actionTarget:self height:70 userInfo:@{@"pic" : @"123", @"title":@"广汽传祺GM8木板脚垫木质商务车传奇gm8起坐汽车实木脚店改装",@"color":@"颜色分类:传奇GM8七座+后备箱垫",@"time":@"发货时间:付款后5天内",@"moeny":@"2280"} accessoryType:UITableViewCellAccessoryNone];
    LYTableViewSectionInfo *profileSection = [LYTableViewSectionInfo sectionInfoDefaut];
    profileSection.fHeaderHeight = 0;
    [profileSection addCell:profileCell];
    [_tableViewInfo addSection:profileSection];
}


- (void)addCellview:(LYTableViewCell *)cell cellInfo:(LYTableViewCellInfo *)cellInfo{
    NSDictionary *userInfo = cellInfo.userInfo;
    cell.backgroundColor = [UIColor lightGrayColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:userInfo[@"pic"]]];
    imageView.frame = CGRectMake(0, 0, 50, 50);
    [cell.contentView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] init];
    label.text =  userInfo[@"title"];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor blackColor];
    label.frame = CGRectMake(60, 0, cell.frame.size.width-70, 30);
    [cell.contentView addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text =  userInfo[@"color"];
    label1.font = [UIFont systemFontOfSize:13];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.textColor = [UIColor grayColor];
    label1.frame = CGRectMake(60, 30, cell.frame.size.width-70, 20);
    [cell.contentView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text =  userInfo[@"moeny"];
    label2.font = [UIFont systemFontOfSize:13];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.textColor = [UIColor yellowColor];
    label2.frame = CGRectMake(60, 50, cell.frame.size.width-70, 20);
    [cell.contentView addSubview:label2];
}
#pragma mark -创建没有数据,没有头视图,尾视图,带按钮的的view2/section2
-(void)addsection2 {
    LYTableViewCellInfo *profileCell = [LYTableViewCellInfo cellForMakeSel:@selector(addCellview2:cellInfo:) makeTarget:self actionSel:nil actionTarget:self height:40 userInfo:nil accessoryType:UITableViewCellAccessoryNone];
    LYTableViewSectionInfo *profileSection = [LYTableViewSectionInfo sectionInfoDefaut];
    profileSection.fHeaderHeight = 0;
    [profileSection addCell:profileCell];
    [_tableViewInfo addSection:profileSection];
}
- (void)addCellview2:(LYTableViewCell *)cell cellInfo:(LYTableViewCellInfo *)cellInfo{
    cell.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] init];
    label.text =  @"购买数量";
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor blackColor];
    label.frame = CGRectMake(10, 0, 100, 40);
    [cell.contentView addSubview:label];
    
    UIButton *jiahao = [UIButton buttonWithType:UIButtonTypeCustom];
    [jiahao setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    jiahao.adjustsImageWhenHighlighted = NO;
    [jiahao addTarget:self action:@selector(jiahaoBottom) forControlEvents:UIControlEventTouchUpInside];
    jiahao.frame = CGRectMake(cell.frame.size.width-10-30-30-80, 5, 30, 30);
    [cell.contentView addSubview:jiahao];
    
    _beishuTF = [[UITextField alloc] init];
    _beishuTF.borderStyle = UITextBorderStyleNone;
    _beishuTF.backgroundColor = [UIColor whiteColor];
    _beishuTF.font = [UIFont systemFontOfSize:14];
    _beishuTF.delegate = self;
    _beishuTF.text = @"1";
    _beishuTF.clearsOnBeginEditing = YES;
    _beishuTF.textColor = [UIColor blackColor];
    _beishuTF.textAlignment = NSTextAlignmentCenter;
    _beishuTF.autocorrectionType = UITextAutocorrectionTypeNo;
    _beishuTF.frame = CGRectMake(cell.frame.size.width-10-30-80, 0, 80, 40);
    _beishuTF.adjustsFontSizeToFitWidth = YES;
    _beishuTF.minimumFontSize = 10;
    _beishuTF.keyboardType = UIKeyboardTypeNumberPad;
    [cell.contentView addSubview:_beishuTF];
    
    UIButton *jianhao = [UIButton buttonWithType:UIButtonTypeCustom];
    [jianhao setImage:[UIImage imageNamed:@"减号-3"] forState:UIControlStateNormal];
    [jianhao addTarget:self action:@selector(jianhaoBottom) forControlEvents:UIControlEventTouchUpInside];
    jianhao.adjustsImageWhenHighlighted = NO;
    jianhao.frame = CGRectMake(cell.frame.size.width-10-30, 5, 30, 30);
    [cell.contentView addSubview:jianhao];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, cell.frame.size.height-0.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    view.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:view];
}

-(void)jiahaoBottom {
    _beishuTF.text = [NSString stringWithFormat:@"%d",_beishuTF.text.intValue + 1];
}
-(void)jianhaoBottom {
    _beishuTF.text = [NSString stringWithFormat:@"%d",_beishuTF.text.intValue - 1];
}
#pragma mark -创建没有数据,有头视图的view3/section3
-(void)addsection3 {
    LYTableViewCellInfo *profileCell = [LYTableViewCellInfo cellForMakeSel:@selector(addCellview3:cellInfo:) makeTarget:self actionSel:nil actionTarget:self height:40 userInfo:nil accessoryType:UITableViewCellAccessoryNone];
    
    UILabel *lable = [[UILabel alloc] init];
    lable.backgroundColor = [UIColor redColor];
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:16];
    lable.text = @"我是公益宝贝的头数图";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
    
    LYTableViewSectionInfo *profileSection = [LYTableViewSectionInfo sectionInfoHeaderWithView:lable];
    profileSection.fHeaderHeight = 30;
    [profileSection addCell:profileCell];
    [_tableViewInfo addSection:profileSection];
}
- (void)addCellview3:(LYTableViewCell *)cell cellInfo:(LYTableViewCellInfo *)cellInfo{
    UILabel *label = [[UILabel alloc] init];
    label.text =  @"公益宝贝";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor blackColor];
    label.frame = CGRectMake(10, 0, 100, 40);
    [cell.contentView addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text =  @"成交后卖家将捐赠0.01元给b公益宝贝";
    label1.font = [UIFont systemFontOfSize:14];
    label1.textAlignment = NSTextAlignmentRight;
    label1.textColor = [UIColor blackColor];
    label1.frame = CGRectMake(110, 0, [UIScreen mainScreen].bounds.size.width-110-10, 40);
    [cell.contentView addSubview:label1];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, cell.frame.size.height-0.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    view.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:view];
}

#pragma mark -创建没有数据,有头视图,尾视图的view4/section4
-(void)addsection4 {
    LYTableViewCellInfo *profileCell = [LYTableViewCellInfo cellForMakeSel:@selector(addCellview4:cellInfo:) makeTarget:self actionSel:nil actionTarget:self height:40 userInfo:nil accessoryType:UITableViewCellAccessoryNone];
    
    UILabel *lable = [[UILabel alloc] init];
    lable.backgroundColor = [UIColor redColor];
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:16];
    lable.text = @"我配送方式的头数图";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
    
    UILabel *lable1 = [[UILabel alloc] init];
    lable1.backgroundColor = [UIColor greenColor];
    lable1.textColor = [UIColor whiteColor];
    lable1.font = [UIFont systemFontOfSize:16];
    lable1.text = @"我配送方式的尾视图数图";
    lable1.textAlignment = NSTextAlignmentCenter;
    lable1.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
    
    
    LYTableViewSectionInfo *profileSection = [LYTableViewSectionInfo sectionInfoHeaderWithView:lable footerWithView:lable1];
    profileSection.fHeaderHeight = 30;
    profileSection.fFooterHeight = 40;
    [profileSection addCell:profileCell];
    [_tableViewInfo addSection:profileSection];
}

- (void)addCellview4:(LYTableViewCell *)cell cellInfo:(LYTableViewCellInfo *)cellInfo{
    UILabel *label = [[UILabel alloc] init];
    label.text =  @"配送方式";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor blackColor];
    label.frame = CGRectMake(10, 0, 100, 40);
    [cell.contentView addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text =  @"快递免邮";
    label1.font = [UIFont systemFontOfSize:14];
    label1.textAlignment = NSTextAlignmentRight;
    label1.textColor = [UIColor blackColor];
    label1.frame = CGRectMake(110, 0, [UIScreen mainScreen].bounds.size.width-110-10, 40);
    [cell.contentView addSubview:label1];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, cell.frame.size.height-0.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    view.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:view];
}

#pragma mark - Event
- (void)didsection1:(LYTableViewCellInfo *)cellInfo indexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了section1");
}
@end
