
import Foundation

class ChapterController {
    var chapters: [Chapter] = []
    
    // MARK: - CRUD
    
    func createChapter(chapterTitle: String, chapterDescription: String, chapterFinished: Bool) {
        let chapter = Chapter(chapterTitle: chapterTitle, chapterDescription: chapterDescription, chapterFinished: false)
        chapters.append(chapter)
        // What is the most elegant way to save this to the persistent store?
    }
}
