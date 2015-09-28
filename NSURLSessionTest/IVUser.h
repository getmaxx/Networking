//
//  IVUser.h
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 28.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IVUser : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSURL *imageURL;

- (id) initWithServerResponse:(NSDictionary*) responseObject;

@end
