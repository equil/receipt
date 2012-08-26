//
//  Created by Alexey Rogatkin on 25.08.12.
//  
//


#import <CoreData/CoreData.h>
#import "IGRCFavoritesBadgeObserver.h"
#import "Receipt.h"

@interface IGRCFavoritesBadgeObserver () {

}
@end

@implementation IGRCFavoritesBadgeObserver

@synthesize context = _context;

- (id)initWithContext:(NSManagedObjectContext *)context {
    self = [super init];
    if (self) {
        _context = [context retain];
        [[NSNotificationCenter defaultCenter]
                addObserver:self
                   selector:@selector(observeChangesInContext:)
                       name:NSManagedObjectContextWillSaveNotification
                     object:_context];
    }
    return self;
}

- (void)observeChangesInContext:(NSNotification *)notification {

}

- (void)dealloc {
    [_context release];
    [super dealloc];
}

+ (id)objectWithContext:(NSManagedObjectContext *)context {
    return [[[IGRCFavoritesBadgeObserver alloc] initWithContext:context] autorelease];
}

@end