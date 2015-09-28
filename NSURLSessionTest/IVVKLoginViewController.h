//
//  IVVKLoginViewController.h
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 28.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IVAccessToken;

typedef void(^IVLoginCompletionBlock)(IVAccessToken* token);

@interface IVVKLoginViewController : UIViewController

- (id) initWithCompletionBlock:(IVLoginCompletionBlock) сompletionBlock;

@end
