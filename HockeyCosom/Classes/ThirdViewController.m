//
//  ThirdViewController.m
//  HockeyCosom
//
//  Created by Richard, Antoine on 17-10-02.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "Player.h"
#import "ThirdViewController.h"
#import "SecondViewController.h"

@interface ThirdViewController ()

@property (weak, nonatomic) IBOutlet UITextView *statsText;

@property (weak, nonatomic) IBOutlet UILabel *firstPlayer;
@property (weak, nonatomic) IBOutlet UILabel *secondPlayer;
@property (weak, nonatomic) IBOutlet UILabel *thirdPlayer;

@end



@implementation ThirdViewController
NSMutableArray *playerStarsArray;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    for (Player * p in _t1->playerArray){
        p->point = p->but*2 + p->pass;
    }
    for (Player * p in _t2->playerArray){
        p->point = p->but*2 + p->pass;
    }
    
    playerStarsArray =[NSMutableArray arrayWithArray:[_t1->playerArray arrayByAddingObjectsFromArray:_t2->playerArray]];
    
    for (NSString* key in _statsArray) {
        _statsText.text = [_statsText.text stringByAppendingString:key];
        _statsText.text = [_statsText.text stringByAppendingString:@"\n\n"];
    }
    
    /*NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"point" ascending:NO];
     [_playerStarsArray sortUsingDescriptors:@[sortDescriptor]];*/
    
    
    
    
    for (int i=0 ; i<playerStarsArray.count ; i++){
        for (int j=i+1 ; j<playerStarsArray.count ; j++ ){
            if( ((Player *)playerStarsArray[j])->point > ((Player *)playerStarsArray[i])->point) {
                [playerStarsArray exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
            if( ((Player *)playerStarsArray[j])->point==((Player *)playerStarsArray[i])->point  &&  ((Player *)playerStarsArray[j])->but > ((Player *)playerStarsArray[i])->but) {
                [playerStarsArray exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    
    _firstPlayer.text = ((Player *)playerStarsArray[0])->name ;
    _secondPlayer.text = ((Player *)playerStarsArray[1])->name ;
    _thirdPlayer.text = ((Player *)playerStarsArray[2])->name ;
    
    for (Player * p in playerStarsArray){
        NSLog(@"%i :  %i",p->number, p->point);
    }
    
    
}



@end


