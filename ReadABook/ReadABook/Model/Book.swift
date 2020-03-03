
import Foundation

class Book: Codable {
    var title: String
    var numberOfChapters: Int
    var chapters: [Chapter]
    var bookFinished: Bool
    
    init(title: String, numberOfChapters: Int, chapters: [Chapter], bookFinished: Bool) {
        self.title = title
        self.numberOfChapters = numberOfChapters
        self.chapters = chapters
        self.bookFinished = false
    }
}
