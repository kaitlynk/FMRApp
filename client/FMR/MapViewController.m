//
//  MapViewController.m
//  FMR
//
//  Created by Kaitlyn Kwan on 7/26/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "MapViewController.h"
#import "MapPin.h"

@implementation MapViewController

@synthesize mapview;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0} };
    
    _coordinates = [_sorority[@"coordinates"] componentsSeparatedByString:@", "];
    region.center.latitude = [_coordinates[0] doubleValue];
    region.center.longitude = [_coordinates[1] doubleValue];
    region.span.longitudeDelta = 0.005f;
    region.span.latitudeDelta = 0.005f;
    
    [mapview setRegion:region animated:YES];
    
    MapPin *ann = [[MapPin alloc] init];
    ann.title = [NSString stringWithFormat:@"%@ (%@)", _sorority[@"name"], _sorority[@"letters"]];
    ann.subtitle = [NSString stringWithFormat:@"%@, Ithaca, NY 14853", _sorority[@"address"]];
    ann.coordinate = region.center;
    [mapview addAnnotation:ann];
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)SetMap:(id)sender {
    
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            mapview.mapType = MKMapTypeStandard;
            break;
        
        case 1:
            mapview.mapType = MKMapTypeSatellite;
            break;
            
        case 2:
            mapview.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
    
}

-(IBAction)GetLocation:(id)sender {
    mapview.showsUserLocation = YES;
}

-(IBAction)Direction:(id)sender {
    NSString *urlString = [NSString stringWithFormat: @"http://maps.apple.com/maps?daddr=%@,%@", _coordinates[0], _coordinates[1]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

@end
