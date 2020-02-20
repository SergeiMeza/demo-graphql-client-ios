import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Kingfisher

protocol SongPreviewCellDelegate: class {
  func didTapToPlay(cell: SongPreviewCell)
  func didTapToPause(cell: SongPreviewCell)
  func didTapToChooseSong(cell: SongPreviewCell)
}

class SongPreviewCell: BaseListCollectionViewCell<AppleMusicAPIClient.Song> {
  
  weak var delegate: SongPreviewCellDelegate?
  
  private let disposeBag = DisposeBag()
  
  let playImage = UIImage(systemName: "play.fill") // ?.boldLarge
  let pauseImage = UIImage(systemName: "pause.fill") // ?.boldLarge
  let checkImage = UIImage(systemName: "checkmark") // ?.black
  
  lazy var nameLabel = UILabel(text: "", style: .headline)
  lazy var artistNameLabel = UILabel(text: "", style: .caption1)
  lazy var timeLabel = UILabel(text: "", style: .caption1)
  
  lazy var songImageView = UIImageView()
  lazy var playImageView = UIImageView()
  
  lazy var checkButton = UIButton(type: .custom)
  
  var isPlaying = false
  
  lazy var mainStackView = UIStackView(arrangedSubviews: [], axis: .horizontal, spacing: 16, alignment: .center, distribution: .fillProportionally)
  lazy var labelsStackView = UIStackView(arrangedSubviews: [], axis: .vertical, spacing: 8, alignment: .leading, distribution: .fill)
  
  override func setupSubviews() {
    contentView.addSubview(mainStackView)
    mainStackView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(16)
    }
    
    let labels = [nameLabel, artistNameLabel, timeLabel]
    mainStackView.addArrangedSubviews([songImageView, labelsStackView, checkButton])
    labelsStackView.addArrangedSubviews(labels)
    songImageView.snp.makeConstraints { make in
      make.width.equalTo(self.songImageView.snp.height)
    }
    songImageView.cornerRadius = 8
    songImageView.contentMode = .scaleAspectFill
    songImageView.clipsToBounds = true
    songImageView.addSubview(playImageView)
    
    playImageView.snp.makeConstraints { make in
      make.size.equalTo(28)
      make.center.equalToSuperview()
    }
    playImageView.contentMode = .scaleAspectFit
    playImageView.image = playImage
    playImageView.tintColor = .white
    
    checkButton.setImage(checkImage, for: .normal)
    checkButton.contentMode = .scaleAspectFit
    checkButton.tintColor = .white
    checkButton.backgroundColor = .systemRed
    checkButton.cornerRadius = 4
    checkButton.snp.makeConstraints { make in
      make.height.equalTo(40)
      make.width.equalTo(60)
    }
    
    [artistNameLabel, timeLabel].forEach {
      if #available(iOS 13.0, *) {  $0.textColor = UIColor.secondaryLabel } else { $0.textColor = UIColor.lightGray }
    }
    
    let tapGesture = UITapGestureRecognizer()
    addGestureRecognizer(tapGesture)
    
    tapGesture.rx.event.subscribe { [weak self] _ in
      self?.onTapToPlay()
    }.disposed(by: disposeBag)
    
    checkButton.rx.tap.subscribe { [weak self] _ in
      self?.onTapToSelect()
    }.disposed(by: disposeBag)
    
    checkButton.isHidden = true
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.isPlaying = false
  }
  
  func onTapToPlay() {
    if isPlaying {
      delegate?.didTapToPause(cell: self)
    } else {
      delegate?.didTapToPlay(cell: self)
    }
  }
  
  func onTapToSelect() {
    delegate?.didTapToChooseSong(cell: self)
  }
  
  override func bindUI() {
    guard let modelItem = modelItem else { return }
    self.nameLabel.text = modelItem.name
    self.artistNameLabel.text = modelItem.artistName
    self.timeLabel.text = "00:30"
    songImageView.kf.setImage(with: modelItem.imageURL)
    playImageView.image = isPlaying ? pauseImage : playImage
    checkButton.isHidden = isPlaying ? false : true
  }
  
  func updateUI() {
    playImageView.image = isPlaying ? pauseImage : playImage
    checkButton.isHidden = isPlaying ? false : true
  }
}
