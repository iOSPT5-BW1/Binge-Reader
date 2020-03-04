
import UIKit

private let reuseIdentifier = "Cell"

class BooksCollectionViewController: UICollectionViewController {

    var bookController = BookController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bookController.bookList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionCell", for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
        let book = bookController.bookList[indexPath.item]
        cell.book = book
        return cell
    }

    // MARK: - Navigation
    //prepare for segue
        //pass in 
    
    // MARK: UICollectionViewDelegate

}

extension BooksCollectionViewController: AddBookDelegate {
    func bookWasCreated(_ book: Book) {
        bookController.bookList.append(book)
        collectionView.reloadData() // this is wrong. Can't access the collection view in the same way we did the table view in the HobbyTracker
    }
}
