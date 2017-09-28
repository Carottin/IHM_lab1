//
//  Team.h
//  HockeyCosom
//
//  Created by Richard, Antoine on 17-09-21.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//

#ifndef Team_h
#define Team_h
#import "Player.h"

@interface Team:NSObject
{
    @public NSString *name;
    @public NSMutableArray *playerArray;
}
- (id)initialize:(NSString *)aName;

@end


#endif /* Team_h */
