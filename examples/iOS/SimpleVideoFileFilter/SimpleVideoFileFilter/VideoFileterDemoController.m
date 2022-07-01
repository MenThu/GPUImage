//
//  VideoFileterDemoController.m
//  SimpleVideoFileFilter
//
//  Created by menthu on 2022/7/1.
//  Copyright © 2022 Cell Phone. All rights reserved.
//

#import "VideoFileterDemoController.h"
#import "GPUImage.h"

@interface VideoFileterDemoController ()
{
    GPUImageMovie *movieFile;
    GPUImageOutput<GPUImageInput> *filter;
    GPUImageMovieWriter *movieWriter;
    NSTimer * timer;
}

@end

@implementation VideoFileterDemoController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static NSUInteger index = 0;
    if (++index % 8 == 0) {
        index = 0;
    }
    GPUImageView *filterView = (GPUImageView *)self.view;
    [filterView setInputRotation:(GPUImageRotationMode)index atIndex:0];
    NSLog(@"rotation=[%d]", (GPUImageRotationMode)index);
}

/*
 {
     kGPUImageNoRotation,
     kGPUImageRotateLeft,
     kGPUImageRotateRight,
     kGPUImageFlipVertical,
     kGPUImageFlipHorizonal,
     kGPUImageRotateRightFlipVertical,
     kGPUImageRotateRightFlipHorizontal,
     kGPUImageRotate180
 }
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view from its nib.
    
//    NSURL *sampleURL = [[NSBundle mainBundle] URLForResource:@"sample_iPod" withExtension:@"m4v"];
    
//    [[NSBundle mainBundle] path]
    
    /*
     normal_hor_video.MOV
     normal_ver_video.MP4
     RPReplay_Final1647349830.MP4
     
     bug_video.MP4
     */
    NSURL *sampleURL = [[NSBundle mainBundle] URLForResource:@"bug_video" withExtension:@"MP4"];
    
    movieFile = [[GPUImageMovie alloc] initWithURL:sampleURL];
    movieFile.runBenchmark = YES;
    movieFile.playAtActualSpeed = YES;
//    filter = [[GPUImagePixellateFilter alloc] init];
//    filter = [[GPUImageUnsharpMaskFilter alloc] init];
    
//    [movieFile addTarget:filter];

    // Only rotate the video for display, leave orientation the same for recording
    GPUImageView *filterView = (GPUImageView *)self.view;
    [filterView setInputRotation:kGPUImageRotateLeft atIndex:0];
    [movieFile addTarget:filterView];

    // In addition to displaying to the screen, write out a processed version of the movie to disk
//    NSString *pathToMovie = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Movie.m4v"];
//    unlink([pathToMovie UTF8String]); // If a file already exists, AVAssetWriter won't let you record new frames, so delete the old movie
//    NSURL *movieURL = [NSURL fileURLWithPath:pathToMovie];

//    movieWriter = [[GPUImageMovieWriter alloc] initWithMovieURL:movieURL size:CGSizeMake(640.0, 480.0)];
//    [filter addTarget:movieWriter];

    // Configure this for video from the movie file, where we want to preserve all video frames and audio samples
//    movieWriter.shouldPassthroughAudio = YES;
//    movieFile.audioEncodingTarget = movieWriter;
//    [movieFile enableSynchronizedEncodingUsingMovieWriter:movieWriter];
    
//    [movieWriter startRecording];
    [movieFile startProcessing];
    
//    timer = [NSTimer scheduledTimerWithTimeInterval:0.3f
//                                             target:self
//                                           selector:@selector(retrievingProgress)
//                                           userInfo:nil
//                                            repeats:YES];
    
//    [movieWriter setCompletionBlock:^{
//        [filter removeTarget:movieWriter];
//        [movieWriter finishRecording];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [timer invalidate];
//            self.progressLabel.text = @"100%";
//        });
//    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
