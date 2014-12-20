//
//  ViewController.m
//  MusicFlashObjC
//
//  Created by Richard Guy on 12/19/14.
//  Copyright (c) 2014 DC. All rights reserved.
//

#import "ViewController.h"
#import "PureLayout.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *barViews;

@end

@implementation ViewController

- (void) addClef {
    UIImage *gClef = [UIImage imageNamed:@"GClef"];
    UIImageView *gClefImageView = [[UIImageView alloc] initWithImage:gClef];
    [self.view addSubview:gClefImageView];
    
    // instead of frame, use auto layout
    float multiplier = .04;
    //    gClefImageView.frame = CGRectMake(0, 0, gClef.size.width * .05, gClef.size.height * .05);
    [gClefImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [gClefImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [gClefImageView autoSetDimension:ALDimensionHeight toSize:gClef.size.height * multiplier];
    [gClefImageView autoSetDimension:ALDimensionWidth toSize:gClef.size.width * multiplier];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // determine available screen size
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    float screenWidth = screenBounds.size.width;
    float screenHeight = screenBounds.size.height;
    
    [self addClef];

    // variables
    int totalNumberOfBarsInCleff = 29;
    int numberOfVisibleBarsInCleff = 10;
    float barHeight = 5;
    float barSpacing = (screenHeight * .75) / totalNumberOfBarsInCleff;
    
    // store all of the bar views in this
    self.barViews = [[NSMutableArray alloc] init];
    
    // construct all the bar views
    for (int i = 0; i < numberOfVisibleBarsInCleff; i++) {
        CGRect barFrame = CGRectMake(0, (i * barHeight) + (i * barSpacing), screenWidth, barHeight);
        UIView *barView = [[UIView alloc] initWithFrame:barFrame];
        barView.backgroundColor = [UIColor blackColor];
        [self.barViews addObject:barView];
    }
    
    // add the constructed bar views to the main view
    for (UIView *barView in self.barViews) {
        [self.view addSubview:barView];
    }
    
    // add some random notes
    long numberOfRandomNotes = self.barViews.count;
    for (int i = 0; i < numberOfRandomNotes; i++) {
        UIView *barView = [self.barViews objectAtIndex:i];
        
        int randomDistance = 20;
        
        // add a note
        UIImage *note = [UIImage imageNamed:@"note"];
        UIImageView *noteImageView = [[UIImageView alloc] initWithImage:note];
        noteImageView.frame = CGRectMake(i * randomDistance, barView.center.y, note.size.width * .1, note.size.height * .1);
        [self.view addSubview:noteImageView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end