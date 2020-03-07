
import UIKit

protocol BookTableViewCellDelegate: AnyObject {
    func toggleHasBeenRead(with chapter: Chapter)
}

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var chapterNumberLabel: UILabel!
    @IBOutlet weak var chapterTitleLabel: UILabel!
    @IBOutlet weak var readButton: UIButton!
    
    weak var delegate: BookTableViewCellDelegate?
    
    var chapterNumber: Int = 0 {
        didSet {
            chapterNumberLabel.text = "\(chapterNumber)."
        }
    }
    var chapter: Chapter? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let chapter = chapter else { return }
        chapterTitleLabel.text = chapter.chapterTitle
        
        let checkImage = chapter.chapterFinished ? UIImage(systemName: "checkmark.square") :UIImage(systemName: "square")
        readButton.setImage(checkImage, for: .normal)
    }
   
    @IBAction func readButtonTapped(_ sender: Any) {
        guard let chapter = chapter else { return }
        delegate?.toggleHasBeenRead(with: chapter)
        print("I was tapped @ \(chapterNumber)!")
    }
}
