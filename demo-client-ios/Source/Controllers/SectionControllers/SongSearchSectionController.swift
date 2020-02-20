import UIKit
import UIComponents
import IGListKit
import RxSwift
import RxCocoa

class SongSearchSectionController: ListBindingSectionController<AppleMusicAPIClient.SongSearch>, ListBindingSectionControllerDataSource {
  
  override init() {
    super.init()
    dataSource = self
    setupListeners()
  }

  private let disposeBag = DisposeBag()
  
  var currentlyPlayingSong: AppleMusicAPIClient.Song? = nil
  var currentlyPlayingCell: SongPreviewCell? = nil
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
    guard let object = object as? AppleMusicAPIClient.SongSearch else { fatalError() }
    return object.songs
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
    guard let collectionContext = collectionContext else { fatalError() }
    let songPreviewCell = collectionContext.dequeueReusableCell(self, forIndex: index) as SongPreviewCell
    songPreviewCell.delegate = self
    switch viewModel {
    case let viewModel as AppleMusicAPIClient.Song:
      if let currentlyPlayingSong = self.currentlyPlayingSong, viewModel.id == currentlyPlayingSong.id {
        songPreviewCell.isPlaying = true
        songPreviewCell.updateUI()
      }
      return songPreviewCell
    default: fatalError()
    }
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
    guard let width = collectionContext?.containerSize.width else { fatalError() }
    switch viewModel {
    case is AppleMusicAPIClient.Song: return .init(width: width, height: 88)
    default: return .zero
    }
  }
  
  func setupListeners() {
    NotificationCenter.default.rx.notification(.MusicManagerDidFinishPlayingSong).subscribe { [weak self] _ in
      self?.currentlyPlayingCell?.isPlaying = false
      self?.currentlyPlayingCell?.updateUI()
    }.disposed(by: disposeBag)
  }
}

extension SongSearchSectionController: SongPreviewCellDelegate {
  func didTapToPlay(cell: SongPreviewCell) {
    guard let song = cell.modelItem else { return }
    if let currentlyPlayingCell = self.currentlyPlayingCell {
      currentlyPlayingCell.isPlaying = false
      currentlyPlayingCell.updateUI()
    }
    currentlyPlayingCell = cell
    currentlyPlayingSong = song
    MusicManager.shared.play(songPreview: song)
    cell.isPlaying = true
    cell.updateUI()
    
  }
  
  func didTapToPause(cell: SongPreviewCell) {
    MusicManager.shared.stop()
    if self.currentlyPlayingCell != nil {
      cell.isPlaying = false
      cell.updateUI()
    }
    currentlyPlayingCell = nil
    currentlyPlayingSong = nil
  }
  
  func didTapToChooseSong(cell: SongPreviewCell) {
    guard let song = cell.modelItem else { return }
    MusicManager.shared.stop()
    MusicManager.shared.selectSong(song: song)
    viewController?.navigationController?.dismiss(animated: true)
  }
}
