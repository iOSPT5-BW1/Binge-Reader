//
//  ChapterModelController.swift
//  ReadABook
//
//  Created by Chris Price on 2/29/20.
//  Copyright © 2020 BuildWeek1x2. All rights reserved.
//

import Foundation

class ChapterController {
    var chapters: [Chapter] = []
    
    // MARK: - CRUD
    
    func createChapter(chapterTitle: String, chapterDescription: String, chapterFinished: Bool) {
        let chapter = Chapter(chapterTitle: chapterTitle, chapterDescription: chapterDescription, readYet: false)
        chapters.append(chapter)
        // What is the most elegant way to save this to the persistent store?
    }
}
