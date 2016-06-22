//
//  FISPlaylist.h
//  JukeboxViews
//
//  Created by Ryan Cohen on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISSong.h"

@interface FISPlaylist : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSMutableArray *songs;

- (FISSong *)songForTrackNumber:(NSUInteger)trackNumber;

- (void)sortSongsByTitle;
- (void)sortSongsByArtist;
- (void)sortSongsByAlbum;

- (void)sortSongsBy:(NSString *)filter;

@end
