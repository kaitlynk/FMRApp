//
//  ScheduleTableView.m
//  FMR
//
//  Created by Kwan, Kaitlyn on 9/6/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "ScheduleTableView.h"

@implementation ScheduleTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [ _rounds[_currDay] count ];
}

@end
