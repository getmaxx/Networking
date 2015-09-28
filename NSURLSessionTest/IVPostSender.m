//
//  IVPostSender.m
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 28.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import "IVPostSender.h"

/*
 Постит сообщение на моей стене и возвращает его обратно
 */
@implementation IVPostSender

+ (IVPostSender*) sharedSender {
    
    static IVPostSender* sender = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sender = [[IVPostSender alloc] init];
    });
    
    return sender;
}


@end
