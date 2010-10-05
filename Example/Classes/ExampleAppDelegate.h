//
//  ExampleAppDelegate.h
//  Example
//
//  Created by Stefan Arentz on 10-10-05.
//  Copyright 2010 Arentz Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExampleViewController;

@interface ExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ExampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ExampleViewController *viewController;

@end

