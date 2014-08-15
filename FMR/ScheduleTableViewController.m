//
//  ScheduleTableViewController.m
//  FMR
//
//  Created by Kaitlyn Kwan on 8/7/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "ScheduleTableViewController.h"
#import "CalendarTableViewCell.h"
#import "ScheduleTableViewCell.h"

@interface ScheduleTableViewController ()

@end

@implementation ScheduleTableViewController

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
    
    _scheduleLabel.text = _currDay;
    
    _rounds = @{@"Orientation": @[@"During this meeting you will learn all about recruitment and will split up into your Rho Gamma groups.  This is a mandatory meeting and you should attend.  If you cannot be there expect a call from your Rho Gamma to go over the information shared.  If you have not paid as yet, expect to pay at this meeting.",],

                @"Open House I": @[
                    @{ @"Time": @"9:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"10:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"11:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"12:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"1:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"2:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"3:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"4:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"5:00 PM",
                       @"House": @"", },
                    ],
                
                @"Open House II": @[
                    @{ @"Time": @"9:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"10:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"11:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"12:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"1:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"2:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"3:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"4:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"5:00 PM",
                       @"House": @"", },
                    ],
                
                @"House Tours": @[
                    @{ @"Time": @"8:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"9:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"10:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"11:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"12:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"1:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"2:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"3:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"4:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"5:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"6:00 PM",
                       @"House": @"", },
                    ],
                
                @"Skit and Philanthropy": @[
                    @{ @"Time": @"10:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"11:00 AM",
                       @"House": @"", },
                    @{ @"Time": @"12:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"1:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"2:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"3:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"4:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"5:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"6:00 PM",
                       @"House": @"", },
                    @{ @"Time": @"7:00 PM",
                       @"House": @"", },
                    ],
                
                @"Preference Round": @[
                        @{ @"Time": @"11:30 AM",
                           @"House": @"", },
                        @{ @"Time": @"12:00 PM",
                           @"House": @"", },
                        @{ @"Time": @"1:00 PM",
                           @"House": @"", },
                        @{ @"Time": @"2:00 PM",
                           @"House": @"", },
                        @{ @"Time": @"3:00 PM",
                           @"House": @"", },
                        @{ @"Time": @"4:00 PM",
                           @"House": @"", },
                        @{ @"Time": @"5:00 PM",
                           @"House": @"", },
                        @{ @"Time": @"6:00 PM",
                           @"House": @"", },
                        ],
                
                @"Bid Day": @[@"Bid day is a celebration for new members with their chapter.  Women will be directed to meet the chapter at a location on campus.  The chapter will then escort the new members to their house for fun and activities.  Often chapters spend some time getting to know new members.  This may be done with games or activities.  Some chapters also have an activity.  Your chapter may include more information about Bid Day in your bid card envelop.",],
                };
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
    return [ _rounds[_currDay] count ];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ScheduleTableViewCell";
    ScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    int row = (int)[indexPath row];
    
    if ([ _rounds[_currDay] count ] == 1) {
        cell.timeLabel.text = _rounds[_currDay][row];
        cell.locationLabel.text = @"";
    } else {
        cell.timeLabel.text = _rounds[_currDay][row][@"Time"];
        cell.locationLabel.text = [NSString stringWithFormat:@"Location: %@", _rounds[_currDay][row][@"House"]];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
