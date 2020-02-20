import UIKit
import SnapKit
import Kingfisher

class MusicVideoPreviewCell: BaseListCollectionViewCell<AppleMusicAPIClient.MusicVideo> {
  lazy var nameLabel = UILabel(text: "", style: .headline)
  lazy var artistNameLabel = UILabel(text: "", style: .caption1)
  lazy var videoImageView = UIImageView()
  
  lazy var mainStackView = UIStackView(arrangedSubviews: [], axis: .vertical, spacing: 8)
  
  override func setupSubviews() {
    contentView.addSubview(mainStackView)
    mainStackView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(8)
    }
    mainStackView.addArrangedSubviews([videoImageView, nameLabel, artistNameLabel])
    videoImageView.cornerRadius = 8
    videoImageView.clipsToBounds = true
    videoImageView.contentMode = .scaleAspectFill
    [artistNameLabel].forEach {
      $0.textColor = UIColor.secondaryLabel
    }
  }
  
  override func bindUI() {
    guard let modelItem = modelItem else { return }
    self.nameLabel.text = modelItem.name
    self.artistNameLabel.text = modelItem.artistName
    videoImageView.kf.setImage(with: modelItem.imageURL)
  }
}
