import UIKit
import SnapKit
import Kingfisher

class PlaylistPreviewCell: BaseListCollectionViewCell<AppleMusicAPIClient.Playlist> {
  lazy var nameLabel = UILabel(text: "", style: .headline)
  lazy var curatorNameLabel = UILabel(text: "", style: .caption1)
  lazy var playlistImageView = UIImageView()
  
  lazy var mainStackView = UIStackView(arrangedSubviews: [], axis: .horizontal, spacing: 16, alignment: .center, distribution: .fillProportionally)
  lazy var labelsStackView = UIStackView(arrangedSubviews: [], axis: .vertical, spacing: 8, alignment: .leading, distribution: .fill)
  
  override func setupSubviews() {
   contentView.addSubview(mainStackView)
    mainStackView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(16)
    }
    mainStackView.addArrangedSubviews([playlistImageView, labelsStackView])
    labelsStackView.addArrangedSubviews([nameLabel, curatorNameLabel])
    playlistImageView.snp.makeConstraints { make in
      make.size.equalTo(60)
    }
    playlistImageView.cornerRadius = 4
    playlistImageView.contentMode = .scaleAspectFill
    [curatorNameLabel].forEach {
      if #available(iOS 13.0, *) {  $0.textColor = UIColor.secondaryLabel } else { $0.textColor = UIColor.lightGray }
    }
  }
  
  override func bindUI() {
    guard let modelItem = modelItem else { return }
    self.nameLabel.text = modelItem.name
    self.curatorNameLabel.text = modelItem.curatorName
    playlistImageView.kf.setImage(with: modelItem.imageURL)
  }
}
