//
//  ViewController.m
//  CrystalBall
//
//  Created by Eric Pan on 1/7/13.
//  Copyright (c) 2013 Eric Pan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize predictionLabel;
@synthesize predictionArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"background.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    [self.view addSubview:imageView];
    [self.view insertSubview:imageView atIndex:0];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.predictionArray = [[NSArray alloc] initWithObjects:
                                @"It is certain",
                                @"It is decidedly so",
                                @"All signs say YES",
                                @"It is doubtful",
                                @"My reply is no",
                                @"Better not tell you now",
                                @"Concentrate and ask again",
                                @"Unable to answer now",
                                @"The stars are not aligned", nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) makePrediction {
        NSUInteger index = arc4random_uniform(self.predictionArray.count);
        self.predictionLabel.text = [self.predictionArray objectAtIndex:index];
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"motion began");
    self.predictionLabel.text = @"";
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if ( motion == UIEventSubtypeMotionShake ) {
        NSLog(@"motion ended");
        [self makePrediction];
    }
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"motion canceled");
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.predictionLabel.text = @"";
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self makePrediction];
}

@end
