//
//  IVWeatherMap.m
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 27.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import "IVWeatherMap.h"
#import "AFNetworking.h"

@interface IVWeatherMap ()

@property (strong, nonatomic) AFHTTPRequestOperationManager* requestOperationManager;

@end

@implementation IVWeatherMap

+ (IVWeatherMap*) sharedMap {
    
    static IVWeatherMap* map = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = [[IVWeatherMap alloc] init];
    });
    
    return map;
}

- (id)init
{
    self = [super init];
    if (self) {
        
        NSURL* url = [NSURL URLWithString:@"https://api.vk.com/method/"];
        
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    }
    return self;
}


@end
