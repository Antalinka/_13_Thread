//
//  GRStudent2.h
//  _13_Threads
//
//  Created by Exo-terminal on 3/25/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRStudent2 : NSObject{
    NSOperationQueue *operationQueue;
}

@property(strong, nonatomic)NSString* name;
//@property(copy,nonatomic)void(^blockResult)(CGFloat);




-(void)guessQuestion1:(NSDictionary*) parametersDictionary block:(void(^)(CGFloat)) blockResult;
- (instancetype)initWithName:(NSString*)name;

@end
