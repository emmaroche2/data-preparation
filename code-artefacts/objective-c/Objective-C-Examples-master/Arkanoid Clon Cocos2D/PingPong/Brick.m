//
//  Raqueta.m
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "Brick.h"

@implementation Brick

- (CGRect)rectInPixels
{
	CGSize s = [self.texture contentSizeInPixels];
	return CGRectMake(-s.width / 2, -s.height / 2, s.width, s.height);
}

- (CGRect)rect
{
	CGSize s = [self.texture contentSize];
	return CGRectMake(-s.width / 2, -s.height / 2, s.width, s.height);
}

#pragma mark - Métodos delegados del protocolo CCTouchOneByOneDelegate

- (void)onEnter
{
	CCDirector *director =  [CCDirector sharedDirector];
	[[director touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	[super onEnter];
}

- (void)onExit
{
	CCDirector *director = [CCDirector sharedDirector];
	[[director touchDispatcher] removeDelegate:self];
	[super onExit];
}

- (BOOL)containsTouchLocation:(UITouch *)touch
{
	CGPoint p = [self convertTouchToNodeSpaceAR:touch];
	CGRect r = [self rectInPixels];
	return CGRectContainsPoint(r, p);
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	if (self.caught) return NO;
	if (![self containsTouchLocation:touch]) return NO;
	self.caught = YES;
	return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint coordinates = [touch locationInView:[touch view]];
	coordinates = [[CCDirector sharedDirector] convertToGL:coordinates];
	self.position = CGPointMake(coordinates.x, self.position.y);
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	self.caught = NO;
}

@end
