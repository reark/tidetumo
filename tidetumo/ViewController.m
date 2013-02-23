//
//  ViewController.m
//  tidetumo
//
//  Created by Timo Tuominen on 2/22/13.
//  Copyright (c) 2013 Timo Tuominen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize updateTimer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self resetTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    if (!self.updateTimer && self.timeRemaining > 0) {
        [self startTimer];
    } else {
        [self resetTimer];
    }
}

- (void)stopTimer {
    if (self.updateTimer) {
        [self.updateTimer invalidate];
        self.updateTimer = nil;
    }
}

- (void)startTimer {
    [self stopTimer];
    self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [self.resetButton setHidden:NO];
    [self.startButton setHidden:YES];
}

- (void)resetTimer {
    [self stopTimer];
    self.timeRemaining = 25*60;
    [self.timeIsUpLabel setHidden:YES];
    [self updateStatusLabel];
    [self.resetButton setHidden:YES];
    [self.startButton setHidden:NO];
}

- (void)timeIsUp {
    [self stopTimer];
    NSLog(@"Time is up!");
    [self.timeIsUpLabel setHidden:NO];
    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
}

- (void)updateTime {
    [self updateStatusLabel];
    if (--self.timeRemaining < 0) {
        [self timeIsUp];
    }
}

- (void)updateStatusLabel {
    int seconds = self.timeRemaining % 60;
    int minutes = self.timeRemaining / 60;
    self.statusLabel.text = [NSString stringWithFormat:@"%i:%02d", minutes, seconds];
}

@end
