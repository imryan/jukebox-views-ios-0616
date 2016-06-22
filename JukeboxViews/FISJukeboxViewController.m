//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by Ryan Cohen on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "FISPlaylist.h"

@interface FISJukeboxViewController ()

@property (nonatomic, strong) FISPlaylist *playlist;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (weak, nonatomic) IBOutlet UITextField *trackTextField;
@property (weak, nonatomic) IBOutlet UITextView *playlistTextView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *playlistFilterControl;

- (IBAction)stop:(id)sender;
- (IBAction)play:(id)sender;
- (IBAction)filter:(id)sender;

@end

@implementation FISJukeboxViewController

#pragma mark - Actions

- (IBAction)play:(id)sender {
    if ([self.trackTextField.text isEqualToString:@""]) {
        self.trackTextField.text = @"1";
    }
    
    FISSong *song = [self.playlist songForTrackNumber:[self.trackTextField.text integerValue]];
    [self setUpAVAudioPlayerWithFileName:song.filename];
    [self.audioPlayer play];
    
    self.trackTextField.text = @"";
    self.trackTextField.placeholder = [NSString stringWithFormat:@"%@", song.title];
    
    [self.view endEditing:YES];
}

- (IBAction)stop:(id)sender {
    if (self.audioPlayer.isPlaying) {
        [self.audioPlayer stop];
    }
    
    [self.view endEditing:YES];
}

- (IBAction)filter:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    NSString *filter = [control titleForSegmentAtIndex:control.selectedSegmentIndex];
    
    [self.playlist sortSongsBy:filter];
    [self updateTextView];
    
    [self.view endEditing:YES];
}

#pragma mark - Helpers

- (void)updateTextView {
    self.playlistTextView.text = self.playlist.text;
}

- (void)setUpAVAudioPlayerWithFileName:(NSString *)fileName {
    NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
    NSError *error = nil;
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    if (!self.audioPlayer) {
        NSLog(@"Error in audioPlayer: %@", error.localizedDescription);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playlist = [FISPlaylist new];
    self.playlistTextView.text = self.playlist.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
