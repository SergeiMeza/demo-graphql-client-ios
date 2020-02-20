import AVFoundation
import AVKit
import RxSwift
import RxCocoa

public class MusicManager {
  
  public static let shared = MusicManager()
  
  private let disposeBag = DisposeBag()
  
  lazy var avAsset = AVAsset()
  lazy var avPlayer = AVQueuePlayer()
  var playerLooper: AVPlayerLooper?
  
  public var isPlaying = false
  
  public var currentlyPlayingSong: AppleMusicAPIClient.Song?
  public var currentlyPlayingMusicVideo: AppleMusicAPIClient.MusicVideo?
  
  public var selectedSong: AppleMusicAPIClient.Song?
  
  public func selectSong(song: AppleMusicAPIClient.Song) {
    self.selectedSong = song
    NotificationCenter.default.post(name: .MusicManagerDidSelectSong, object: song)
  }
  
  public func play(songPreview song: AppleMusicAPIClient.Song, loop: Bool = false) {
    currentlyPlayingSong = song
    NotificationCenter.default.post(name: .MusicManagerDidChangeSong, object: song)
    avPlayer.pause()
    avAsset = AVAsset(url: song.previewURL)
    let avPlayerItem = AVPlayerItem(asset: avAsset)
    avPlayer = AVQueuePlayer(playerItem: avPlayerItem)
    if loop {
      playerLooper = AVPlayerLooper(player: avPlayer, templateItem: avPlayerItem)
    }
    avPlayer.play()
    isPlaying = true
    NotificationCenter.default.post(name: .CameraViewControllerNeedsUpdate, object: nil)
    NotificationCenter.default.rx.notification(.AVPlayerItemDidPlayToEndTime, object: avPlayerItem).subscribe { event in
      if !loop {
        NotificationCenter.default.post(name: .MusicManagerDidFinishPlayingSong, object: song)
      }
    }.disposed(by: disposeBag)
  }
  
  public func play(musicVideoPreview musicVideo: AppleMusicAPIClient.MusicVideo) {
    currentlyPlayingMusicVideo = musicVideo
    avPlayer.pause()
    avAsset = AVAsset(url: musicVideo.hlsPreviewURL ?? musicVideo.previewURL)
    let avPlayerItem = AVPlayerItem(asset: avAsset)
    avPlayer = AVQueuePlayer(playerItem: avPlayerItem)
    let previewController = AVPlayerViewController()
    previewController.player = avPlayer
    playerLooper = AVPlayerLooper(player: avPlayer, templateItem: avPlayerItem)
    UIApplication.shared.windows[safe: 0]?.rootViewController?.present(previewController, animated: true) { [weak self] in
      self?.avPlayer.play()
    }
    isPlaying = true
  }
  
  public func stop() {
    avPlayer.pause()
    isPlaying = false
    currentlyPlayingSong = nil
    currentlyPlayingMusicVideo = nil
  }
  
  public func play(avAsset asset: AVAsset) {
    
  }
}
