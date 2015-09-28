//
//  IVModel.m
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 26.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import "IVModel.h"

static NSString const *kWeatherString = @"http://api.openweathermap.org/data/2.5/weather?q=";

@implementation IVModel

- (id) initWithNameOfCity:(NSString *)nameOfCity {
    
    self = [super init];
    if (self) {
         NSLog(@"init");
       
            [self getTemperatureByCity: nameOfCity];
            NSLog(@"%@", _tempAsString);
      
        
    }
    return self;
}

- (void) getTemperatureByCity: (NSString *) cityStrig {
    
        NSString* moscowWeatherString = [NSString stringWithFormat:@"%@%@", kWeatherString,cityStrig];
        
        NSURLSession *session = [NSURLSession sharedSession];
        
        [[session dataTaskWithURL:[NSURL URLWithString:moscowWeatherString]
                completionHandler:^(NSData        *data,
                                    NSURLResponse *response,
                                    NSError       *error) {
                    
                    NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData: data
                                                                                 options: kNilOptions
                                                                                   error: &error];
                    [self getTemperatureAsString: responseDict];
                    
                }] resume];
    
}

- (void) getTemperatureAsString: (NSDictionary *) responceDictFromServer {
    
    NSDictionary *temperature = [responceDictFromServer objectForKey:@"main"];
    NSString* temp = [temperature objectForKey:@"temp"];
    float tempFloatValue = [temp floatValue];
    int tempIntValue = rint(tempFloatValue) - 273.15f;
    NSLog(@"WORKS? %d", tempIntValue);
    
    _tempAsString = [NSString stringWithFormat: @"%d", tempIntValue];
    NSLog(@"WORKS STR? %@", _tempAsString);
    
    [[NSNotificationCenter defaultCenter] postNotificationName: @"com.igorv.workdone"
                                                        object: nil];
}

- (void) updateWeather {
    
    [_delegate updateWeather];
    
}

@end
