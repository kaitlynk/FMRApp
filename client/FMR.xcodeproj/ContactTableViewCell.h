//
//  ContactTableViewCell.h
//  
//
//  Created by Kaitlyn Kwan on 12/25/15.
//
//

#import <UIKit/UIKit.h>

@interface ContactTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextView *name;
@property (strong, nonatomic) IBOutlet UITextView *position;
@property (strong, nonatomic) IBOutlet UITextView *number;
@property (strong, nonatomic) IBOutlet UITextView *email;

@end
