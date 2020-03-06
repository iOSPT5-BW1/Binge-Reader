
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
        guard let chapterTitle = chapterTitleTextField.text,
            let chapterComments = chapterCommentsTextField.text,
            !chapterTitle.isEmpty,
            !chapterComments.isEmpty else {return}
        let chapter = Chapter(chapterTitle: chapterTitle, chapterDescription: chapterComments, readYet: false) // Make sure if wee are editing a chapter instead of creating a chapter, that the readYet doesn't reset to false.
        delegate?.editChapter(chapter)
        navigationController?.popViewController(animated: true)
    }
    
}
