import UIKit
import UIComponents

protocol SongAutosuggestionsSearchResultsControllerDelegate: class {
  func didSelect(autosuggestion: String)
}

class SongAutosuggestionsSearchResultsController: UITableViewController {
  
  weak var delegate: SongAutosuggestionsSearchResultsControllerDelegate?
  
  private var autosuggestions: [String] = []
  
  func update(autosuggestions: [String]) {
    self.autosuggestions = autosuggestions
    tableView.reloadData()
  }
  
  init() {
    super.init(style: .plain)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(cellWithClass: AutosuggestionTableViewCell.self)
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return autosuggestions.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withClass: AutosuggestionTableViewCell.self)
    cell.textLabel?.text = autosuggestions[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let autosuggestion = autosuggestions[indexPath.row]
    delegate?.didSelect(autosuggestion: autosuggestion)
  }
}

class AutosuggestionTableViewCell: UITableViewCell, Reusable {
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
