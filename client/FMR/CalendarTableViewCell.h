//
//  CalendarTableViewCell.h
//  FMR
//
//  Created by Kaitlyn Kwan on 8/7/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) IBOutlet UILabel *attireLabel;
@property (nonatomic, strong) IBOutlet UIImageView *bgImage;

@end
