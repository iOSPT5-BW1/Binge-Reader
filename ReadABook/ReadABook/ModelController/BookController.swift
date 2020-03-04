
import Foundation

class BookController {
    
    var bookList: [Book] = []
    
    func readPercentageCalculator(chapters: [Chapter]) -> Int {
        var readChapters: [Chapter] = []
        for chapter in chapters {
            if chapter.chapterFinished {
                readChapters.append(chapter)
            }
        }
        let percentage = (readChapters.count/chapters.count) * 100
        return percentage
    }
    
    init() {
        if UserDefaults.standard.bool(forKey: .alreadyExistsKey) {
            loadFromPersistentStore()
        } else {
            saveToPersistentStore()
            UserDefaults.standard.set(true, forKey: .alreadyExistsKey)
        }
    }
    
    // MARK: - CRUD
    
    func createBook(title: String, numberOfChapters: Int, bookFinished: Bool) {
        let book = Book(title: title, numberOfChapters: numberOfChapters, bookFinished: false)
        bookList.append(book)
        saveToPersistentStore()
    }

    
    // MARK: - Persistence
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return documents.appendingPathComponent("books.plist")
    }
    
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else {return}
        
        do {
            let encoder = PropertyListEncoder()
            let bookData = try encoder.encode(bookList)
            try bookData.write(to: url)
        } catch {
            print("Error saving shopping data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else {return}
        
        do {
            let bookData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            bookList = try decoder.decode([Book].self, from: bookData)
        } catch {
            print("Error loading shopping data: \(error)")
        }
    }
}
