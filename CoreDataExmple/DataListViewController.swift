//
//  DataListViewController.swift
//  CoreDataExmple
//
//  Created by Apple on 31/07/18.
//  Copyright © 2018 AzimTalukdar. All rights reserved.
//

import UIKit
import CoreData

class DataListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dataArr = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        loadMyData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadMyData(){
        let request : NSFetchRequest<UserModel> = UserModel.fetchRequest()
        do {
            dataArr = try context.fetch(request)
        } catch  {
            print("error loading data- \(error)")
        }
        
        myTableView.reloadData()
        
    }
    

    //Mark: - Table delegate and datsource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = dataArr[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        dataArr[indexPath.row].name = "my new name"
        context.delete(dataArr[indexPath.row])
        saveUser()
    }
    
    func saveUser() {
        do {
            try context.save()
            loadMyData()
        } catch  {
            print("Error in saving data - \(error)")
        }
    }

}
