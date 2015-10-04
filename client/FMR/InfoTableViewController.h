//
//  InfoTableViewController.h
//  FMR
//
//  Created by Kaitlyn Kwan on 8/22/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoTableViewController : UITableViewController
@property (nonatomic, strong) NSArray *infoCategories;
@property (nonatomic, strong) NSDictionary *infoDescriptions;
@property (nonatomic, strong) NSDictionary *infoDetails;
@end
