
使用范围:当固定格式的tableView或者每个cell的控件差别很大的时候使用起来很方便
比如图中这种tableView,用我这种写就很方便

![点击协议、税务和银行业务.png](https://github.com/China-Gary/customTableView/blob/master/CustmTableView/image.png)

使用很简单
```
//自定义数据的view   可以看LYTableViewUserInfo这个文件里面,,有各种的方法
    LYTableViewCellInfo *profileCell = [LYTableViewCellInfo cellForMakeSel:@selector(addCellview:cellInfo:) makeTarget:self actionSel:@selector(didsection1:indexPath:) actionTarget:self height:70 userInfo:@{@"pic" : @"123", @"title":@"广汽传祺GM8木板脚垫木质商务车传奇gm8起坐汽车实木脚店改装",@"color":@"颜色分类:传奇GM8七座+后备箱垫",@"time":@"发货时间:付款后5天内",@"moeny":@"2280"} accessoryType:UITableViewCellAccessoryNone];
    LYTableViewSectionInfo *profileSection = [LYTableViewSectionInfo sectionInfoDefaut];
    profileSection.fHeaderHeight = 0;
    [profileSection addCell:profileCell];
    [_tableViewInfo addSection:profileSection];
    
    
    - (void)addCellview:(LYTableViewCell *)cell cellInfo:(LYTableViewCellInfo *)cellInfo{
    //在这里写添加的view
    NSDictionary *userInfo = cellInfo.userInfo;
    cell.backgroundColor = [UIColor lightGrayColor];
    }
```

