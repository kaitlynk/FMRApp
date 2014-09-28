//
//  NotesRoundsTableViewController.m
//  FMR
//
//  Created by Kwan, Kaitlyn on 9/24/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "NotesRoundsTableViewController.h"
#import "NotesRoundsTableViewCell.h"

@interface NotesRoundsTableViewController ()
@property NSMutableArray *schedule;
@property NSMutableDictionary *pickers;
@property NSMutableArray *sortedKeys;
@property NSMutableArray *tempSched;
@property NSMutableDictionary *roundInfo;
@property int i;
@end

@implementation NotesRoundsTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /*if ( [defaults objectForKey:@"schedule"] == nil )
        _schedule = [NSMutableDictionary new];
    else
        _schedule = [defaults objectForKey:@"schedule"];
    
    if ( [_schedule objectForKey:_roundInfo[@"name"]] == nil ) {
        
        [ _schedule setObject:[NSMutableDictionary new] forKey:_roundInfo[@"name"] ];
        
        NSArray *roundKeys = [_roundInfo[@"rounds"] allKeys];
        
        for (int i = 0; i < [roundKeys count]; i++) {
            [ _schedule[_roundInfo[@"name"]] setObject:@"" forKey:roundKeys[i] ];
        }
        
    }
    
    [defaults setObject:_schedule forKey:@"schedule"];
    
    [defaults synchronize];*/
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    _i = 1;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _schedule = [ defaults objectForKey:@"schedule"];
    _tempSched = [_schedule mutableCopy];
    _roundInfo = [[_schedule objectAtIndex:_roundID] mutableCopy];
    
    _pickers = [NSMutableDictionary new];
    _roundTitle.text = _roundInfo[@"name"];
    _sororities =[[defaults objectForKey:@"sororities"] allKeys];
    _sororities = [_sororities sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    _sortedKeys = [ NSMutableArray arrayWithArray:_sororities];
    
    
    [ _sortedKeys insertObject:@"--" atIndex:0 ];
    
    NSLog(@"blah %d", _i);
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_roundInfo[@"rounds"] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NotesRoundsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotesRoundsTableViewCell" forIndexPath:indexPath];
    
    int row = (int)[indexPath row];
    int roundNum = row;
    
    if ([ _roundInfo[@"rounds"][row][@"Event"] rangeOfString:@"Round"].location != NSNotFound) {
        cell.round.text = _roundInfo[@"rounds"][row][@"Event"];
    } else {
        cell.round.text = @"Meeting";
    }
    
    NSLog(@"%@ %@ %d", cell, _roundInfo[@"rounds"][row], row);
    
    if (_i == 1) {
        
        if ([_roundInfo[@"name"]  isEqual: @"Open House II"]) {
            roundNum += 7;
        }
        
        if ([ _roundInfo[@"rounds"][row][@"Event"] rangeOfString:@"Round"].location != NSNotFound) {
            NSLog(@"here %d", _i);
            UIPickerView *sororityPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(100, -55, 200, 50)];
            sororityPicker.delegate = self;
            sororityPicker.dataSource = self;
            NSString *p = [NSString stringWithFormat:@"%u",sororityPicker.hash];
            NSString *rN = [NSString stringWithFormat:@"%d", roundNum];
            
            if ( [_roundInfo[@"rounds"][row][@"House"] length] > 0) {
                int sororityInd = [_sortedKeys indexOfObject:_roundInfo[@"rounds"][row][@"House"]];
                [sororityPicker selectRow:sororityInd inComponent:0 animated:NO];
            }
            
            [ _pickers setObject:rN forKey:p];
            
            [cell.contentView addSubview:sororityPicker];
        }
        
        if (row == [_roundInfo[@"rounds"] count] - 1) {
            _i = 0;
        }
    } else {
        
    }
    
    return cell;
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _sororities.count + 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_sortedKeys objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *hash = [NSString stringWithFormat:@"%u",pickerView.hash ];
    int roundNum = [[_pickers objectForKey:hash] integerValue];
    
    NSLog(@"Round Num: %d", roundNum);
    
    NSMutableDictionary *tempRound = [ [[_tempSched objectAtIndex:_roundID] objectForKey:@"rounds"][roundNum] mutableCopy];
    
    NSMutableArray *tempRounds =[ [[_tempSched  objectAtIndex:_roundID] objectForKey:@"rounds"] mutableCopy ];
    
    NSMutableDictionary *tempDay = [[_tempSched objectAtIndex:_roundID] mutableCopy ];

    
    if ([ [_sortedKeys objectAtIndex:row] isEqualToString:@"--" ])
        [ tempRound setValue:@"" forKey:@"House" ];
    else
        [ tempRound setValue:[_sortedKeys objectAtIndex:row] forKey:@"House" ];
    
    
    tempRounds[roundNum] = tempRound;
    [ tempDay setValue:tempRounds forKey:@"rounds"];
    _tempSched[_roundID] = tempDay;

    
    //[[_tempSched objectAtIndex:_roundID] objectForKey:@"rounds"][roundNum][@"House"] = [_sortedKeys objectAtIndex:row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {

    UILabel *text = (UILabel*)view;
    
    if (!text){
        text = [[UILabel alloc] init];
    }
    
    //Set text value
    [text setFont:[UIFont fontWithName:@"Optima" size:15.0]];
    text.text = [_sortedKeys objectAtIndex:row];
    text.textAlignment=NSTextAlignmentCenter;
    
    return text;
    
}

- (IBAction)saveSched:(id)sender {
    
    _schedule = [_tempSched copy];
    
    NSLog(@"%@", _tempSched[_roundID]);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setValue:_schedule forKey:@"schedule"];
    
    [defaults synchronize];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
