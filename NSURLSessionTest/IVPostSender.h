//
//  IVPostSender.h
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 28.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IVUser;

@interface IVPostSender : NSObject

+ (IVPostSender*) sharedSender;

- (void) authorizeUser: (void(^)(IVUser *user)) completion;

@end
