//
//  AppDelegate.m
//  _13_Threads
//
//  Created by Exo-terminal on 3/25/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "AppDelegate.h"
#import "GRStudent.h"
#import "GRStudent2.h"



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    NSInteger guessQuestion = 35415;
    NSInteger startNumber = 100;
    NSInteger finishNumber = 2000000;
    
    GRStudent2* student1 = [[GRStudent2 alloc]initWithName:@"student1"];
    GRStudent2* student2 = [[GRStudent2 alloc]initWithName:@"student2"];
    GRStudent2* student3 = [[GRStudent2 alloc]initWithName:@"student3"];
    GRStudent2* student4 = [[GRStudent2 alloc]initWithName:@"student4"];
    GRStudent2* student5 = [[GRStudent2 alloc]initWithName:@"student5"];
    
    NSArray* studentsArray = [NSArray arrayWithObjects:student1,student2,student3,student4,student5,nil];
    
    NSDictionary* studentsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:guessQuestion], @"trueNumber", [NSNumber numberWithInteger:startNumber],@"startNumber",[NSNumber numberWithInteger:finishNumber],@"finishNumber", nil];
    
    for (GRStudent* students in studentsArray) {
        
        [students guessQuestion1:studentsDictionary block:^(CGFloat time){
            
            NSLog(@"%@.I am winner!True number: %d,  %f sec",students.name, guessQuestion, time);
        }];
    }

//      
//  
//    GRStudent* student1 = [[GRStudent alloc]initWithName:@"student1"];
//    GRStudent* student2 = [[GRStudent alloc]initWithName:@"student2"];
//    GRStudent* student3 = [[GRStudent alloc]initWithName:@"student3"];
//    GRStudent* student4 = [[GRStudent alloc]initWithName:@"student4"];
//    GRStudent* student5 = [[GRStudent alloc]initWithName:@"student5"];
//  
//    NSArray* studentsArray = [NSArray arrayWithObjects:student1,student2,student3,student4,student5,nil];
//    NSDictionary* studentsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:guessQuestion], @"trueNumber", [NSNumber numberWithInteger:startNumber],@"startNumber",[NSNumber numberWithInteger:finishNumber],@"finishNumber", nil];
//    
//    for (GRStudent* students in studentsArray) {
//        
//        [students guessQuestion1:studentsDictionary block:^(CGFloat time){
//            
//            NSLog(@"%@.I am winner!True number: %d,  %f sec",students.name, guessQuestion, time);
//        }];
//    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
