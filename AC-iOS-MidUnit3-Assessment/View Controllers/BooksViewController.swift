//
//  BooksViewController.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by C4Q on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class BooksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var booksArr = [Book]()

    var valueToPass: Book!
    var authorToPass: String = ""
    var bookTitleToPass: String = ""
    var bookSubtitleToPass: String = ""
    var bookPrice: Int = 0
    var bookDescriptionToPass: String = ""
    
    
    @IBOutlet weak var booksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.booksTableView.delegate = self
        self.booksTableView.dataSource = self
        loadData()
    }
    
    //MARK: - Loading the Book Data
    func loadData() {
        if let path = Bundle.main.path(forResource: "bookinfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let books = Book.getBooks(from: data)
                self.booksArr = books
            }
        }
        //for my reference
        for book in booksArr {
            print(book.title!)
        }
    }
    
    //MARK: - Table Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookPicked = booksArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Book Cell")!
        cell.backgroundColor = .white
        cell.textLabel!.text = bookPicked.title
        cell.detailTextLabel!.text = String(describing: bookPicked.amount)
        
        return cell
    }
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Book Detail Segue") {
            let destinationVC = segue.destination as! BooksDetailViewController
            destinationVC.titlePassed = bookTitleToPass
            destinationVC.subtitlePassed = bookSubtitleToPass
            destinationVC.authorPassed = authorToPass
            destinationVC.pricePassed = bookPrice
            destinationVC.descriptionPassed = bookDescriptionToPass
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow;
        let currentCell = tableView.cellForRow(at: indexPath!) as UITableViewCell!;
        valueToPass = booksArr[(indexPath?.row)!]
        bookTitleToPass = (currentCell?.textLabel?.text)!
        bookPrice = Int((currentCell?.detailTextLabel?.text)!)!
    }
}
