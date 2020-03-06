
import UIKit

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
    
    private func updateViews() {
//        chapterNumberLabel.text =
        chapterTitleLabel.text = book?.chapters[0].chapterTitle
    }
   
    @IBAction func readButtonTapped(_ sender: Any) {
        
    }
}
