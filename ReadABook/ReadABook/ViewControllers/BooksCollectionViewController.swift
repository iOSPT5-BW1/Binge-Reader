
import UIKit

private let reuseIdentifier = "BookCollectionViewCell"

class BooksCollectionViewController: UICollectionViewController {

    var bookController = BookController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bookController.bookList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
        let book = bookController.bookList[indexPath.item]
        cell.book = book
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddBookSegue" {
            if let addBookVC = segue.destination as? AddBookViewController {
                addBookVC.delegate = self
                addBookVC.bookController = bookController
            }
        } else if segue.identifier == "BookTableViewSegue" {
            if let indexPath = collectionView.indexPathsForSelectedItems?.first?.item ,  let bookTableVC = segue.destination as? BookTableViewController {
                bookTableVC.book = bookController.bookList[indexPath]
                bookTableVC.bookController = bookController
            }
        }
    }
    
    // MARK: UICollectionViewDelegate

}

// See HobbyTracker for reference
extension BooksCollectionViewController: AddBookDelegate {
    func bookWasCreated(_ book: Book) {
        bookController.bookList.append(book) // I think this is redundant but not harmful
        collectionView.reloadData()
    }
}
