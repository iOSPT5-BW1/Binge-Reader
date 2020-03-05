
import UIKit

protocol EditChapterDelegate {
    func editChapter (_ chapter: Chapter)
}

class ChapterDetailViewController: UIViewController {

    @IBOutlet weak var chapterTitleTextField: UITextField!
    @IBOutlet weak var chapterCommentsTextField: UITextField!
    
    var delegate: EditChapterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
}
