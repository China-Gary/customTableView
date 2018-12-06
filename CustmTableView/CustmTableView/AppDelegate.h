//
//  AppDelegate.h
//  CustmTableView
//
//  Created by 樊建鑫 on 2018/12/6.
//  Copyright © 2018 樊建鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

