import UIKit

open class PrototypeCollectionViewCell: UICollectionViewCell , Reusable {
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setBackground(color: UIColor.systemBackground)
    setupSubviews()
  }
  
  public required init?(coder: NSCoder) { fatalError() }
  
  open func setupSubviews() { }
  
  open func bindUI() { }
}

// MARK: - LoadingCell
public final class LoadingCell: PrototypeCollectionViewCell {
  public lazy var activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
  
  public override func prepareForReuse() {
    super.prepareForReuse()
    activityIndicatorView.startAnimating()
  }
  
  public override func setupSubviews() {
    super.setupSubviews()
    activityIndicatorView.startAnimating()
    
    activityIndicatorView
      .addTo(view: contentView)
      .makeConstraints { make in
        make.edges.equalToSuperview()
    }
  }
}
