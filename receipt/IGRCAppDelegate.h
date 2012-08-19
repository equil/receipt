//
//  IGRCAppDelegate.h
//  receipt
//
//  Created by Alexey Rogatkin on 13.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGRCSeguePrepareStrategy.h"
#import "IGRCDataAccessManager.h"

@interface IGRCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic, readonly) IGRCSeguePrepareStrategy *segueStrategy;
@property (strong, nonatomic, readonly) IGRCDataAccessManager *dataAccessManager;

@end
