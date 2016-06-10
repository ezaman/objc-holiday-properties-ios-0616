//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

/////// 1
- (NSArray *)holidaysInSeason:(NSString *)season {
    
    NSArray *holidays = self.database[season];
    
    return holidays;
}

/////// 2
- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    NSMutableArray *supplies = self.database[season][holiday];
    
    return  supplies;
}

/////// 3
- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    BOOL returnHoliday =  NO;
    if ([self.database[season] objectForKey:holiday]){
        returnHoliday = YES;
    }
    
    return returnHoliday;
}


/////// 4
- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    BOOL returnSupply =  NO;
    if ([self.database[season][holiday] containsObject:supply]){
        returnSupply = YES;
 }
    return returnSupply;
}


/////// 5
- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    NSMutableArray *addHoliday = [[NSMutableArray alloc]init];
    [self.database[season] setObject: addHoliday forKey: holiday];
    
    // no return
}


////// 6
- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
  
    [self.database[season][holiday] addObject: supply];
    
    // no return
}

@end
