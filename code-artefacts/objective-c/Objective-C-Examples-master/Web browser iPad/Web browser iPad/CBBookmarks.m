//
//  CBMarcador.m
//  Navegador iPad
//
//  Created by Carlos on 07/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBBookmarks.h"

@implementation CBBookmarks

- (id)initWithTitle:(NSString *)title URL:(NSString *)url
{
    if (self=[super init]) {
        self.title = title;
        self.url = url;
    }
    
    return self;
}

@end
