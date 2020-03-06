
import UIKit

protocol BookTableViewCellDelegate {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var chapterNumberLabel: UILabel!
    @IBOutlet weak var chapterTitleLabel: UILabel!
    @IBOutlet weak var readButton: UIButton!
    
    var chapter: Chapter?
    var book: Book? {
        didSet {
            self.updateViews()
        }
    }
    var delegate: BookTableViewCellDelegate?
    
    private func updateViews() {
        if book == nil {
            
        }
//        chapterNumberLabel.text =
        chapterTitleLabel.text = book?.chapters[0].chapterTitle
    }
   
    @IBAction func readButtonTapped(_ sender: Any) {
        delegate?.toggleHasBeenRead(for: self)
    }
}
