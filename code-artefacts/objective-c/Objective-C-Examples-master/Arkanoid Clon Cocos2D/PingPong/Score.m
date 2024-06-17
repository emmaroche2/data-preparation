//
//  Resultados.m
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "Score.h"
#import "AppDelegate.h"
#import "HelloWorldLayer.h"

@implementation Score

+ (CCScene *)scene 
{
    CCScene * scoreScene = [[CCScene alloc] init];
    [scoreScene addChild:[self node]];
    return scoreScene;
}

// on "init" you need to initialize your instance
- (id) init 
{
    // always call "super" init
    // Apple recommends to re-assign "self" with the "super's" return value
    if ((self=[super init])) {
	CGSize size = [[CCDirector sharedDirector] winSize];
        
        //add background
        CCSprite * background = [[[CCSprite alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:@"blackBackground.png"]] autorelease];
        
        background.position = CGPointMake(160.0f, 240.0f);
        
        [self addChild:background];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        //screen score
	CCLabelTTF *label = [CCLabelTTF labelWithString:[userDefaults valueForKey:@"text"] fontName:@"AppleGothic" fontSize:36];
	label.position =  ccp( size.width /2 , size.height/2 + 40);
	[self addChild: label];
 
        //message with percent score
	label = [CCLabelTTF labelWithString: [userDefaults valueForKey:@"percent"] fontName:@"AppleGothic" fontSize:32];
        label.position =  ccp( size.width /2 , size.height/2 - 30);
	[self addChild: label];
        
        //add message 'destroyed'
	label = [CCLabelTTF labelWithString:@"Destroyed" fontName:@"AppleGothic" fontSize:24];
        label.position =  ccp( size.width /2 , size.height/2 - 70);
	[self addChild: label];

        //add menu
	[CCMenuItemFont setFontSize:28];
        
	CCMenuItem *itemJugar = [CCMenuItemFont itemWithString:@"Replay" block:^(id sender) {
			
        //go to replay game
	[[CCDirector sharedDirector] pushScene:[HelloWorldLayer scene]];
            
        //reset score values
        [userDefaults setValue:[[NSString alloc] initWithFormat:@""] forKey:@"text"];
        [userDefaults setValue:[[NSString alloc] initWithFormat:@""] forKey:@"percent"];
        [userDefaults synchronize];
	}];
        
        CCMenu *menu = [CCMenu menuWithItems:itemJugar,nil];
		
	[menu alignItemsHorizontallyWithPadding:20];
	[menu setPosition:ccp( size.width/2, size.height/2 -  200)];
		
	// Add the menu to the layer
	[self addChild:menu];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc 
{
    // in case you have something to dealloc, do it in this method
    // in this particular example nothing needs to be released.
    // cocos2d will automatically release all the children (Label)
    // don't forget to call "super dealloc"
    [super dealloc];
}

#pragma mark GameKit delegate

- (void) achievementViewControllerDidFinish:(GKGameCenterViewController *)viewController 
{
    AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
    [[app navController] dismissViewControllerAnimated:YES completion:nil];
}

- (void) leaderboardViewControllerDidFinish:(GKGameCenterViewController *)viewController 
{
    AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
    [[app navController] dismissViewControllerAnimated:YES completion:nil];
}

@end
