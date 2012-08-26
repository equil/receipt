//
//  Created by Alexey Rogatkin on 25.08.12.
//  
//


#import <Foundation/Foundation.h>

@class NSManagedObjectContext;
@class NSManagedObjectContext;


@interface IGRCFavoritesBadgeObserver : NSObject

@property(readonly) NSManagedObjectContext *context;

- (id)initWithContext:(NSManagedObjectContext *)context;

+ (id)objectWithContext:(NSManagedObjectContext *)context;


@end