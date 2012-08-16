//
//  IGRCAppDelegate.h
//  receipt
//
//  Created by Alexey Rogatkin on 13.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IGRCSeguePrepareStrategy;
@class IGRCDataAccessManager;

@interface IGRCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic, readonly) IGRCSeguePrepareStrategy *segueStrategy;
@property (strong, nonatomic, readonly) IGRCDataAccessManager *dataAccessManager;

@end