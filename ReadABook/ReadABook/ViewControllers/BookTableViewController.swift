
import UIKit

class BookTableViewController: UIViewController, UITableViewDataSource {
    
    var bookController: BookController?
    var chapterController = ChapterController()
    var chapterDetailViewController = ChapterDetailViewController()
    var chapters: [Chapter]?
    
    let progress = Progress(totalUnitCount: 100)
    //FINISH THIS GUY
    
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = book?.title
        updateViews()
    }
    
    private func updateViews() {
        // progressLabel.text = "\(bookController?.readPercentageCalculator(chapters: chapterController.chapters) ?? 0)% Finished"
        //Trouble shoot this guy
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChapterDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow, // see line 130 from reading list
                let chapterDetailVC = segue.destination as? ChapterDetailViewController {
                chapterDetailVC.delegate = self
                // This needs to be fleshed out
                // We need the chapterDetailVC text fields to populate with the text that was already written if there is any.
                //Why haven't we used the index path?
            }
        } else if segue.identifier == "AddChapterSegue" {
            if let chapterDetailVC = segue.destination as? ChapterDetailViewController {
                chapterDetailVC.delegate = self
                
            }
        }
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
    }
}

extension BookTableViewController: EditChapterDelegate {
    func editChapter(_ chapter: Chapter) {
        chapters?.append(chapter)
        tableView.reloadData()
    }
}

