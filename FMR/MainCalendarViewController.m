//
//  MainCalendarViewController.m
//  FMR
//
//  Created by Kwan, Kaitlyn on 9/6/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "MainCalendarViewController.h"
#import "ScheduleTableView.h"
#import "ScheduleTableViewCell.h"

@interface MainCalendarViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *showSched;
@property (strong, nonatomic) NSMutableArray *ownSched;

@property (nonatomic, strong) NSString *currDay;
@property (nonatomic, strong) NSArray *rounds;
@property (nonatomic, strong) NSDictionary *schedule;
@end

@implementation MainCalendarViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /* @"During this meeting you will learn all about recruitment and will split up into your Rho Gamma groups.  This is a mandatory meeting and you should attend.  If you cannot be there expect a call from your Rho Gamma to go over the information shared.  If you have not paid as yet, expect to pay at this meeting." */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    _schedule = [defaults objectForKey:@"schedule"][_dateRow];
    _currDay = [_schedule objectForKey:@"name"];
    _rounds = [_schedule objectForKey:@"rounds"];
    _scheduleLabel.text = _currDay;
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int i = _showSched.selectedSegmentIndex;
    int count = 0;
    
    switch(i) {
        case 0:
            count = [ _rounds count ];
            break;
        case 1:
            _ownSched = [NSMutableArray array];
            for (int j = 0; j < [_rounds count]; j++) {
                if ( [ _rounds[j][@"House"] length] > 0 ) {
                    [ _ownSched addObject:_rounds[j] ];
                    count++;
                }
            }
            
            break;
            
    }
    return count;
    
}

- (IBAction)segmentChange:(id)sender {
    [ _tableView reloadData ];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    int i = _showSched.selectedSegmentIndex;
    
    static NSString *CellIdentifier = @"ScheduleTableViewCell";
    
    ScheduleTableViewCell *cell = (ScheduleTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    int row = (int)[indexPath row];

    switch (i) {
        case 0:
            cell.timeLabel.text = _rounds[row][@"Time"];
            cell.eventLabel.text = _rounds[row][@"Event"];
            if ( [ _rounds[row][@"House"] length ] > 0)
                cell.locationLabel.text = [NSString stringWithFormat:@"%@", _rounds[row][@"House"]];
            else
                cell.locationLabel.text = [NSString stringWithFormat:@"N/A"];
            break;
        case 1:
            cell.timeLabel.text = _ownSched[row][@"Time"];
            cell.eventLabel.text = _ownSched[row][@"Event"];
            cell.locationLabel.text = [NSString stringWithFormat:@"%@", _ownSched[row][@"House"]];
            break;
    }
    
    cell.bgImage.layer.cornerRadius = 15;
    cell.bgImage.layer.borderWidth = .25;
    cell.bgImage.layer.borderColor = [UIColor colorWithRed:0.545 green:0.553 blue:0.545 alpha:1].CGColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
    
}

/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}*/


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*_rounds = @{@"Orientation": @[
 @{ @"Time": @"6:30 PM",
 @"Event": @"Orientation",
 @"House": @"Bailey Hall", },
 @{ @"Time": @"8:15 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 ],
 
 @"Open House I": @[
 @{ @"Time": @"9:00 AM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 @{ @"Time": @"10:00 - 10:40 AM",
 @"Event": @"Round 1",
 @"House": @"", },
 @{ @"Time": @"11:00 - 11:40 AM",
 @"Event": @"Round 2",
 @"House": @"", },
 @{ @"Time": @"12:00 - 12:40 AM",
 @"Event": @"Round 3",
 @"House": @"", },
 @{ @"Time": @"12:40 - 1:50 PM",
 @"Event": @"Lunch",
 @"House": @"N/A", },
 @{ @"Time": @"1:50 - 2:30 PM",
 @"Event": @"Round 4",
 @"House": @"", },
 @{ @"Time": @"2:50 - 3:30 PM",
 @"Event": @"Round 5",
 @"House": @"", },
 @{ @"Time": @"3:50 - 4:30 PM",
 @"Event": @"Round 6",
 @"House": @"", },
 @{ @"Time": @"4:50 - 5:30 PM",
 @"Event": @"Round 7",
 @"House": @"", },
 @{ @"Time": @"6:00 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 ],
 
 @"Open House II": @[
 @{ @"Time": @"9:00 AM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 @{ @"Time": @"10:00 - 10:40 AM",
 @"Event": @"Round 8",
 @"House": @"", },
 @{ @"Time": @"11:00 - 11:40 AM",
 @"Event": @"Round 9",
 @"House": @"", },
 @{ @"Time": @"12:00 - 12:40 AM",
 @"Event": @"Round 10",
 @"House": @"", },
 @{ @"Time": @"12:40 - 1:50 PM",
 @"Event": @"Lunch",
 @"House": @"N/A", },
 @{ @"Time": @"1:50 - 2:30 PM",
 @"Event": @"Round 11",
 @"House": @"", },
 @{ @"Time": @"2:50 - 3:30 PM",
 @"Event": @"Round 12",
 @"House": @"", },
 @{ @"Time": @"3:50 - 4:30 PM",
 @"Event": @"Round 13",
 @"House": @"", },
 @{ @"Time": @"5:00 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 
 ],
 
 @"House Tours": @[
 @{ @"Time": @"8:00 AM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 @{ @"Time": @"9:00 - 9:35 AM",
 @"Event": @"Round 1",
 @"House": @"", },
 @{ @"Time": @"9:55 - 10:30 AM",
 @"Event": @"Round 2",
 @"House": @"", },
 @{ @"Time": @"10:50 - 11:25 AM",
 @"Event": @"Round 3",
 @"House": @"", },
 @{ @"Time": @"11:45 - 12:20 PM",
 @"Event": @"Round 4",
 @"House": @"", },
 @{ @"Time": @"12:20 - 1:55 PM",
 @"Event": @"Lunch",
 @"House": @"N/A", },
 @{ @"Time": @"2:15 - 2:50 PM",
 @"Event": @"Round 5",
 @"House": @"", },
 @{ @"Time": @"3:10 - 3:45 PM",
 @"Event": @"Round 6",
 @"House": @"", },
 @{ @"Time": @"4:05 - 4:40 PM",
 @"Event": @"Round 7",
 @"House": @"", },
 @{ @"Time": @"5:00 - 5:35 PM",
 @"Event": @"Round 8",
 @"House": @"", },
 @{ @"Time": @"5:55 - 6:30 PM",
 @"Event": @"Round 9",
 @"House": @"", },
 @{ @"Time": @"7:00 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 ],
 
 @"Skit and Philanthropy": @[
 @{ @"Time": @"9:00 AM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 @{ @"Time": @"10:00 - 10:45 AM",
 @"Event": @"Round 1",
 @"House": @"", },
 @{ @"Time": @"11:10 - 11:55 AM",
 @"Event": @"Round 2",
 @"House": @"", },
 @{ @"Time": @"12:20 - 1:05 PM",
 @"Event": @"Round 3",
 @"House": @"", },
 @{ @"Time": @"1:05 - 2:05 PM",
 @"Event": @"Lunch",
 @"House": @"N/A", },
 @{ @"Time": @"2:05 - 2:50 PM",
 @"Event": @"Round 4",
 @"House": @" ", },
 @{ @"Time": @"3:15 - 4:00 PM",
 @"Event": @"Round 5",
 @"House": @"", },
 @{ @"Time": @"4:25 - 5:10 PM",
 @"Event": @"Round 6",
 @"House": @"", },
 @{ @"Time": @"5:35 - 6:20 PM",
 @"Event": @"Round 7",
 @"House": @"", },
 @{ @"Time": @"6:35 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 ],
 
 @"Preference Round": @[
 @{ @"Time": @"11:30 AM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 @{ @"Time": @"12:30 - 1:40 PM",
 @"Event": @"Round 1",
 @"House": @"", },
 @{ @"Time": @"2:05 - 3:15 PM",
 @"Event": @"Round 2",
 @"House": @"", },
 @{ @"Time": @"3:40 - 4:50 PM",
 @"Event": @"Round 3",
 @"House": @"", },
 @{ @"Time": @"5:20 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 ],
 
 @"Bid Day":  @[
 @{ @"Time": @"5:30 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 @{ @"Time": @"7:00 PM",
 @"Event": @"Bid Night!",
 @"House": @"TBA", },
 ]
 };*/

@end
