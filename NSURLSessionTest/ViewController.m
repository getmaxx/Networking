//
//  ViewController.m
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 26.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import "ViewController.h"
#import "IVModel.h"

@interface ViewController () {
    
    NSURLSession *session1;
    IVModel *testModel;
}

@end

static NSString* const kImageURL = @"http://cs623329.vk.me/v623329702/49ffe/E5k-ABxNcm0.jpg";


@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _progress.hidden = YES; // vapdlu konstreinty perenastraivat
    _weatherLabel.text = @"";
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(updateUI)
                                                 name: @"com.igorv.workdone"
                                               object: nil];
    
    [self weather];
    [self picture];
    
}

- (void) picture {
    
    _progress.progress = 0.0f;
    
    session1 = [NSURLSession sessionWithConfiguration:
               [NSURLSessionConfiguration
                defaultSessionConfiguration]];
    
    
    NSURL *url = [NSURL URLWithString:kImageURL];
    
    NSURLSessionTask *task = [session1 dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *img = [UIImage imageWithData: data];
        while (task) {
            dispatch_async(dispatch_get_main_queue(), ^{
                _progress.progress += 0.1f;
                
            });
        }
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _progress.progress = 1.0f;
            [_activity stopAnimating];
            _imgView.image = img;
        });
    }];
    [task resume];

}

- (void) weather {
    
    testModel = [[IVModel alloc] init];
    [testModel getTemperatureByCity:@"Moscow"];
   
}

- (void) updateUI {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _weatherLabel.text = testModel  .tempAsString;
        [_tempActivity stopAnimating];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    //[super dealloc];
}

@end
