//
//  BooksDetailViewController.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by C4Q on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class BooksDetailViewController: UIViewController {
    
    var selectedCell: Book!
    var authorPassed: String?
    var titlePassed: String?
    var subtitlePassed: String?
    var pricePassed: Int?
    var descriptionPassed: String?
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitlelabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookImage.image = UIImage(named:"defaultBook")
        nameLabel.text = titlePassed
        subtitlelabel.text = subtitlePassed
        priceLabel.text = String(describing: pricePassed)
        descriptionTextView.text = descriptionPassed
    }



}
