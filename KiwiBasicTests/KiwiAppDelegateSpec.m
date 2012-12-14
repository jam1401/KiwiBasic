//
//  KiwiAppDelegateSpec.m
//  KiwiBasic
//
//  Created by Jeffrey Morgan on 12/11/12.
//  Copyright 2012 Jeffrey Morgan. All rights reserved.
//

#import "Kiwi.h"
#import "KiwiAppDelegate.h"
#import "KiwiViewController.h"


SPEC_BEGIN(KiwiAppDelegateSpec)

  describe(@"KiwiAppDelegate", ^{
    __block KiwiAppDelegate *appDelegate;
    __block BOOL launchedSuccessfully;
    
    beforeEach(^{
      appDelegate = [[KiwiAppDelegate alloc] init];
    });
    
    context(@"when the app finished launching", ^{
      beforeEach(^{
        launchedSuccessfully = [appDelegate application:nil didFinishLaunchingWithOptions:nil];
      });
      
      it(@"launches sucessfully", ^{
        [[theValue(launchedSuccessfully) should] equal:theValue(TRUE)];
      });
      
      it(@"has a UIWindow", ^{
        [[appDelegate.window should] beKindOfClass:[UIWindow class]];
      });
      
      it(@"fills the screen", ^{
        float screenHeight = [[UIScreen mainScreen] bounds].size.height;
        float screenWidth = [[UIScreen mainScreen] bounds].size.width;
        [[theValue(appDelegate.window.frame.size.height) should] equal:theValue(screenHeight)];
        [[theValue(appDelegate.window.frame.size.width) should] equal:theValue(screenWidth)];
      });
      
      it(@"has a visible window key", ^{
        [[theValue(appDelegate.window.keyWindow) should] equal:theValue(TRUE)];
      });
      
      it(@"has the correct root controller class", ^{
        [[appDelegate.window.rootViewController should] beKindOfClass:[KiwiViewController class]];
      });
      
      
    });
  
  });

SPEC_END


