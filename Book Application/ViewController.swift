//
//  ViewController.swift
//  Book Application
//
//  Created by apple on 2017-08-15.
//  Copyright © 2017 Dmitrii Poliakov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var buttons: [UIButton]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped))
        view.addGestureRecognizer(tapGesture)
        
        for button in buttons{
            button.layer.cornerRadius = button.frame.size.height / 2
        }
        
        view.setGradientBackground(colorOne: .blue, colorTwo: .orange, colorThree: .yellow)
    }
    
    @IBAction func saveBook(_ sender: UIButton) {
        
        sender.flash()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Book", in: managedContext)
        let bookData = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        let bookTitle = textFields[0].text!
        bookData.setValue(bookTitle, forKey: "title")
        
        let bookAuthor = textFields[1].text!
        bookData.setValue(bookAuthor, forKey: "author")
        
        if let bookNumPages = Int(textFields[2].text!){
            bookData.setValue(bookNumPages, forKey: "numPages")
        }
        
        if let year = Int(textFields[3].text!){
            bookData.setValue(year, forKey: "year")
        }
        
        do{
            try managedContext.save()
        }
        catch{
            print(error)
        }
        
        for textField in textFields{
            textField.text = ""
        }
        
        let alertController = UIAlertController(title: "Book Saved", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func clearAllBooks(_ sender: UIButton) {
        
        sender.shake()
        
        let alertController = UIAlertController(title: "Clear All Books?", message: "Are you sure?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Yes, I am sure", style: .default){
            ACTION in
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
            
            do{
                let results = try managedContext.fetch(fetchRequest)
                
                for result in results{
                    managedContext.delete(result as! NSManagedObject)
                }
            }
            catch{
                print(error)
            }
        }
        
        let noAction = UIAlertAction(title: "No, wait!", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(noAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    @objc func viewTapped(){
        
        for textfField in textFields{
            textfField.resignFirstResponder()
        }
    }
    
    @IBAction func textDidFinishEditing(sender: UITextField){
        
        sender.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

