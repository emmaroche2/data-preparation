//
//  PingPongLayer.h
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "cocos2d.h"
#import "Ball.h"
#import "Brick.h"
#import "Block.h"

@interface PingPongLayer : CCLayer

@property (nonatomic,retain) Ball *ball;
@property (nonatomic,retain) Brick *brick;
@property (nonatomic,retain) Block *block;
@property(nonatomic,retain) NSMutableArray *blocks;

+ (CCScene *)scene;
    
@end
