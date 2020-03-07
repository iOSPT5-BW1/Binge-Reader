
import UIKit

class BookTableViewController: UIViewController, UITableViewDataSource {
    
    var bookController: BookController?
    var chapterController = ChapterController()
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
//        progressLabel.text = "\(bookController?.readPercentageCalculator(chapters: chapterController.chapters).description ?? "0")% Finished"
        // Why is my book controller nil in this update views? It should be coming through the segue from the BooksCollectionViewController.
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
        book?.chapters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell() }
        guard let chapter = book?.chapters[indexPath.row] else { return UITableViewCell() }
        print("\(chapter.chapterFinished) @ \(indexPath.row + 1)")
        cell.delegate = self
        cell.chapter = chapter 
        cell.chapterNumber = indexPath.row + 1
        return cell
    }
}

extension BookTableViewController: EditChapterDelegate {
    func editChapter(_ chapter: Chapter) {
        chapters?.append(chapter)
        tableView.reloadData()
    }
}

extension BookTableViewController: BookTableViewCellDelegate {
    func toggleHasBeenRead(with chapter: Chapter) {
        guard let book = book else { return }
        bookController?.toggleChapterFinished(in: book, chapter: chapter)
        tableView.reloadData()
    }
    
    
}
