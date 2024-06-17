//
//  Ball.h
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "cocos2d.h"
#import "Brick.h"
#import "Block.h"

@interface Ball : CCSprite

@property(nonatomic) CGPoint velocity;
@property (nonatomic) float radio;

- (void)move:(ccTime)instant;
- (void)brickContact:(Brick * )brick;
- (int)blockContact:(NSMutableArray *)blocks;

@end
