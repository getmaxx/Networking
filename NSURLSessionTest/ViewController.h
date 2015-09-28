//
//  ViewController.h
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 26.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *tempActivity;

@end

