//
//  NotesNotesTableViewCell.h
//  FMR
//
//  Created by Kwan, Kaitlyn on 10/4/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesNotesTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *sororityName;
@property (nonatomic, retain) IBOutlet UITextView *sororityNotes;
@end
