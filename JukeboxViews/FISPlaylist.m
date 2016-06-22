//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Ryan Cohen on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.songs = [self generateSongObjects];
        [self updateTextForSortedArray];
    }
    
    return self;
}

- (void)updateTextForSortedArray {
    NSMutableString *mutableString = [NSMutableString string];
    
    for (NSUInteger i = 0; i < self.songs.count; i++) {
        FISSong *song = self.songs[i];
        [mutableString appendString:[NSString stringWithFormat:@"%lu. (Title) %@ (Artist) %@ (Album) %@\n\n", i+1, song.title, song.artist, song.album]];
    }
    
    self.text = mutableString;
}

- (FISSong *)songForTrackNumber:(NSUInteger)trackNumber {
    if (trackNumber > self.songs.count || trackNumber == 0) {
        return nil;
    }
    
    return self.songs[trackNumber-1];
}

- (void)sortSongsByTitle {
    NSSortDescriptor *sortTitleAsc = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSSortDescriptor *sortArtistAsc = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    
    [self.songs sortUsingDescriptors:@[sortTitleAsc, sortArtistAsc]];
    [self updateTextForSortedArray];
}

- (void)sortSongsByArtist {
    NSSortDescriptor *sortArtistAsc = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    NSSortDescriptor *sortAlbumAsc = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    
    [self.songs sortUsingDescriptors:@[sortArtistAsc, sortAlbumAsc]];
    [self updateTextForSortedArray];
}

- (void)sortSongsByAlbum {
    NSSortDescriptor *sortAlbumAsc = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    NSSortDescriptor *sortTitleAsc = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    
    [self.songs sortUsingDescriptors:@[sortAlbumAsc, sortTitleAsc]];
    [self updateTextForSortedArray];
}

- (void)sortSongsBy:(NSString *)filter {
    if ([filter isEqualToString:@"Title"]) {
        [self sortSongsByTitle];
    } else if ([filter isEqualToString:@"Artist"]) {
        [self sortSongsByArtist];
    } else {
        [self sortSongsByAlbum];
    }
}

- (NSMutableArray *)generateSongObjects {
    NSMutableArray *songs = [NSMutableArray new];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Hold on Be Strong"
                                             artist:@"Matoma vs Big Poppa"
                                              album:@"The Internet 1"
                                           filename:@"hold_on_be_strong"]];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Higher Love"
                                             artist:@"Matoma ft. James Vincent McMorrow"
                                              album:@"The Internet 2"
                                           filename:@"higher_love"]];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Mo Money Mo Problems"
                                             artist:@"Matoma ft. The Notorious B.I.G."
                                              album:@"The Internet 3"
                                           filename:@"mo_money_mo_problems"]];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Old Thing Back"
                                             artist:@"The Notorious B.I.G."
                                              album:@"The Internet 4"
                                           filename:@"old_thing_back"]];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love"
                                             artist:@"Matoma"
                                              album:@"The Internet 5"
                                           filename:@"gangsta_bleeding_love"]];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Bailando"
                                             artist:@"Enrique Iglesias ft. Sean Paul"
                                              album:@"The Internet 6"
                                           filename:@"bailando"]];
    
    return songs;
}

@end
