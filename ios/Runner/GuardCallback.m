#import "GuardCallback.h"

@implementation GuardCallback

+ (void)sayHello {
    NSLog(@"Hello, World!");
}

// Objective-C Looping Example
+ (void)startLooping {
    for (int i = 1; i <= 10; i++)
    {
        NSLog(@"%d", i);
        NSString *stringToSend = @"Hello from Objective-C!";
        // [ViewController receiveFromObjectiveC:stringToSend];
        sleep(1);
    }
}

@end
