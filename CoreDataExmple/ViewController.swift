//
//  ViewController.swift
//  CoreDataExmple
//
//  Created by Apple on 28/07/18.
//  Copyright © 2018 AzimTalukdar. All rights reserved.
//

import UIKit
import CoreData

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtDOB: UITextField!
    @IBOutlet weak var txtProfession: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        context.count(for: NSFetchRequest.Use)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addDataInDB(_ sender: Any) {
        let userModel = UserModel(context: context)
        userModel.name = txtName.text
        userModel.age = 12
        userModel.birthDate = Date()
        saveItemsInDB()
        
    }
    
    func saveItemsInDB() -> Void {
        do {
            try context.save()
        } catch  {
            print("Error decoding item arr\(error)")
        }
    }
    
    
    @IBAction func showDataList(_ sender: Any) {
        let DetalsVC = self.storyboard?.instantiateViewController(withIdentifier: "DataListViewController") as! DataListViewController
        self.navigationController?.pushViewController(DetalsVC, animated: true)
    }
    
}

