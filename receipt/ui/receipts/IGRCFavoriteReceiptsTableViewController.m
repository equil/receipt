//
//  Created by Alexey Rogatkin on 19.08.12.
//  
//


#import "IGRCFavoriteReceiptsTableViewController.h"

@interface IGRCFavoriteReceiptsTableViewController () {

}
@end

@implementation IGRCFavoriteReceiptsTableViewController

- (NSPredicate *)predicateForFetchedController {
    return [NSPredicate predicateWithFormat:@"favorite == YES"];
}


@end