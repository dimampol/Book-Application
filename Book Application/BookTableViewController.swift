//
//  BookTableViewController.swift
//  AnotherDataApp
//
//  Created by apple on 2017-08-15.
//  Copyright © 2017 Dmitrii Poliakov. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class BookTableViewController: UITableViewController{
    
    var bookResults: [NSManagedObject]!
    
    override func viewDidLoad() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            bookResults = results as! [NSManagedObject]
        }
        catch{
            print(error)
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(BookTableViewController.close))
        
        addNavigationBarImage()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bookResults?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as! BookTableViewCell
        
        cell.setBookData(bookObject: bookResults[indexPath.row])
        
        return cell
    }
    
    @objc func close(){
            navigationController?.dismiss(animated: true, completion: nil)
        }
    
    func addNavigationBarImage(){
        
        let navController = navigationController!
        
        let image = #imageLiteral(resourceName: "booksImage.png")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }
}
