
import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let book = book else {return}
        bookTitleLabel.text = book.title
//        bookImageView.image =
    }
}
