//
//  SecondViewController.m
//  HockeyCosom
//
//  Created by Peyrot, Michael on 17-09-28.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "MyCell.h"


@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableViewTeam1;
@property (weak, nonatomic) IBOutlet UITableView *tableViewTeam2;
@property (weak, nonatomic) IBOutlet UILabel *team1NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *team2NameLabel;

@end


@implementation SecondViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _team1NameLabel.text = _t1->name;
    _team2NameLabel.text = _t2->name;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCell *cell = (MyCell *)[tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"MyCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    if(tableView == _tableViewTeam1){
        cell.numLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t1->playerArray objectAtIndex:indexPath.row])->number];
        cell.nomLabel.text = ((Player *)[self.t1->playerArray objectAtIndex:indexPath.row])->name;
        cell.butLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t1->playerArray objectAtIndex:indexPath.row])->but];
        cell.passLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t1->playerArray objectAtIndex:indexPath.row])->pass];
    }
    else{
        cell.numLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t2->playerArray objectAtIndex:indexPath.row])->number];
        cell.nomLabel.text = ((Player *)[self.t2->playerArray objectAtIndex:indexPath.row])->name;
        cell.butLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t2->playerArray objectAtIndex:indexPath.row])->but];
        cell.passLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t2->playerArray objectAtIndex:indexPath.row])->pass];
    }


    return cell;
}

@end
