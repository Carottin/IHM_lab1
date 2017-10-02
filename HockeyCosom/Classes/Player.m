//
//  Player.m
//  HockeyCosom
//
//  Created by Richard, Antoine on 17-09-21.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"


@implementation Player

- (id)initialize:(NSString *)aName number:(int)aNumber{
    name=aName;
    number=aNumber;
    but=0;
    pass=0;
    point = 0;
    
    return self;
}

- (void) addGoal{
    but ++;
}

- (void) addPass{
    pass ++;
}
//- (void) setBut:(int )





@end
