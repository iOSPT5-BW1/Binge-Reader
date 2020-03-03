
import UIKit

class BookTableViewController: UIViewController {
    
    var book: Book? {
        didSet {
            
        }
    }

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let progress = Progress(totalUnitCount: 10)

    private func updateViews() {
        progressLabel.text = book?.chapters.
        //"\(finished chapters)/(total chapters)% Complete"
    }

}
