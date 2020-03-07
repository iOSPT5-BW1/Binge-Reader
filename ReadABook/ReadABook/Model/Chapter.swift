
import Foundation

class Chapter: Codable, Equatable {
    static func == (lhs: Chapter, rhs: Chapter) -> Bool {
        lhs.chapterFinished == rhs.chapterFinished
    }
    
    var chapterTitle: String
    var chapterDescription: String
    var chapterFinished: Bool
    
    init(chapterTitle: String, chapterDescription: String, chapterFinished: Bool) {
        self.chapterTitle = chapterTitle
        self.chapterDescription = chapterDescription
        self.chapterFinished = false
    }
}
