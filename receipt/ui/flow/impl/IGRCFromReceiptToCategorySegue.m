//
//  Created by Alexey Rogatkin on 15.08.12.
//  
//


#import "IGRCFromReceiptToCategorySegue.h"
#import "IGRCReceiptsTableViewController.h"
#import "IGRCCategoryTableViewController.h"

@interface IGRCFromReceiptToCategorySegue () {

}
@end

@implementation IGRCFromReceiptToCategorySegue

- (void)prepareViewController:(IGRCReceiptsTableViewController *)destinationController
            forTransitionFrom:(IGRCCategoryTableViewController *)sourceController
                    parameter:(UITableViewCell *)initiator {
    NSIndexPath *const path = [sourceController.tableView indexPathForCell:initiator];
    destinationController.pathToSelectedCategory = path;
}

@end