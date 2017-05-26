//
//  Game.m
//  Flappy
//
//  Created by Pepsi Max on 26/05/17.
//  Copyright © 2017 Pepsi Max. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)GameOver{
    
    if (scoreNumber > highScoreNumber) {
        [[NSUserDefaults standardUserDefaults]setInteger:scoreNumber forKey:@"highScoreSaved"];
    }
    
    [tunnelMovement invalidate];
    [birdMovement invalidate];
    
    exit.hidden = NO;
    tunnelTop.hidden = YES;
    tunnelBottom.hidden = YES;
    bird.hidden = YES;
    scoreLabel.hidden = NO;
    
}

-(void)score {
    scoreNumber = scoreNumber + 1;
    scoreLabel.text = [NSString stringWithFormat:@"%i", scoreNumber];
    
}

-(IBAction)startGame:(id)sender{
}

-(void)tunnelMoving{
}

-(void)placeTunnels{                                                        
}

-(void)birdMoving {
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    birdFlight = 20; //30
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
