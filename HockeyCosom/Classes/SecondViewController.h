//
//  SecondViewController.h
//  HockeyCosom
//
//  Created by Peyrot, Michael on 17-09-28.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Team.h"
#import "Player.h"


@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic, retain) Team *t1;
@property(nonatomic, retain) Team *t2;
- (void)addStats:(Team *)team marqueur:(Player *)marqueur passeur1:(Player *)passeur1 passeur2:(Player *)passeur2 period:(NSString *) period;

@end
