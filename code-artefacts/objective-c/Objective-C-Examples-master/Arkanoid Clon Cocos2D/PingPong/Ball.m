//
//  Ball.m
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "Ball.h"
#import "Block.h"

@implementation Ball

@synthesize velocity;

- (float)radio 
{
    return self.texture.contentSize.width / 2;
}

- (void)move:(ccTime)instant 
{
    
	self.position = ccpAdd(self.position, ccpMult(self.velocity, instant));
    
	if (self.position.x > 320 - self.radio) {
		[self setPosition: ccp( 320 - self.radio, self.position.y)];
		velocity.x *= -1;
	} else if (self.position.x < self.radio) {
		[self setPosition: ccp(self.radio, self.position.y)];
		velocity.x *= -1;
	} else if (self.position.y > 480 - self.radio){
        [self setPosition: ccp( self.position.x, 480 - self.radio)];
		velocity.y *= -1;
	 }
}

- (void)brickContact:(Brick * )brick 
{
    CGRect paddleRect = brick.rect;
    paddleRect.origin.x += brick.position.x;
    paddleRect.origin.y += brick.position.y;
    float lowY = CGRectGetMinY(paddleRect);
    float midY = CGRectGetMidY(paddleRect);
    float highY = CGRectGetMaxY(paddleRect);
    float leftX = CGRectGetMinX(paddleRect);
    float rightX = CGRectGetMaxX(paddleRect);
    
	if (self.position.x > leftX && self.position.x < rightX) {
		BOOL contact = NO;
		float angleOffset = 0.0f;
        
		if (self.position.y > midY && self.position.y <= highY + self.radio) {
			self.position = CGPointMake(self.position.x, highY + self.radio);
			contact = YES;
			angleOffset = (float)M_PI / 2;
		} else if (self.position.y < midY && self.position.y >= lowY - self.radio) {
			self.position = CGPointMake(self.position.x, lowY - self.radio);
			contact = YES;
			angleOffset = -(float)M_PI / 2;
		}
        
		if (contact) {
			float contactAngle = ccpToAngle(ccpSub(brick.position, self.position)) + angleOffset;
			float angle = -ccpToAngle(self.velocity) + 0.5f * contactAngle;
			self.velocity = ccpMult(ccpForAngle(angle), ccpLength(self.velocity));
        	}
	}
}

- (int)blockContact:(NSMutableArray *)blocks 
{
    int tag=0;
    
    for(int i=0;i<blocks.count;i++){
        
        Block * block = [blocks objectAtIndex:i];
        
        CGRect paddleRect = block.rect;
        paddleRect.origin.x += block.position.x;
        paddleRect.origin.y += block.position.y;
        
        float lowY = CGRectGetMinY(paddleRect);
        float midY = CGRectGetMidY(paddleRect);
        float highY = CGRectGetMaxY(paddleRect);
        
        float leftX = CGRectGetMinX(paddleRect);
        float rightX = CGRectGetMaxX(paddleRect);
        
        if (self.position.x > leftX && self.position.x < rightX) {
            
            BOOL contact = NO;
            float angleOffset = 0.0f;
            
            if (self.position.y > midY && self.position.y <= highY + self.radio) {
                self.position = CGPointMake(self.position.x, highY + self.radio);
                contact = YES;
                angleOffset = (float)M_PI / 2;
            } else if (self.position.y < midY && self.position.y >= lowY - self.radio) {
                self.position = CGPointMake(self.position.x, lowY - self.radio);
                contact = YES;
                angleOffset = -(float)M_PI / 2;
            }
            
            if (contact) {
                
                tag=(int)block.tag;

                //change the ball direction on touch with block
                float contactAngle = ccpToAngle(ccpSub(block.position, self.position)) + angleOffset;
                float angle = -ccpToAngle(self.velocity) + 0.5f * contactAngle;
                self.velocity = ccpMult(ccpForAngle(angle), ccpLength(self.velocity));
                
                //end bucle
                i=(int)blocks.count;
                [blocks removeObject:block];  //delete touch block from array
            }
        }
    }
    return tag;  //return block touched
}

@end
