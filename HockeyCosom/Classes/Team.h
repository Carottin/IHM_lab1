//
//  Team.h
//  HockeyCosom
//
//  Created by Richard, Antoine on 17-09-21.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//

#import "Player.h"

@interface Team:NSObject
{
    @public NSString *name;
    @public NSMutableArray *playerArray;
    @public int *goal;
}
- (id)initialize:(NSString *)aName;

@end


