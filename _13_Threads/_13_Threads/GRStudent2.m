//
//  GRStudent2.m
//  _13_Threads
//
//  Created by Exo-terminal on 3/25/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRStudent2.h"

@interface GRStudent2()
//+(dispatch_queue_t)sharedQueue;
@end

@implementation GRStudent2

- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

+(dispatch_queue_t)sharedQueue{

    static dispatch_queue_t queue;
    static dispatch_once_t onceQueue;
    dispatch_once(&onceQueue, ^{
        queue = dispatch_queue_create("com.primer.threads", DISPATCH_QUEUE_CONCURRENT);
    });
    return queue;
}


-(void)guessQuestion1:(NSDictionary*) parametersDictionary block:(void(^)(CGFloat)) blockResult{
    
    
    NSInteger trueNumber = [[parametersDictionary objectForKey:@"trueNumber"]intValue];
    NSInteger startNumber = [[parametersDictionary objectForKey:@"startnumber"] intValue];
    NSInteger finishNumber = [[parametersDictionary objectForKey:@"finishNumber"]intValue];
    
    void(^block)(void)=^{
        double timeStart = CACurrentMediaTime();
        NSInteger i = 0;
        while (i != trueNumber) {
            i = arc4random()%(finishNumber-startNumber+1)+startNumber;
        }
        blockResult(CACurrentMediaTime()-timeStart);
    };
    
//    operationQueue = [NSOperationQueue new];
//    NSOperation *operation = [[NSOperation alloc]ini
//    
//
//    [operationQueue addOperation:operation];
//    
    
//    NSOperationQueue *queue = [NSOperationQueue new];
    
//	NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
//																			selector:@selector(loadDataWithOperation)
//																			  object:nil];
//	[queue addOperation:operation];
	

//    
//    NSOperation* queue = [[NSOperation alloc]init];
//    NSOperationQueue* myQueue;
//    myQueue.maxConcurrentOperationCount = 5;
//    
//    [myQueue addOperation:queue];
//    [myQueue addOperationWithBlock:^{
//        block();
//    }];
//    [queue start];
//
//    
        dispatch_async([GRStudent2 sharedQueue], ^{
        block();
    });
}
@end
