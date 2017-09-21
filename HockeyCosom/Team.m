//
//  Team.m
//  HockeyCosom
//
//  Created by Richard, Antoine on 17-09-21.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Team.h"


@implementation Team

- (id)initialize:(NSString *)aName{
    name=aName;
    playerArray = [[NSMutableArray alloc] init];
    
    return self;
}



@end
