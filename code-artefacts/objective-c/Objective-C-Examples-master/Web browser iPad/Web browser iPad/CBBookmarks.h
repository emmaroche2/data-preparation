//
//  CBMarcador.h
//  Navegador iPad
//
//  Created by Carlos on 07/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBBookmarks : NSObject

@property (strong) NSString *title;
@property (strong) NSString *url;

- (id)initWithTitle:(NSString *)title URL:(NSString *)url;

@end
