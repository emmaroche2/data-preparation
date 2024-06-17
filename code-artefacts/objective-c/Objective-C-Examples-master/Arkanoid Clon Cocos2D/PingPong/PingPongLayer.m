//
//  PingPongLayer.m
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "PingPongLayer.h"
#import "Score.h"

@implementation PingPongLayer 
{
    int percentDestroyedBlocks; //score percent
    NSString * destroyed;
    NSUserDefaults *userDefaults;  //to save score
}

- (id)init 
{
    destroyed =@"%"; //score percent
    if ((self = [super init]) == nil) {
    	return nil;
    }
    
    //add background
    CCSprite * background = [[[CCSprite alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:@"background.png"]] autorelease];
    background.position = CGPointMake(160.0f, 240.0f);
    [self addChild:background];
    
    //game parameters, this is for score game
    userDefaults = [NSUserDefaults standardUserDefaults];
    percentDestroyedBlocks = 0; //score
   
    //add blocks
    //from top to bottom 3-3 until fill all the screen
    self.blocks = [[NSMutableArray alloc] initWithCapacity:48];
    
    //blocks colors
    NSArray *myArray = @[@"red_block.png", @"green_block.png", @"blue_block.png"];
    
    //cell color
    int k=0;
    int tag=0; //block identifier
    int moveHorizontal=0;
    int moveVertical=0;
    
    for(int i = 0; i < 6; i++) {
        moveHorizontal=moveHorizontal+52;
        moveVertical=0;
        
        for(int j = 0; j < 8; j++) {
            tag++;
            self.block = [[[Block alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:[myArray objectAtIndex:k]]] autorelease];
            self.block.position = ccp(-22+moveHorizontal, 465-moveVertical);
            self.block.tag = tag;  //block identifier
            [self.blocks addObject:self.block];
            [self addChild:self.block]; //add block to screen
            moveVertical=moveVertical+22;
            
            if ([myArray lastObject]==[myArray objectAtIndex:k]) {
                k=0;
            } else {
                k++;
            }
        }
    }
    
    //Añadimos una pelota
    self.ball = [[[Ball alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:@"ball.png"]] autorelease];
    self.ball.position = CGPointMake(160.0f, 240.0f);
    self.ball.velocity = CGPointMake(100.0f, -400.0f);
    [self addChild:self.ball];
    
    //Añadimos la raqueta
    self.brick = [[[Brick alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:@"brick.png"]] autorelease];
    self.brick.position = CGPointMake(160, 25);
    self.brick.caught = NO;
    [self addChild:self.brick];
    [self schedule:@selector(animation:)];
    
    return self;
}

- (void)animation:(ccTime)instante 
{
    int tagblock;  //block id when touch the ball
    [self.ball move:instante];
    [self.ball brickContact:self.brick];
    tagblock=[self.ball blockContact:self.blocks];
    
    if (tagblock!=0) {
        [self removeChildByTag:tagblock cleanup:YES];  //block delete when touch the ball
    }
    
    if (self.blocks.count==0) { //if blocks in screen is equal to zero
        percentDestroyedBlocks = 100; //score is equal to 100%
        
        //get data and show the score screen
        [userDefaults setValue:[[NSString alloc] initWithFormat:@"You win!"]  forKey:@"text"];
        [userDefaults setValue:[[NSString alloc] initWithFormat:@"%d %@ ",percentDestroyedBlocks, destroyed]  forKey:@"percent"];
        [userDefaults synchronize];
        percentDestroyedBlocks = 0; //reload score
        
        //score scene
        [[CCDirector sharedDirector] pushScene:[Score scene]]; //call score scene
    }
    
    if (self.ball.position.y < self.ball.radio){  //if ball lose in bottom we lose
        
        percentDestroyedBlocks = (int)((48 - self.blocks.count) * 100)/48; //get the percent score before lose
        
        //get data and show the score screen
        [userDefaults setValue:[[NSString alloc] initWithFormat:@"Game over!"]  forKey:@"text"];
        [userDefaults setValue:[[NSString alloc] initWithFormat:@"%d %@ ",percentDestroyedBlocks, destroyed]  forKey:@"percent"];
        [userDefaults synchronize];
        percentDestroyedBlocks = 0;  //reload score
        
        [[CCDirector sharedDirector] pushScene:[Score scene]];  //call score scene
    }
}

+ (CCScene *)scene 
{
    CCScene * arkanoidScene = [[CCScene alloc] init];
    [arkanoidScene addChild:[self node]];
    return arkanoidScene;
}

@end
