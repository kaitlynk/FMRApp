//
//  SororityDetailsViewController.m
//  FMR
//
//  Created by Kaitlyn Kwan on 7/12/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "SororityDetailsViewController.h"
#import "MapViewController.h"

@interface SororityDetailsViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (strong, nonatomic) IBOutlet UILabel *detailsBG;
@property (strong, nonatomic) IBOutlet UIImageView *houseImage;

@end

@implementation SororityDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _nameLabel.text = _sorority[@"name"];
    _nameLabel.layer.cornerRadius = 15;
    _nameLabel.layer.borderWidth = 1.0;
    _nameLabel.layer.borderColor = [UIColor colorWithRed:0.298 green:0.302 blue:0.298 alpha:.8].CGColor;
    
    
    _letterLabel.text = _sorority[@"letters"];
    _thumbCrest.image = [UIImage imageNamed:_sorority[@"crestImg"]];
    
    _detailsBG.layer.cornerRadius = 15;
    _detailsBG.layer.borderWidth = 1.0;
    _detailsBG.layer.borderColor = [UIColor colorWithRed:0.545 green:0.553 blue:0.545 alpha:1].CGColor;
    
    NSArray *bgImgArr = [_sorority[@"crestImg"] componentsSeparatedByString:@"."];
    NSString *bgImgName = [NSString stringWithFormat:@"%@bg.png", [bgImgArr objectAtIndex:0]];
    NSString *houseImageName = [NSString stringWithFormat:@"%@house.png", [bgImgArr objectAtIndex:0]];
    
    [_addressLabel setTitle:_sorority[@"address"] forState:UIControlStateNormal];
    
    _houseImage.image = [UIImage imageNamed:houseImageName];
    UIColor *houseBorderColor = [UIColor colorWithRed:0.298 green:0.302 blue:0.298 alpha:.8];
    [ _houseImage.layer setBorderColor:houseBorderColor.CGColor];
    [ _houseImage.layer setBorderWidth:1.5];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:bgImgName]];
    //self.navigationItem.title = _detailsArray[1];
    
    NSString *detailsText = @"";
    
    for (NSString* key in _sorority) {
        NSString* value = [_sorority objectForKey:key];
        detailsText = [detailsText stringByAppendingString: [NSString stringWithFormat:@"%@: %@ \n", key, value] ];
    }
    
    _detailsText.text = detailsText;
    
    //[NSString stringWithFormat:@"Nickname: %@ \nNational Founding: %@ \nCornell Founding: %@ \nColors: %@ \nSymbol: %@ \nFlower: %@ \nPhilanthropy: %@",
    //    _sorority[@"nickname"], _sorority[@"national founding"], _sorority[@"cornell founding"],  _sorority[@"colors"], _sorority[@"symbol"], _sorority[@"flower"], _sorority[@"philanthropy"]];
    
    _detailsText.numberOfLines = 0;
    _detailsText.frame = CGRectMake(20,20,200,800);
    [_detailsText sizeToFit];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MapViewController *mapviewcontroller = [segue destinationViewController];
    
    mapviewcontroller.sorority = _sorority;
}


@end
