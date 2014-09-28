//
//  SororityTableViewCell.h
//  FMR
//
//  Created by Kaitlyn Kwan on 7/12/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SororityTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *letterLabel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbCrest;
@property (strong, nonatomic) IBOutlet UIImageView *thumbBG;
@end
