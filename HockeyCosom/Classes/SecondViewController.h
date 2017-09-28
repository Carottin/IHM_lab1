//
//  SecondViewController.h
//  HockeyCosom
//
//  Created by Peyrot, Michael on 17-09-28.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Team.h"

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, retain) Team *t1;
@property(nonatomic, retain) Team *t2;

@end
