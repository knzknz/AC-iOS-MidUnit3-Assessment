//
//  Book.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by C4Q on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class Book {
    let title: String?
    let authors: String
    let subtitle: String?
    let description: String?
    let amount: Double?
    init(title: String?,authors: String, subtitle:String?, description:String?, amount: Double? ){
        self.title = title
        self.authors = authors
        self.subtitle = subtitle
        self.description = description
        self.amount = amount
    }

convenience init?(from jsonDict: [String:Any]) {
    guard let volumeinfo = jsonDict["volumeInfo"] as? [String:Any] else {return nil}
    let title = volumeinfo["title"] as? String
    let authorsArray = volumeinfo["authors"] as? [String]
    let authors = authorsArray![0]
    let subtitle = volumeinfo["subtitle"] as? String ?? "no subtitle"
    let description = volumeinfo["description"] as? String ?? "no description"
    let amount = volumeinfo["amount"] as? Double ?? 0
    self.init(title: title, authors: authors, subtitle: subtitle, description: description,amount: amount)
    }
    
//    {
//    "kind": "books#volume",
//    "id": "UN1RKjs6E8YC",
//    "etag": "p4gBW50aAxQ",
//    "selfLink": "https://www.googleapis.com/books/v1/volumes/UN1RKjs6E8YC",
//    "volumeInfo": {
//    "title": "Nation",
//    "authors": [
//    "Terry Pratchett"
//    ],
//    "publisher": "Harper Collins",
//    "publishedDate": "2009-10-06",
//    "description": "When a giant wave destroys his village, Mau is the only one left. Daphne—a traveler from the other side of the globe—is the sole survivor of a shipwreck. Separated by language and customs, the two are united by catastrophe. Slowly, they are joined by other refugees. And as they struggle to protect the small band, Mau and Daphne defy ancestral spirits, challenge death himself, and uncover a long-hidden secret that literally turns the world upside down.",
//    "industryIdentifiers": [
    static func getBooks(from data: Data) -> [Book] {
                var books = [Book]()
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let bookDictArray = json as? [String:Any] {
                        if let item = bookDictArray["items"] as? [[String:Any]] {
                            for book in item {
                                if let book = Book(from: book) {
                                    books.append(book)
                                }
                            }
                            
                        }
                    }
                }
                catch {
                    print("Error converting data to JSON")
                }
                return books
        }
    
}










//
//struct BookInfo: Codable {
//    let items: [BookDetail]
//}
//
//struct BookDetail: Codable{
//    let saleInfo: [Price]
//    let volumeInfo: [Book]
//}
//
//struct Price: Codable{
//    let listPrice: [PriceDetail]
//}
//
//struct PriceDetail: Codable {
//    let amount: Double
//}
//
//struct Book: Codable {
//    let title: String
//    let subtitle: String
//    let authors: String
//}


