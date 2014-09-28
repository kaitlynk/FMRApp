//
//  ScheduleTableViewCell.h
//  FMR
//
//  Created by Kaitlyn Kwan on 8/11/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UILabel *eventLabel;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@end
