import UIKit
import SnapKit
import Kingfisher

class AlbumHeaderCell: BaseListCollectionViewCell<AppleMusicAPIClient.Album> {
  lazy var albumImageView = UIImageView()
  
  lazy var nameLabel = UILabel(text: "", style: .headline)
  lazy var authorNameLabel = UILabel(text: "", style: .subheadline)
  lazy var albumDescriptionLabel = UILabel(text: "", style: .subheadline)
  
  lazy var seeAuthorButton = UIButton(type: .custom)
  lazy var listenOnAppleMusicButton = UIButton(type: .system)
  
  lazy var mainStackView = UIStackView(arrangedSubviews: [], axis: .horizontal, spacing: 16, alignment: .fill, distribution: .fillProportionally)
  
  let wrapperContentView = UIView()
  
  lazy var labelsStackView = UIStackView(arrangedSubviews: [], axis: .vertical, spacing: 8, alignment: .leading, distribution: .equalSpacing)
  
  override func setupSubviews() {
   contentView.addSubview(mainStackView)
    mainStackView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(16)
    }
    mainStackView.addArrangedSubviews([albumImageView, wrapperContentView])
    
    wrapperContentView.addSubview(labelsStackView)
    wrapperContentView.addSubview(listenOnAppleMusicButton)
    
    labelsStackView.addArrangedSubviews([nameLabel, authorNameLabel, albumDescriptionLabel])
    albumImageView.snp.makeConstraints { make in
      make.size.equalTo(80)
    }
    albumImageView.cornerRadius = 4
    albumImageView.contentMode = .scaleAspectFill
    authorNameLabel.textColor = UIColor.systemPink
    [albumDescriptionLabel].forEach {
      if #available(iOS 13.0, *) {  $0.textColor = UIColor.secondaryLabel } else { $0.textColor = UIColor.lightGray }
    }
  }
  
  override func bindUI() {
    guard let modelItem = modelItem else { return }
    self.nameLabel.text = modelItem.name
    self.authorNameLabel.text = modelItem.artistName
    self.albumDescriptionLabel.text = modelItem.genres[safe: 0] ?? "" // + " • " + modelItem.date
    albumImageView.kf.setImage(with: modelItem.imageURL)
  }
}
