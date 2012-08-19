//
//  IGRCReceiptDetailsViewController.m
//  receipt
//
//  Created by Alexey Rogatkin on 08/19/12.
//___COPYRIGHT___
//

#import "IGRCReceiptDetailsViewController.h"
#import "Receipt.h"
#import "IGRCAppDelegate.h"

@interface IGRCReceiptDetailsViewController ()

@end

@implementation IGRCReceiptDetailsViewController

@synthesize receiptImage = _receiptImage;
@synthesize descriptionLabel = _descriptionLabel;
@synthesize howToPrepareLabel = _howToPrepareLabel;
@synthesize receipt = _receipt;
@synthesize favoriteImageView = _favoriteImageView;


- (void)reconfigureControllerView {
    self.receiptImage.image = _receipt.image;
    self.descriptionLabel.text = _receipt.descript;
    self.howToPrepareLabel.text = _receipt.howToPrepare;
    self.navigationItem.title = _receipt.title;
    self.favoriteImageView.highlighted = [_receipt.favorite boolValue];
}

- (void)setReceipt:(Receipt *)aReceipt {
    [_receipt release];
    _receipt = [aReceipt retain];

    [self reconfigureControllerView];
}

- (IBAction)switchFavoriteState {
    _receipt.favorite = [NSNumber numberWithBool:![_receipt.favorite boolValue]];
    IGRCAppDelegate *delegate = (IGRCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate.dataAccessManager saveState];
    [self reconfigureControllerView];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self reconfigureControllerView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}





- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_receiptImage release];
    [_descriptionLabel release];
    [_howToPrepareLabel release];
    [_receipt release];
    [_favoriteImageView release];
    [super dealloc];
}

@end
