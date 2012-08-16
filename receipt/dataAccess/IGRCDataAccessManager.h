//
//  Created by Alexey Rogatkin on 16.08.12.
//  
//


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface IGRCDataAccessManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end