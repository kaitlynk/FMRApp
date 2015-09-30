//
//  ScheduleTableView.h
//  FMR
//
//  Created by Kwan, Kaitlyn on 9/6/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleTableView : UITableView
@property (nonatomic, strong) NSDictionary *rounds; 
@property (nonatomic, strong) NSString *currDay;
@end
