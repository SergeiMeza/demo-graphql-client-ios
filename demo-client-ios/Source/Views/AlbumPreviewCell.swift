import UIKit
import SnapKit
import Kingfisher

class AlbumPreviewCell: BaseListCollectionViewCell<AppleMusicAPIClient.Album> {
  lazy var nameLabel = UILabel(text: "", style: .headline)
  lazy var authorNameLabel = UILabel(text: "", style: .caption1)
  lazy var albumImageView = UIImageView()
  
  lazy var mainStackView = UIStackView(arrangedSubviews: [], axis: .horizontal, spacing: 16, alignment: .center, distribution: .fillProportionally)
  lazy var labelsStackView = UIStackView(arrangedSubviews: [], axis: .vertical, spacing: 8, alignment: .leading, distribution: .fill)
  
  override func setupSubviews() {
   contentView.addSubview(mainStackView)
    mainStackView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(16)
    }
    mainStackView.addArrangedSubviews([albumImageView, labelsStackView])
    labelsStackView.addArrangedSubviews([nameLabel, authorNameLabel])
    albumImageView.snp.makeConstraints { make in
      make.size.equalTo(60)
    }
    albumImageView.cornerRadius = 4
    albumImageView.contentMode = .scaleAspectFill
    [authorNameLabel].forEach {
      $0.textColor = UIColor.secondaryLabel
    }
  }
  
  override func bindUI() {
    guard let modelItem = modelItem else { return }
    self.nameLabel.text = modelItem.name
    self.authorNameLabel.text = modelItem.artistName
    albumImageView.kf.setImage(with: modelItem.imageURL)
  }
}
