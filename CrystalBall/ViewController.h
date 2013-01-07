//
//  ViewController.h
//  CrystalBall
//
//  Created by Eric Pan on 1/7/13.
//  Copyright (c) 2013 Eric Pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {

}

@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
@property (strong, nonatomic) NSArray *predictionArray;

- (void) makePrediction;

@end
