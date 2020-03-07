
import Foundation

class Book: Codable, Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.chapters == rhs.chapters 
    }
    
    var title: String
    var numberOfChapters: Int
    var chapters: [Chapter] {
        var chapters: [Chapter] = []
        for number in 1...numberOfChapters {
            let chapter = Chapter(chapterTitle: "Chapter \(number)", chapterDescription: "", chapterFinished: false)
            chapters.append(chapter)
        }
        return chapters
    }
    
    var bookFinished: Bool
    
    init(title: String, numberOfChapters: Int, bookFinished: Bool) {
        self.title = title
        self.numberOfChapters = numberOfChapters
        self.bookFinished = false
    }
    
    
}
