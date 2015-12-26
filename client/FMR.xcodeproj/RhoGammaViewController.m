//
//  RhoGammaControllerViewController.m
//  
//
//  Created by Kaitlyn Kwan on 12/25/15.
//
//

#import "RhoGammaViewController.h"

@interface RhoGammaViewController ()
@end

@implementation RhoGammaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _defaults = [NSUserDefaults standardUserDefaults];
    _rhoGammaInfo = [_defaults objectForKey:@"rhoGammaInfo"];
    
    if (_rhoGammaInfo.count > 0) {
        NSLog(@"%@", _rhoGammaInfo);
        for (NSString *i in _rhoGammaInfo) {
            if (![i isEqualToString:@"position"]) {
                UITextField *currLabel = [self valueForKey:i];
                currLabel.text = [_rhoGammaInfo objectForKey:i];
            }
        }
    } else {
        _rhoGammaInfo = [@{@"name":@"", @"number":@"", @"email":@"", @"location": @"", @"position": @"Rho Gamma"} mutableCopy];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldChanged:(id)sender forEvent:(UIEvent *)event {
    
    [_rhoGammaInfo setValue:_name.text forKey:@"name"];
    [_rhoGammaInfo setValue:_number.text forKey:@"number"];
    [_rhoGammaInfo setValue:_email.text forKey:@"email"];
    [_rhoGammaInfo setValue:_location.text forKey:@"location"];
    [_rhoGammaInfo setValue:@"Rho Gamma" forKey:@"position"];
    
    [_defaults setObject:_rhoGammaInfo forKey:@"rhoGammaInfo"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
