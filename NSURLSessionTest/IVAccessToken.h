//
//  IVAccessToken.h
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 28.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IVAccessToken : NSObject

@property (nonatomic, strong) NSString* token;
@property (nonatomic, strong) NSDate* expirationDate;
@property (nonatomic, strong) NSString* userID;

@end
