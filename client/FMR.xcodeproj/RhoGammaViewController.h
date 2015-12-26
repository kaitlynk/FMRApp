//
//  RhoGammaControllerViewController.h
//  
//
//  Created by Kaitlyn Kwan on 12/25/15.
//
//

#import <UIKit/UIKit.h>

@interface RhoGammaViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *number;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *location;
@property (strong, nonatomic) NSMutableDictionary *rhoGammaInfo;

@property (strong, nonatomic) NSUserDefaults *defaults;
@end
