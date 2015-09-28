//
//  IVPostSender.m
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 28.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import "IVPostSender.h"
#import "IVUser.h"
#import "AFNetworking.h"
#import "IVVKLoginViewController.h"
#import "IVAccessToken.h"

/*
 Постит сообщение на моей стене и возвращает его обратно
 */

@interface IVPostSender()

@property (strong, nonatomic) AFHTTPRequestOperationManager* requestOperationManager;
@property (strong, nonatomic) IVAccessToken* accessToken;

@end

@implementation IVPostSender

#pragma mark - Initialization

+ (IVPostSender*) sharedSender {
    
    static IVPostSender* sender = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sender = [[IVPostSender alloc] init];
    });
    
    return sender;
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

#pragma mark - Authorization

- (void) authorizeUser: (IVAuthorizeBlock) completion {
    
    IVVKLoginViewController* loginVC = [[IVVKLoginViewController alloc] initWithCompletionBlock:^(IVAccessToken *token) {
        self.accessToken = token;
        
        if (completion) {
            completion(nil);
        }
    }];
    
    //NSLog(@"CREATED");
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    //[nav pushViewController:loginVC animated:YES];

    //NSLog(@"NAV CONTROLLER CREATED");
    
    UINavigationController* mainVC = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
    NSLog(@"authorizeUSer CLASS %@", mainVC.class);
    [mainVC presentViewController:nav
                         animated:YES
                       completion:nil];
   
}

@end
