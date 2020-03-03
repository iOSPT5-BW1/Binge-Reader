
import UIKit

class BookTableViewController: UIViewController {
    
    var bookController = BookController()
    var chapterController = ChapterController()
    
    var book: Book? {
        didSet {
            
        }
    }

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let progress = Progress(totalUnitCount: 10)

    private func updateViews() {
        progressLabel.text = "\(bookController.readPercentageCalculator(chapters: chapterController.chapters))% Finished"
    }
}
