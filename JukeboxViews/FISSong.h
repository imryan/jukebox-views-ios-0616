//
//  FISSong.h
//  JukeboxViews
//
//  Created by Ryan Cohen on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSong : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSString *album;
@property (nonatomic, strong) NSString *filename;

- (instancetype)initWithTitle:(NSString *)title
                       artist:(NSString *)artist
                        album:(NSString *)album
                     filename:(NSString *)filename;

@end
