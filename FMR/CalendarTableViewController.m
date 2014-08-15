//
//  CalendarTableViewController.m
//  FMR
//
//  Created by Kaitlyn Kwan on 8/6/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "CalendarTableViewController.h"
#import "CalendarTableViewCell.h"
#import "ScheduleTableViewController.h"

@interface CalendarTableViewController ()

@end

@implementation CalendarTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _fullSched = @[ @{@"name" : @"Orientation",
                        @"date" : @"Wednesday, January 15",
                        @"meeting_info" : @"7:00 PM Statler Auditorium",
                        @"full_time" : @"",
                        @"attire" : @"Casual",
                        @"description" : @"During this meeting you will learn all about recruitment and will split up into your Rho Gamma groups. This is a mandatory meeting and you should attend. If you cannot be there expect a call from your Rho Gamma to go over the information shared. If you have not paid as yet, expect to pay at this meeting."
                        },
  
                    @{@"name" : @"Open House I",
                        @"date" : @"Thursday, January 16",
                        @"meeting_info" : @"Meeting at 9:00 AM",
                        @"full_time" : @"9:00 AM - 5:00 PM",
                        @"attire" : @"Casual",
                        @"description" : @"During this round you will visit all the chapters, and have one on one conversations with sisters. Many chapters share a story or two with you about their sisterhood. Chapters often share a non-alcoholic drink with you at this event. You can always ask for water as well. You have a scheduled break for lunch at which time you will eat on central or west campus. You will be provided lunch and this cost is already included in your recruitment fee."
                        },
  
                    @{@"name" : @"Open House II",
                       @"date" : @"Friday, January 17",
                       @"meeting_info" : @"Meeting at 9:00 AM",
                       @"full_time" : @"9:00 AM - 5:00 PM",
                       @"attire" : @"Casual",
                       @"description" : @"During this round you will visit all the chapters, and have one on one conversations with sisters. Many chapters share a story or two with you about their sisterhood. Chapters often share a non-alcoholic drink with you at this event. You can always ask for water as well. You have a scheduled break for lunch at which time you will eat on central or west campus. You will be provided lunch and this cost is already included in your recruitment fee."
                       },
                   
                    @{@"name" : @"House Tours",
                       @"date" : @"Saturday, January 18",
                       @"meeting_info" : @"Meeting at 8:00 AM",
                       @"full_time" : @"8:00 AM - 6:00 PM",
                       @"attire" : @"Snappy Casual",
                       @"description" : @"During this round you will get tours of the chapter houses, and you will be provided information on house finances and what it is like to live in a sorority house. You will go to a maximum of 8 chapters this day with one break.  Usually these tours are done in smaller groups. Feel free as always to ask questions. A non-alcoholic drink will be shared with you during this event. Again you can ask for water.  You have a scheduled break for lunch."
                       },
                   
                    @{@"name" : @"Skit and Philanthropy",
                       @"date" : @"Sunday, January 19",
                       @"meeting_info" : @"Meeting at 10:00 AM",
                       @"full_time" : @"10:00 AM - 7:00 PM",
                       @"attire" : @"Dressy",
                       @"description" : @"During this round you will learn the national and local organization's charity efforts. Each of the chapters host events to support their causes you will be able to learn more about these opportunities. You will also be entertained by the chapter's skit performance. From this event you will get a sense of the personality of each chapter through their skit. Again a non-alcoholic drink will be offered to you and you can opt for water. You will attend a maximum of 5 chapters this day."
                       },
                   
                    @{@"name" : @"Preference Round",
                           @"date" : @"Monday, January 20",
                           @"meeting_info" : @"Meeting at 11:30 AM",
                           @"full_time" : @"11:30 AM - 6:00 PM",
                           @"attire" : @"Semi-formal",
                           @"description" : @"During this round you will learn the national and local organization's charity efforts. Each of the chapters host events to support their causes you will be able to learn more about these opportunities. You will also be entertained by the chapter's skit performance. From this event you will get a sense of the personality of each chapter through their skit. Again a non-alcoholic drink will be offered to you and you can opt for water. You will attend a maximum of 5 chapters this day."
                           },
                   
                    @{@"name" : @"Bid Day",
                       @"date" : @"Tuesday, January 21",
                       @"meeting_info" : @"Receive Invitation 5:30 PM,",
                       @"full_time" : @"",
                       @"meeting_info2" : @"Events with Chapter 7:00 PM",
                       @"attire" : @"",
                       @"description" : @"During this round you will learn the national and local organization's charity efforts. Each of the chapters host events to support their causes you will be able to learn more about these opportunities. You will also be entertained by the chapter's skit performance. From this event you will get a sense of the personality of each chapter through their skit. Again a non-alcoholic drink will be offered to you and you can opt for water. You will attend a maximum of 5 chapters this day."
                       },
                   ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _fullSched.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CalendarTableViewCell";
    CalendarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    // NSArray *sortedKeys = [sororityKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    int row = (int)[indexPath row];
    
    cell.titleLabel.text = _fullSched[row][@"name"];
    cell.dateLabel.text = [NSString stringWithFormat:@"Date: %@", _fullSched[row][@"date"]];
    cell.timeLabel.text = [NSString stringWithFormat:@"Time: %@", _fullSched[row][@"meeting_info"]];
    if ( [_fullSched[row][@"attire"] length] > 0) {
        cell.attireLabel.text = [NSString stringWithFormat:@"Attire: %@", _fullSched[row][@"attire"]];
    } else {
        cell.attireLabel.text = [NSString stringWithFormat:@"\t%@", _fullSched[row][@"meeting_info2"]];
    }
    
    cell.bgImage.layer.cornerRadius = 15;
    cell.bgImage.layer.borderWidth = .25;
    cell.bgImage.layer.borderColor = [UIColor colorWithRed:0.545 green:0.553 blue:0.545 alpha:1].CGColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    ScheduleTableViewController *scheduleTableViewController = [segue destinationViewController];
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    int row = (int)[indexPath row];
    
    //NSLog(@"%@", scheduleTableViewController);
    
    scheduleTableViewController.currDay = _fullSched[row][@"name"];
    
}


@end
