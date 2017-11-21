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
    let authors: String?
    let subtitle: String?
    let description: String?
    let amount: Double?
    init(title: String?,authors: String?, subtitle:String?, description:String?, amount: Double? ){
        self.title = title
        self.authors = authors
        self.subtitle = subtitle
        self.description = description
        self.amount = amount
    }

convenience init?(from jsonDict: [String:Any]) {
    guard let title = jsonDict["title"] as? String else {return nil}
    let authors = jsonDict["authors"] as? String ?? "no author"
    let subtitle = jsonDict["subtitle"] as? String ?? "no subtitle"
    let description = jsonDict["description"] as? String ?? "no description"
    let amount = jsonDict["amount"] as? Double ?? 0
    self.init(title: title, authors: authors, subtitle: subtitle, description: description,amount: amount)
    }
    static func getBooks(from data: Data) -> [Book] {
                var books = [Book]()
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let bookDictArray = json as? [[String:Any]] {
                        for book in bookDictArray {
                            if let book = Book(from: book) {
                                books.append(book)
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


