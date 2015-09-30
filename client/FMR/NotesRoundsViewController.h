//
//  NotesRoundsViewController.h
//  FMR
//
//  Created by Kwan, Kaitlyn on 10/1/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesRoundsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *sororities;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) IBOutlet UILabel *roundTitle;
@property int roundID;
@property (strong, nonatomic) IBOutlet UIPickerView *sororityPicker;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
