//
//  IVPostSender.h
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 28.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IVUser;

typedef void(^IVAuthorizeBlock)(IVUser *user);

@interface IVPostSender : NSObject

@property (strong, nonatomic, readonly) IVUser *currentUser;

+ (IVPostSender*) sharedSender;

- (void) authorizeUser: (IVAuthorizeBlock) completion;

@end
