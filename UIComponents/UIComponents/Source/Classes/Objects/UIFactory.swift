import UIKit
import SnapKit
import SwifterSwift

public struct UIFactory {
  
  public static func button() -> UIButton {
    return UIButton(type: .system)
  }
  
  public static func styledButton(backgroundColor: UIColor, title: String) -> UIButton {
    let button = UIButton(type: .system)
    button.tintColor = .white
    button.backgroundColor = backgroundColor
    button.setTitle(title, for: .normal)
    return button
      .font(.systemFont(ofSize: 17, weight: .medium))
  }
  
  public static func textButton(
    title: String,
    font: UIFont = UIFont.systemFont(ofSize: 12, weight: .bold),
    tint: UIColor = .systemBlue) -> UIButton
  {
    return UIButton(type: .system)
      .text(title)
      .tint(tint)
      .font(font)
  }
  
  public static func symbolButton(
    systemName: String,
    size: CGFloat,
    weight: UIFont.Weight,
    tint: UIColor = .systemBlue) -> UIButton
  {
    return UIButton(type: .system)
      .image(symbolImage(systemName: systemName, size: size, weight: weight, tint: tint))
      .tint(tint)
  }
  
  public static func symbolTextButton(
    systemName: String,
    size: CGFloat,
    weight: UIFont.Weight,
    text: String,
    font: UIFont,
    tint: UIColor = .systemBlue) -> UIButton
  {
    return UIButton(type: .system)
      .image(symbolImage(systemName: systemName, size: size, weight: weight, tint: tint))
      .text(text)
      .text(tint)
      .font(font)
      .tint(tint)
  }
  
  public static func label(text: String = "") -> UILabel {
    let label = UILabel()
    label.text = text
    label.numberOfLines = 0
    return label
  }
  
  public static func largeTitle(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 28, weight: .black)
    return label
  }
  
  
  public static func title(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 17, weight: .black)
    return label
  }
  
  public static func headline(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    return label
  }
  
  public static func subheadline(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    label.alpha = 0.6
    return label
  }
  
  public static func paragraph(text: String) -> UILabel {
    let attributedText = NSMutableAttributedString(string: text)
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 2
    attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range:NSMakeRange(0, attributedText.length))
    let label = UILabel()
    label.attributedText = attributedText
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    return label
  }
  
  public static func footnote(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    label.alpha = 0.6
    return label
  }
  
  public static func small(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
    return label
  }
  
  public static func HStack(
    alignment: UIStackView.Alignment = .center,
    distribution: UIStackView.Distribution = .fill,
    spacing: CGFloat = 8,
    _ views: UIView...) -> UIStackView {
    let stack = UIStackView(
      arrangedSubviews: [],
      axis: .horizontal,
      spacing: spacing,
      alignment: alignment,
      distribution: distribution)
    stack.addArrangedSubviews(views)
    return stack
  }
  
  public static func VStack(
    alignment: UIStackView.Alignment = .center,
    distribution: UIStackView.Distribution = .fill,
    spacing: CGFloat = 8,
    _ views: UIView...) -> UIStackView {
    let stack = UIStackView(
      arrangedSubviews: [],
      axis: .vertical,
      spacing: spacing,
      alignment: alignment,
      distribution: distribution)
    stack.addArrangedSubviews(views)
    return stack
  }
  
  public static func line(type: Direction, thikness: CGFloat = 0.5, color: UIColor = UIColor.systemGray3) -> UIView {
    let view = UIView()
    view.backgroundColor = color
    switch type {
    case .vertical:
      view.snp.makeConstraints { make in
        make.width.equalTo(thikness)
        make.height.equalTo(UIScreen.main.bounds.height).priority(.low)
      }
    case .horizontal:
      view.snp.makeConstraints { make in
        make.width.equalTo(UIScreen.main.bounds.width).priority(.low)
        make.height.equalTo(thikness)
      }
    }
    return view
  }
  
  public static func spacer(type: Direction, thikness: CGFloat = 16) -> UIView {
    let view = UIView()
    switch type {
    case .vertical:
      view.snp.makeConstraints { make in
        make.width.equalTo(1.0).priority(.low)
        make.height.equalTo(thikness).priority(.low)
      }
      view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    case .horizontal:
      view.snp.makeConstraints { make in
        make.width.equalTo(thikness).priority(.low)
        make.height.equalTo(1.0).priority(.low)
      }
      view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    return view
  }
  
  public static func symbolView(systemName: String, size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIView {
    let imageView = UIImageView()
      .setContentMode(.scaleAspectFit)
    let image = symbolImage(systemName: systemName, size: size, weight: weight, tint: tint)
    imageView.image = image
    return imageView
      .setFrame(.init(width: size, height: size))
      .setHugging(priority: .defaultLow, for: .horizontal)
      .setHugging(priority: .defaultLow, for: .vertical)
  }
  
  public static func symbolImage(systemName: String, size: CGFloat = 14, weight: UIFont.Weight = .medium, tint: UIColor = .label) -> UIImage {
    let image = UIImage(systemName: systemName)!
      .withConfiguration(UIImage.SymbolConfiguration(font: .systemFont(ofSize: size, weight: weight)))
      .withTintColor(tint, renderingMode: .alwaysOriginal)
    return image
  }
  
  
  public struct Symbol {
    
    
    public struct Image {
      public static func heart(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "heart", size: size, weight: weight, tint: tint)
      }
      
      public static func bubbleLeft(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "bubble.left", size: size, weight: weight, tint: tint)
      }
      
      public static func squareAndArrowUp(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "square.and.arrow.up", size: size, weight: weight, tint: tint)
      }
      
      public static func star(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "star", size: size, weight: weight, tint: tint)
      }
      
      public static func photo(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "photo", size: size, weight: weight, tint: tint)
      }
      
      public static func video(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "video", size: size, weight: weight, tint: tint)
      }
      
      public static func location(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "location", size: size, weight: weight, tint: tint)
      }
      
      public static func paperplane(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "paperplane", size: size, weight: weight, tint: tint)
      }
      
      public static func squareAndPencil(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "square.and.pencil", size: size, weight: weight, tint: tint)
      }
      
      public static func trash(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "trash", size: size, weight: weight, tint: tint)
      }
      
      public static func bookmark(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "bookmark", size: size, weight: weight, tint: tint)
      }
      
      public static func person(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "person", size: size, weight: weight, tint: tint)
      }
      
      public static func person2(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "person.2", size: size, weight: weight, tint: tint)
      }
      
      public static func person3(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "person.3", size: size, weight: weight, tint: tint)
      }
      
      public static func personCropSquare(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "person.crop.square", size: size, weight: weight, tint: tint)
      }
      
      public static func rectangleGrid2x2(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "rectangle.grid.2x2", size: size, weight: weight, tint: tint)
      }
      
      public static func checkmarkSeal(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "checkmark.seal", size: size, weight: weight, tint: tint)
      }
      
      public static func playFill(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "play.fill", size: size, weight: weight, tint: tint)
      }
      
      public static func pauseFill(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "pause.fill", size: size, weight: weight, tint: tint)
      }
      
      public static func stopFill(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "stop.fill", size: size, weight: weight, tint: tint)
      }
      
      public static func shuffle(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "shuffle", size: size, weight: weight, tint: tint)
      }
      
      public static func _repeat(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "repeat", size: size, weight: weight, tint: tint)
      }
      
      public static func speaker2fill(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "speaker.2.fill", size: size, weight: weight, tint: tint)
      }
      
      public static func speakerSlashFill(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "speaker.slash.fill", size: size, weight: weight, tint: tint)
      }
      
      public static func musicNote(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "music.note", size: size, weight: weight, tint: tint)
      }
      
      public static func musicNoteList(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "music.note.list", size: size, weight: weight, tint: tint)
      }
      
      public static func magnifyingglass(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "magnifyingglass", size: size, weight: weight, tint: tint)
      }
      
      public static func mic(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "mic", size: size, weight: weight, tint: tint)
      }
      
      public static func flag(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "flag", size: size, weight: weight, tint: tint)
      }
      
      public static func bell(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "bell", size: size, weight: weight, tint: tint)
      }
      
      public static func bellSlash(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "bell.slash", size: size, weight: weight, tint: tint)
      }
      
      public static func tag(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "tag", size: size, weight: weight, tint: tint)
      }
      
      public static func bolt(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "bolt", size: size, weight: weight, tint: tint)
      }
      
      public static func camera(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "camera", size: size, weight: weight, tint: tint)
      }
      
      public static func ellipsis(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "ellipsis", size: size, weight: weight, tint: tint)
      }
      
      public static func bag(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "bag", size: size, weight: weight, tint: tint)
      }
      
      public static func creditcard(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "creditcard", size: size, weight: weight, tint: tint)
      }
      
      public static func wandAndStarsInverse(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "wand.and.stars.inverse", size: size, weight: weight, tint: tint)
      }
      
      public static func crop(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "crop", size: size, weight: weight, tint: tint)
      }
      public static func cropRotate(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "crop.rotate", size: size, weight: weight, tint: tint)
      }
      
      public static func nosign(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "nosign", size: size, weight: weight, tint: tint)
      }
      
      public static func house(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "house", size: size, weight: weight, tint: tint)
      }
      
      public static func musicHouse(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "music.house", size: size, weight: weight, tint: tint)
      }
      
      public static func lock(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "lock", size: size, weight: weight, tint: tint)
      }
      
      public static func mappinAndEllipse(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "mappin.and.ellipse", size: size, weight: weight, tint: tint)
      }
      
      public static func rotateLeft(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "rotate.left", size: size, weight: weight, tint: tint)
      }
      
      public static func rotateRight(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "rotate.right", size: size, weight: weight, tint: tint)
      }
      
      public static func qrcode(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "qrcode", size: size, weight: weight, tint: tint)
      }
      
      public static func plusRectangle(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "plus.rectangle", size: size, weight: weight, tint: tint)
      }
      
      public static func dotSquare(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "dot.square", size: size, weight: weight, tint: tint)
      }
      
      public static func rectangleOnRectangleAngled(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "rectangle.on.rectangle.angled", size: size, weight: weight, tint: tint)
      }
      
      public static func rectangleStackPersonCrop(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "rectangle.stack.person.crop", size: size, weight: weight, tint: tint)
      }
      
      public static func shield(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "shield", size: size, weight: weight, tint: tint)
      }
      
      public static func gift(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "gift", size: size, weight: weight, tint: tint)
      }
      
      public static func plusApp(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "plus.app", size: size, weight: weight, tint: tint)
      }
      
      public static func purchased(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "purchased", size: size, weight: weight, tint: tint)
      }
      
      public static func xmark(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "xmark", size: size, weight: weight, tint: tint)
      }
      
      public static func boltHorizontal(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "bolt.horizontal", size: size, weight: weight, tint: tint)
      }
      
      public static func grid(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "grid", size: size, weight: weight, tint: tint)
      }
      
      public static func lasso(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "lasso", size: size, weight: weight, tint: tint)
      }
      
      public static func infoCircle(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "info.circle", size: size, weight: weight, tint: tint)
      }
      
      public static func questionmarkCircle(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "questionmark.circle", size: size, weight: weight, tint: tint)
      }
      
      public static func plusCircle(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "plus.circle", size: size, weight: weight, tint: tint)
      }
      
      public static func minusCircle(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "minus.circle", size: size, weight: weight, tint: tint)
      }
      
      public static func multiplyCircle(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "multiply.circle", size: size, weight: weight, tint: tint)
      }
      
      public static func checkmarkCircle(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "checkmark.circle", size: size, weight: weight, tint: tint)
      }
      
      public static func chevronLeft(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "chevron.left", size: size, weight: weight, tint: tint)
      }
      
      public static func chevronUp(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "chevron.up", size: size, weight: weight, tint: tint)
      }
      
      public static func chevronDown(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "chevron.down", size: size, weight: weight, tint: tint)
      }

      public static func chevronRight(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "chevron.right", size: size, weight: weight, tint: tint)
      }

      public static func arrow2squarepath(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "arrow.2.squarepath", size: size, weight: weight, tint: tint)
      }
      
      public static func envelope(size: CGFloat, weight: UIFont.Weight, tint: UIColor) -> UIImage {
        return UIFactory
          .symbolImage(systemName: "envelope", size: size, weight: weight, tint: tint)
      }
    }
  }
}
