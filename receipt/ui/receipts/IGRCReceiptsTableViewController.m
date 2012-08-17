//
//  IGRCReceiptsTableViewController.m
//  receipt
//
//  Created by Alexey Rogatkin on 15.08.12.
//
//

#import <CoreData/CoreData.h>
#import "IGRCReceiptsTableViewController.h"
#import "Category.h"
#import "IGRCAppDelegate.h"
#import "IGRCDataAccessManager.h"
#import "Receipt.h"

@interface IGRCReceiptsTableViewController ()
@property(nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@end

@implementation IGRCReceiptsTableViewController {
@private
    BOOL _showOnlyFavorite;
    Category *_fromCategory;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

@synthesize fetchedResultsController = _fetchedResultsController;

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController == nil) {
        IGRCAppDelegate *delegate = (IGRCAppDelegate *) [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = delegate.dataAccessManager.managedObjectContext;

        NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
        [fetch setEntity:[NSEntityDescription entityForName:@"Receipt"
                                     inManagedObjectContext:context]];

        NSMutableArray *predicates = [NSMutableArray arrayWithCapacity:2];
        if (self.showOnlyFavorites) {
            [predicates addObject:[NSPredicate predicateWithFormat:@"favorite == YES"]];
        }
        if (self.fromCategory != nil) {
            [predicates addObject:[NSPredicate predicateWithFormat:@"category == %@", self.fromCategory]];
        }
        NSPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:predicates];

        [fetch setPredicate:predicate];

        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
        [fetch setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
        [sortDescriptor release];

        _fetchedResultsController = [[NSFetchedResultsController alloc]
                initWithFetchRequest:fetch
                managedObjectContext:context
                  sectionNameKeyPath:nil cacheName:nil];
        [fetch release];
    }
    return _fetchedResultsController;

}

- (BOOL)showOnlyFavorites {
    return _showOnlyFavorite;
}

- (void)setShowOnlyFavorites:(BOOL)aShowOnlyFavorites {
    self.fetchedResultsController = nil;
    _showOnlyFavorite = aShowOnlyFavorites;
}

- (Category *)fromCategory {
    return _fromCategory;
}

- (void)setFromCategory:(Category *)aFromCategory {
    self.fetchedResultsController = nil;
    [_fromCategory release];
    _fromCategory = [aFromCategory retain];
    return; _fromCategory;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    NSError *error = nil;
    BOOL success = [self.fetchedResultsController performFetch:&error];
    if (!success) {
        NSLog(@"Error in fetching: %@", error.userInfo);
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:(NSUInteger) section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ReceiptCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    Receipt *receipt = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = receipt.title;
    cell.detailTextLabel.text = receipt.descript;

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)dealloc {
    [_fetchedResultsController release];
    [_fromCategory release];
    [super dealloc];
}

@end
