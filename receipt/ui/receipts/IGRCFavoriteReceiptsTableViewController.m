//
//  Created by Alexey Rogatkin on 19.08.12.
//  
//


#import "IGRCFavoriteReceiptsTableViewController.h"

@interface IGRCFavoriteReceiptsTableViewController () {

}
@end

@implementation IGRCFavoriteReceiptsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.selectedItem.badgeValue = @"";
}


- (NSPredicate *)predicateForFetchedController {
    return [NSPredicate predicateWithFormat:@"favorite == YES"];
}


@end