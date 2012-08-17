//
//  Created by Alexey Rogatkin on 15.08.12.
//  
//


#import "IGRCFromReceiptToCategorySegue.h"
#import "IGRCReceiptsTableViewController.h"
#import "IGRCCategoryTableViewController.h"
#import "Category.h"

@interface IGRCFromReceiptToCategorySegue () {

}
@end

@implementation IGRCFromReceiptToCategorySegue

- (void)prepareViewController:(IGRCReceiptsTableViewController *)destinationController
            forTransitionFrom:(IGRCCategoryTableViewController *)sourceController
                    parameter:(UITableViewCell *)sender {
    NSIndexPath *path = [sourceController.tableView indexPathForCell:sender];
    destinationController.fromCategory = [sourceController.fetchResultsController objectAtIndexPath:path];
    destinationController.showOnlyFavorites = NO;
}

@end