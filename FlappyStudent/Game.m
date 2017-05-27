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

-(void)score{
    
    scoreNumber = scoreNumber + 1;
    scoreLabel.text = [NSString stringWithFormat:@"%i", scoreNumber];
    
}

-(IBAction)startGame:(id)sender{
    
    tunnelBottom.hidden = NO;
    tunnelTop.hidden = NO;
    startGame.hidden = YES;
    scoreLabel.hidden = YES;
    
    birdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(birdMoving) userInfo:nil repeats:YES];
    
    [self placeTunnels];
    
    tunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tunnelMoving) userInfo:nil repeats:YES];

}

-(void)tunnelMoving{
    
    tunnelTop.center = CGPointMake(tunnelTop.center.x -1, tunnelTop.center.y);
    tunnelBottom.center = CGPointMake(tunnelBottom.center.x -1 , tunnelBottom.center.y);
    
    if (tunnelTop.center.x < -25) {
        [self placeTunnels];                //tunneltop is gone, tunnelbottom will be replaced as well.
    }
    
    if(tunnelTop.center.x ==  35){          //bird flew throught the gap
        [self score];
    }
    
    if (CGRectIntersectsRect(bird.frame, tunnelTop.frame)) {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(bird.frame, tunnelBottom.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(bird.frame, top.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(bird.frame, bottom.frame)){
        [self GameOver];
    }
    
}

-(void)placeTunnels{                                                        //listen to video 13.39mins
    
    randomTopTunnelPosition = arc4random() % 301; //501
    randomTopTunnelPosition = randomTopTunnelPosition - 150;
    randomBottomTunnelPosition = randomTopTunnelPosition + 600; //636
    
    tunnelTop.center = CGPointMake(self.view.frame.size.width + 25, randomTopTunnelPosition);
    tunnelBottom.center = CGPointMake(self.view.frame.size.width + 25, randomBottomTunnelPosition);
    
}

-(void)birdMoving{
    
    bird.center = CGPointMake(bird.center.x, bird.center.y - birdFlight); //negative to move upwards on the screen?
    
    birdFlight = birdFlight - 5;
    
    if (birdFlight < -15) {
        birdFlight = -15;
    }
    
    if (birdFlight > 0) {
        bird.image = [UIImage imageNamed:@"BirdUp.PNG"];
    }
    else if (birdFlight < 0){
        bird.image = [UIImage imageNamed:@"BirdDown.PNG"];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    birdFlight = 20; //30
    
}


- (void)viewDidLoad {
    
    tunnelTop.hidden = YES;
    tunnelBottom.hidden = YES;
    
    exit.hidden = YES;
    scoreNumber = 0;
    
    highScoreNumber = [[NSUserDefaults standardUserDefaults]integerForKey:@"highScoreSaved"];
    
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
