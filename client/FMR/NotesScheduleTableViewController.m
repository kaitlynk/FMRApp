//
//  NotesScheduleTableViewController.m
//  FMR
//
//  Created by Kwan, Kaitlyn on 9/18/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "NotesScheduleTableViewController.h"
#import "NotesScheduleTableViewCell.h"
#import "NotesRoundsViewController.h"

@interface NotesScheduleTableViewController ()
@property (nonatomic, strong) NSArray *schedule;

@end

@implementation NotesScheduleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (IBAction)reset:(id)sender {
    NSArray *resetSchedule = @[@{@"name" : @"Orientation",
                    @"date": @"Wednesday, January 14",
                    @"meeting_info" : @"6:30 PM Bailey Hall",
                    @"full_time" : @"",
                    @"attire" : @"Casual",
                    @"description" : @"During this meeting you will learn all about recruitment and will split up into your Rho Gamma groups. This is a mandatory meeting and you should attend. If you cannot be there expect a call from your Rho Gamma to go over the information shared. If you have not paid as yet, expect to pay at this meeting.",
                    @"rounds": @[@{ @"Time": @"6:30 PM",
                                    @"Event": @"Orientation",
                                    @"House": @"Bailey Hall",
                                    },
                                 @{ @"Time": @"8:15 PM",
                                    @"Event": @"Rho Gamma Meeting",
                                    @"House": @" ",
                                    },
                                 ]
                    },
                  
                  @{@"name" : @"Open House I",
                    @"date" : @"Thursday, January 15",
                    @"meeting_info" : @"Meeting at 9:00 AM",
                    @"full_time" : @"9:00 AM - 5:30 PM",
                    @"attire" : @"Casual",
                    @"description" : @"During this round you will visit all the chapters, and have one on one conversations with sisters. Many chapters share a story or two with you about their sisterhood. Chapters often share a non-alcoholic drink with you at this event. You can always ask for water as well. You have a scheduled break for lunch at which time you will eat on central or west campus. You will be provided lunch and this cost is already included in your recruitment fee.",
                    @"rounds" : @[@{ @"Time": @"9:00 AM",
                                     @"Event": @"Rho Gamma Meeting",
                                     @"House": @" ",
                                     },
                                  @{ @"Time": @"10:00 - 10:40 AM",
                                     @"Event": @"Round 1",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"11:00 - 11:40 AM",
                                     @"Event": @"Round 2",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"12:00 - 12:40 AM",
                                     @"Event": @"Round 3",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"12:40 - 1:50 PM",
                                     @"Event": @"Lunch",
                                     @"House": @" ",
                                     },
                                  @{ @"Time": @"1:50 - 2:30 PM",
                                     @"Event": @"Round 4",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"2:50 - 3:30 PM",
                                     @"Event": @"Round 5",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"3:50 - 4:30 PM",
                                     @"Event": @"Round 6",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"4:50 - 5:30 PM",
                                     @"Event": @"Round 7",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"6:00 PM",
                                     @"Event": @"Rho Gamma Meeting",
                                     @"House": @" ",
                                     }
                                  ]
                    },
                  
                  @{@"name" : @"Open House II",
                    @"date" : @"Friday, January 16",
                    @"meeting_info" : @"Meeting at 9:00 AM",
                    @"full_time" : @"9:00 AM - 4:30 PM",
                    @"attire" : @"Casual",
                    @"description" : @"During this round you will visit all the chapters, and have one on one conversations with sisters. Many chapters share a story or two with you about their sisterhood. Chapters often share a non-alcoholic drink with you at this event. You can always ask for water as well. You have a scheduled break for lunch at which time you will eat on central or west campus. You will be provided lunch and this cost is already included in your recruitment fee.",
                    @"rounds" : @[@{ @"Time": @"9:00 AM",
                                     @"Event": @"Rho Gamma Meeting",
                                     @"House": @" ",
                                     },
                                  @{ @"Time": @"10:00 - 10:40 AM",
                                     @"Event": @"Round 8",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"11:00 - 11:40 AM",
                                     @"Event": @"Round 9",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"12:00 - 12:40 AM",
                                     @"Event": @"Round 10",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"12:40 - 1:50 PM",
                                     @"Event": @"Lunch",
                                     @"House": @" ",
                                     },
                                  @{ @"Time": @"1:50 - 2:30 PM",
                                     @"Event": @"Round 11",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"2:50 - 3:30 PM",
                                     @"Event": @"Round 12",
                                     @"House": @"", },
                                  @{ @"Time": @"3:50 - 4:30 PM",
                                     @"Event": @"Round 13",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"5:00 PM",
                                     @"Event": @"Rho Gamma Meeting",
                                     @"House": @" ", }
                                  ]
                    },
                  
                  @{@"name" : @"House Tours",
                    @"date" : @"Saturday, January 17",
                    @"meeting_info" : @"Meeting at 8:00 AM",
                    @"full_time" : @"8:00 AM - 6:30 PM",
                    @"attire" : @"Snappy Casual",
                    @"description" : @"During this round you will get tours of the chapter houses, and you will be provided information on house finances and what it is like to live in a sorority house. You will go to a maximum of 8 chapters this day with one break.  Usually these tours are done in smaller groups. Feel free as always to ask questions. A non-alcoholic drink will be shared with you during this event. Again you can ask for water.  You have a scheduled break for lunch.",
                    @"rounds" : @[ @{@"Time": @"8:00 AM",
                                     @"Event": @"Rho Gamma Meeting",
                                     @"House": @" ",
                                     },
                                   @{ @"Time": @"9:00 - 9:35 AM",
                                      @"Event": @"Round 1",
                                      @"House": @"",
                                      },
                                   @{ @"Time": @"9:55 - 10:30 AM",
                                      @"Event": @"Round 2",
                                      @"House": @"",
                                      },
                                   @{ @"Time": @"10:50 - 11:25 AM",
                                      @"Event": @"Round 3",
                                      @"House": @"",
                                      },
                                   @{ @"Time": @"11:45 - 12:20 PM",
                                      @"Event": @"Round 4",
                                      @"House": @"",
                                      },
                                   @{ @"Time": @"12:20 - 1:20 PM",
                                      @"Event": @"Lunch",
                                      @"House": @" ",
                                      },
                                   @{ @"Time": @"1:20 - 2:50 PM",
                                      @"Event": @"Round 5",
                                      @"House": @"",
                                      },
                                   @{ @"Time": @"2:15 - 2:50 PM",
                                      @"Event": @"Round 5",
                                      @"House": @"",
                                      },
                                   @{ @"Time": @"3:10 - 3:45 PM",
                                      @"Event": @"Round 6",
                                      @"House": @"",
                                      },
                                   @{ @"Time": @"4:05 - 4:40 PM",
                                      @"Event": @"Round 7",
                                      @"House": @"",
                                      },
                                   @{ @"Time": @"5:00 - 5:35 PM",
                                      @"Event": @"Round 8",
                                      @"House": @"",
                                      },
                                   @{ @"Time": @"5:55 - 6:30 PM",
                                      @"Event": @"Round 9",
                                      @"House": @"",
                                      },
                                   @{ @"Time": @"7:00 PM",
                                      @"Event": @"Rho Gamma Meeting",
                                      @"House": @" ",
                                      },
                                   ]
                    },
                  
                  @{@"name" : @"Skit and Philanthropy",
                    @"date" : @"Sunday, January 18",
                    @"meeting_info" : @"Meeting at 9:00 AM",
                    @"full_time" : @"9:00 AM - 6:20 PM",
                    @"attire" : @"Dressy",
                    @"description" : @"During this round you will learn the national and local organization's charity efforts. Each of the chapters host events to support their causes you will be able to learn more about these opportunities. You will also be entertained by the chapter's skit performance. From this event you will get a sense of the personality of each chapter through their skit. Again a non-alcoholic drink will be offered to you and you can opt for water. You will attend a maximum of 5 chapters this day.",
                    @"rounds" : @[@{ @"Time": @"9:00 AM",
                                     @"Event": @"Rho Gamma Meeting",
                                     @"House": @" ",
                                     },
                                  @{ @"Time": @"10:00 - 10:45 AM",
                                     @"Event": @"Round 1",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"11:10 - 11:55 AM",
                                     @"Event": @"Round 2",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"12:20 - 1:05 PM",
                                     @"Event": @"Round 3",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"1:05 - 2:05 PM",
                                     @"Event": @"Lunch",
                                     @"House": @" ",
                                     },
                                  @{ @"Time": @"2:05 - 2:50 PM",
                                     @"Event": @"Round 4",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"3:15 - 4:00 PM",
                                     @"Event": @"Round 5",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"4:25 - 5:10 PM",
                                     @"Event": @"Round 6",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"5:35 - 6:20 PM",
                                     @"Event": @"Round 7",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"6:35 PM",
                                     @"Event": @"Rho Gamma Meeting",
                                     @"House": @" ",
                                     },
                                  ]
                    },
                  
                  @{@"name" : @"Final Round",
                    @"date" : @"Monday, January 19",
                    @"meeting_info" : @"Meeting at 11:30 AM",
                    @"full_time" : @"11:30 AM - 4:50 PM",
                    @"attire" : @"Semi-formal",
                    @"description" : @"During this round you will learn the national and local organization's charity efforts. Each of the chapters host events to support their causes you will be able to learn more about these opportunities. You will also be entertained by the chapter's skit performance. From this event you will get a sense of the personality of each chapter through their skit. Again a non-alcoholic drink will be offered to you and you can opt for water. You will attend a maximum of 5 chapters this day.",
                    @"rounds" : @[@{ @"Time": @"11:30 AM",
                                     @"Event": @"Rho Gamma Meeting",
                                     @"House": @" ",
                                     },
                                  @{ @"Time": @"12:30 - 1:40 PM",
                                     @"Event": @"Round 1",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"2:05 - 3:15 PM",
                                     @"Event": @"Round 2",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"3:40 - 4:50 PM",
                                     @"Event": @"Round 3",
                                     @"House": @"",
                                     },
                                  @{ @"Time": @"5:20 PM",
                                     @"Event": @"Rho Gamma Meeting",
                                     @"House": @" ", },
                                  ]
                    },
                  
                  @{@"name" : @"Bid Night",
                    @"date" : @"Tuesday, January 20",
                    @"meeting_info" : @"Meeting at 5:30 PM,",
                    @"full_time" : @"",
                    @"attire" : @"Casual",
                    @"description" : @"During this round you will learn the national and local organization's charity efforts. Each of the chapters host events to support their causes you will be able to learn more about these opportunities. You will also be entertained by the chapter's skit performance. From this event you will get a sense of the personality of each chapter through their skit. Again a non-alcoholic drink will be offered to you and you can opt for water. You will attend a maximum of 5 chapters this day.",
                    @"rounds" : @[@{ @"Time": @"5:30 PM",
                                     @"Event": @"Rho Gamma Meeting",
                                     @"House": @" ",
                                     },
                                  @{ @"Time": @"7:00 PM",
                                     @"Event": @"Bid Night",
                                     @"House": @" ",
                                     },
                                  ]
                    },
                  ];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:resetSchedule forKey:@"schedule"];
    [defaults synchronize];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _schedule = [defaults objectForKey:@"schedule"];
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _schedule.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"NotesScheduleTableViewCell";
    NotesScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    int row = (int)[indexPath row];
    
    cell.title.text = [_schedule objectAtIndex:row][@"name"];
    cell.date.text = [_schedule objectAtIndex:row][@"date"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NotesRoundsViewController *nextController = [segue destinationViewController ];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    int row = [indexPath row];
    nextController.roundID = row;
}


@end