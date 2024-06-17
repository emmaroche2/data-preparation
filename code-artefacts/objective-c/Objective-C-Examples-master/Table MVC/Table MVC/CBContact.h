//
//  CBContact.h
//  TableMVC
//
//  Created by Carlos on 12/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBContact : NSObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * phone;
@property (strong, nonatomic) NSString * email;

- (id) initWithName: (NSString *) name email: (NSString *) email phone: (NSString *) phone;

@end
