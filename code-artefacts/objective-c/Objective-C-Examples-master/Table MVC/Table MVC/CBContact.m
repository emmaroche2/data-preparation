//
//  CBContact.m
//  TableMVC
//
//  Created by Carlos on 12/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBContact.h"

@implementation CBContact

- (id)initWithName:(NSString *)name email:(NSString *)email phone:(NSString *)phone 
{
    if (self = [super init]) {
        _name = name;
        _email = email;
        _phone = phone;
    }
    
    return self;
}

@end
