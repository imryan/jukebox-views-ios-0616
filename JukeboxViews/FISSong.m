//
//  FISSong.m
//  JukeboxViews
//
//  Created by Ryan Cohen on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISSong.h"

@implementation FISSong

- (instancetype)init {
    return [self initWithTitle:@"" artist:@"" album:@"" filename:@""];
}

- (instancetype)initWithTitle:(NSString *)title
                       artist:(NSString *)artist
                        album:(NSString *)album
                     filename:(NSString *)filename {
    
    self = [super init];
    
    if (self) {
        _title = title;
        _artist = artist;
        _album = album;
        _filename = filename;
    }
    
    return self;
}

@end
