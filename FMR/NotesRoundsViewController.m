//
//  NotesRoundsViewController.m
//  FMR
//
//  Created by Kwan, Kaitlyn on 10/1/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "NotesRoundsViewController.h"
#import "NotesRoundsTableViewCell.h"

@interface NotesRoundsViewController ()
@property NSMutableArray *schedule;
@property NSMutableDictionary *pickers;
@property NSMutableArray *sortedKeys;
@property NSMutableArray *tempSched;
@property NSMutableDictionary *roundInfo;
@property int currRow;
@property int isPickerVisible;
@property NSUserDefaults *defaults;
@end

@implementation NotesRoundsViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   _defaults = [NSUserDefaults standardUserDefaults];
    _schedule = [ _defaults objectForKey:@"schedule"];
    _tempSched = [_schedule mutableCopy];
    
    _sororityPicker.alpha = 0.0;
    _isPickerVisible = 0;
    _currRow = -1;
    
    _roundTitle.text = [_tempSched objectAtIndex:_roundID][@"name"];
    _sororities =[[_defaults objectForKey:@"sororities"] allKeys];
    _sororities = [_sororities sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    _sortedKeys = [ NSMutableArray arrayWithArray:_sororities];
    
    
    [ _sortedKeys insertObject:@"--" atIndex:0 ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of sections.
    return [[_tempSched objectAtIndex:_roundID][@"rounds"] count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        NotesRoundsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotesRoundsTableViewCell" forIndexPath:indexPath];
    
        int row = (int)[indexPath row];
        int roundNum = row;
        
        if ([ [_tempSched objectAtIndex:_roundID][@"rounds"][row][@"Event"] rangeOfString:@"Rho"].location == NSNotFound)
            cell.round.text = [_tempSched objectAtIndex:_roundID][@"rounds"][row][@"Event"];
        else cell.round.text = @"Meeting";
        
        if ([[_tempSched objectAtIndex:_roundID][@"name"]  isEqual: @"Open House II"])
            roundNum += 7;
        
        if ([ [ [ [_tempSched objectAtIndex:_roundID] objectForKey:@"rounds"][row] objectForKey:@"House"] length] > 0) {
                
            cell.roundLocation.text = [ [ [_tempSched objectAtIndex:_roundID] objectForKey:@"rounds"][row] objectForKey:@"House"];
        } else {
            cell.roundLocation.text = @"--";
        }

    return cell;
}

/*- (IBAction)saveSched:(id)sender {
    
    //_schedule = [_tempSched copy];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setValue:_tempSched forKey:@"schedule"];
    
    [defaults synchronize];
}*/

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_isPickerVisible) {
        [UIView animateWithDuration:0.3f animations:^{
            _sororityPicker.frame = CGRectOffset(_sororityPicker.frame, 0, 70);
            _sororityPicker.alpha = 0.0;
        }];
        _isPickerVisible = 0;
        _currRow = -1;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int row = (int)[indexPath row];
    
    if ([ [_tempSched objectAtIndex:_roundID][@"rounds"][row][@"Event"] rangeOfString:@"Round"].location != NSNotFound) {
        
        if ( [[_tempSched objectAtIndex:_roundID][@"rounds"][row][@"House"] length] > 0) {
            int sororityInd = [_sortedKeys indexOfObject:[_tempSched objectAtIndex:_roundID][@"rounds"][row][@"House"]];
            [_sororityPicker selectRow:sororityInd inComponent:0 animated:NO];
        } else {
            [_sororityPicker selectRow:0 inComponent:0 animated:NO];
        }
        
        if ( (_currRow == row && _isPickerVisible)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ) {
            [UIView animateWithDuration:0.3f animations:^{
                _sororityPicker.frame = CGRectOffset(_sororityPicker.frame, 0, 70);
                _sororityPicker.alpha = 0.0;
            }];
            _isPickerVisible = 0;
            _currRow = -1;
        } else if (!_isPickerVisible) {
            _isPickerVisible = 1;
            _currRow = row;
            _sororityPicker.alpha = 1.0;
            [UIView animateWithDuration:0.3f animations:^{
                _sororityPicker.frame = CGRectOffset(_sororityPicker.frame, 0, -70);
                
            }];
        } else {
            _currRow = row;
        }
    } else {
        if (_isPickerVisible) {
            [UIView animateWithDuration:0.3f animations:^{
                _sororityPicker.frame = CGRectOffset(_sororityPicker.frame, 0, 70);
                _sororityPicker.alpha = 0.0;
            }];
            _isPickerVisible = 0;
            _currRow = -1;

        }
    }

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
    
    NSMutableDictionary *tempDay = [[_tempSched objectAtIndex:_roundID] mutableCopy];
    NSMutableArray *tempRounds = [ [tempDay objectForKey:@"rounds"] mutableCopy];
    NSMutableDictionary *tempRound = [tempRounds[_currRow] mutableCopy];
    

    
    if (row != 0)
        tempRound[@"House"] = [_sortedKeys objectAtIndex:row];
    else
        tempRound[@"House"] = @"";
    
    //[[_tempSched objectAtIndex:_roundID] objectForKey:@"rounds"][_currRow][@"House"] = @"";
    
    tempRounds[_currRow] = tempRound;
    [tempDay setValue:tempRounds forKey:@"rounds"];
    _tempSched[_roundID] = tempDay;
    
    
    [_defaults setValue:_tempSched forKey:@"schedule"];
    [_defaults synchronize];
    
    [ _tableView reloadData ];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *text = (UILabel*)view;
    
    if (!text){
        text = [[UILabel alloc] init];
    }
    
    //Set text value
    [text setFont:[UIFont fontWithName:@"Optima" size:17.0]];
    text.text = [_sortedKeys objectAtIndex:row];
    text.textAlignment=NSTextAlignmentCenter;
    
    return text;
    
}



@end





