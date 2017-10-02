//
//  SecondViewController.h
//  HockeyCosom
//
//  Created by Peyrot, Michael on 17-09-28.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Team.h"

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic, retain) Team *t1;
@property(nonatomic, retain) Team *t2;
- (void)addStats:(Team *)team marqueur:(NSString *)marqueur passeur1:(NSString *)passeur1 passeur2:(NSString *)passeur2 period:(NSString *) period;

@end
