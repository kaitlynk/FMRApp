//
//  NotesRoundsTableViewController.h
//  FMR
//
//  Created by Kwan, Kaitlyn on 9/24/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesRoundsTableViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) NSArray *sororities;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) IBOutlet UILabel *roundTitle;
@property int roundID;
@end
