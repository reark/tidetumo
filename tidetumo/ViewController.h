//
//  ViewController.h
//  tidetumo
//
//  Created by Timo Tuominen on 2/22/13.
//  Copyright (c) 2013 Timo Tuominen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;
@property (strong, nonatomic) IBOutlet UILabel *timeIsUpLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (retain) NSTimer *updateTimer;
@property int timeRemaining;
- (IBAction)buttonPressed:(UIButton *)sender;

@end
