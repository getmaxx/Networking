//
//  IVModel.h
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 26.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IVModel : NSObject

@property (strong, nonatomic) NSDictionary *weatherDict;
@property (strong, nonatomic) NSString *tempAsString;

- (void) getTemperatureByCity: (NSString *) cityStrig;
- (id) initWithNameOfCity: (NSString *) nameOfCity;
- (void) getTemperatureAsString: (NSDictionary *) responceDictFromServer;

@end
