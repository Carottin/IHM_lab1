//
//  Player.h
//  HockeyCosom
//
//  Created by Richard, Antoine on 17-09-21.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//

#ifndef Player_h
#define Player_h

@interface Player:NSObject
{
    @public NSString *name;
    int but;
    int number;
    int pass;
    int point;
}
- (id)initialize:(NSString *)aName number:(int)number;

-(void)addGoal;

-(void)addPass;
@end

#endif /* Player_h */
