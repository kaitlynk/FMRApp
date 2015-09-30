//
//  ScheduleTableViewController.h
//  FMR
//
//  Created by Kaitlyn Kwan on 8/7/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleTableViewController : UITableViewController
@property (nonatomic, strong) NSString *currDay;
@property (nonatomic, strong) NSDictionary *rounds;
@end
