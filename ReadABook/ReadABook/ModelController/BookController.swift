
import Foundation

class BookController {
    
    var bookList: [Book] = []
    
    // Needs an init() that looks for an aray in the persistent store else starts an empty array. Delete that empty array above.
    
    // Mark: - Persistence
    
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
