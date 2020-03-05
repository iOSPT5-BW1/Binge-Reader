
import Foundation

class Book: Codable {
    var title: String
    var numberOfChapters: Int
    var chapters: [Chapter] {
        var chapters: [Chapter] = []
        for number in 1...numberOfChapters {
            let chapter = Chapter(chapterTitle: "Chapter \(number)", chapterDescription: "", readYet: false)
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
