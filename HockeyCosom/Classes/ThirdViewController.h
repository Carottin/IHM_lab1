//
//  ThirdViewController.h
//  HockeyCosom
//
//  Created by Richard, Antoine on 17-10-02.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"
#import "Player.h"

#import <Foundation/Foundation.h>



@interface ThirdViewController : UIViewController

@property(nonatomic, retain) Team *t1;
@property(nonatomic, retain) Team *t2;

@property(nonatomic, retain) NSMutableArray *statsArray;


@end
