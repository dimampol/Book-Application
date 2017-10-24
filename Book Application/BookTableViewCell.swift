//
//  BookTableViewCell.swift
//  AnotherDataApp
//
//  Created by apple on 2017-08-15.
//  Copyright © 2017 Dmitrii Poliakov. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class BookTableViewCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var pagesLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    func setBookData(bookObject: NSManagedObject){
        
        titleLabel.text = bookObject.value(forKey: "title") as? String
        authorLabel.text = bookObject.value(forKey: "author") as? String
        
        if let bookNumPages = bookObject.value(forKey: "numPages") as? Int{
            pagesLabel.text = "\(bookNumPages)"
        }
        
        if let year = bookObject.value(forKey: "year") as? Int{
            yearLabel.text = "\(year)"
        }
        
    }
}
