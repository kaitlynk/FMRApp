//
//  SororityDetailsViewController.h
//  FMR
//
//  Created by Kaitlyn Kwan on 7/12/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SororityDetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *letterLabel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbCrest;
@property (strong, nonatomic) IBOutlet UIButton *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailsText;

@property (strong, nonatomic) NSDictionary *sorority;

@end
