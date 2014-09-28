//
//  MainCalendarViewController.h
//  FMR
//
//  Created by Kwan, Kaitlyn on 9/6/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCalendarViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UILabel *scheduleLabel;
@property int dateRow;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@end
