//
//  HelloWorldLayer.m
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

// Import the interfaces
#import "HelloWorldLayer.h"
#import "AppDelegate.h" // Needed to obtain the Navigation Controller
#import "PingPongLayer.h"

#pragma mark - HelloWorldLayer
// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+ (CCScene *) scene 
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	// add layer as a child to scene
	[scene addChild: layer];
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
- (id) init 
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        	//add background
		CCSprite *background = [[[CCSprite alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:@"blackBackground.png"]] autorelease];
        	background.position = CGPointMake(160.0f, 240.0f);
        	[self addChild:background];
        
        	//add game title
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Arkanoid Clon" fontName:@"AppleGothic" fontSize:42];
		label.position =  ccp( size.width /2 , size.height/2);
		[self addChild: label];
		
        	// add author
		label = [CCLabelTTF labelWithString:@"Carlos Butron" fontName:@"AppleGothic" fontSize:32];
        	label.position =  ccp( size.width /2 , size.height/2 - 50);
		[self addChild: label];

        	//add menu screen
		[CCMenuItemFont setFontSize:28];
		CCMenuItem *itemJugar = [CCMenuItemFont itemWithString:@"Play" block:^(id sender) {
		[[CCDirector sharedDirector] pushScene:[PingPongLayer scene]];
		}];
		
		// Add the menu to the layer
        	CCMenu *menu = [CCMenu menuWithItems:itemJugar,nil];
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 -  200)];
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

@end
