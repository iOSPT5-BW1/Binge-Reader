
import Foundation

class Chapter: Codable {
    var chapterTitle: String
    var chapterDescription: String
    var chapterFinished: Bool
    
    init(chapterTitle: String, chapterDescription: String, readYet: Bool) {
        self.chapterTitle = chapterTitle
        self.chapterDescription = chapterDescription
        self.chapterFinished = false
    }
}
