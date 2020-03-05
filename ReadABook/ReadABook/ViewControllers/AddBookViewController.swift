//
//  AddBookViewController.swift
//  ReadABook
//
//  Created by Chris Price on 2/26/20.
//  Copyright © 2020 BuildWeek1x2. All rights reserved.
//

import UIKit

protocol AddBookDelegate {
    func bookWasCreated (_ book: Book)
}

class AddBookViewController: UIViewController {

    var bookController: BookController?
    
    @IBOutlet weak var addTitleTextField: UITextField!
    @IBOutlet weak var addNumberOfChaptersTextField: UITextField!
    
    var delegate: AddBookDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let bookTitle = addTitleTextField.text,
            let numberOfChapters = addNumberOfChaptersTextField.text,
            !bookTitle.isEmpty ,
            !numberOfChapters.isEmpty else {return}
        
        //unwrap the textfield for the int and cast it to an int here
        
        // I removed the book, because we are not using and are just creating a book with the create function below. 
        var book = Book(title: bookTitle, numberOfChapters: Int(numberOfChapters)!, bookFinished: false)
        
        // Replacing this with the 'bookWasCreated' function
        // bookController?.createBook(title: bookTitle, numberOfChapters: Int(numberOfChapters)!, bookFinished: false)
        
        delegate?.bookWasCreated(book)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
