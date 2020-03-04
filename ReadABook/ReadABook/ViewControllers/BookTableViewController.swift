
import UIKit

class BookTableViewController: UIViewController, UITableViewDataSource {
    
    var bookController: BookController?
    var chapterController = ChapterController()
    
    var book: Book? {
        didSet {
            
        }
    }
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let progress = Progress(totalUnitCount: 100)
    
    private func updateViews() {
        progressLabel.text = "\(bookController?.readPercentageCalculator(chapters: chapterController.chapters))% Finished"
    }
    
    // MARK: - TableView Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        book?.numberOfChapters ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell() }
        let chapter = book?.chapters[indexPath.row]
        cell.chapter = chapter
        cell.chapterNumberLabel.text = "\(book?.chapters[indexPath.row])"
        return cell
        
        // Cell has no chapter, which lead us to try to set up the BookTableViewCell. We couldn't figure out what to set the chapterNumberLabel equasl to because we didn't have access to the indexPath.row over on that file.
    }
    
    
}
