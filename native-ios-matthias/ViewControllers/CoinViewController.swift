//
//  CoinViewController.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 22/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import Foundation
import UIKit


class CoinViewController: UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoCoinTask: URLSessionTask?
    
    private var cryptoCoins: [CryptoCoin]!
    
    private var indexPathToView: IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cryptoCoins = nil
        cryptoCoinTask?.cancel()
        cryptoCoinTask = CryptocompareService.coinlist() {
            self.cryptoCoins = $0
            self.tableView!.reloadData()
            //self.view
        }
        cryptoCoinTask!.resume()
        
        
    
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch  segue.identifier {
        case "detailCoin"?:

            let dest = segue.destination as! CoinDetailTabController
            let selection = tableView.indexPathForSelectedRow!
            dest.cryptoCoin = self.cryptoCoins[selection.row]
            
        default:
            fatalError("Unknown segue")
        }
    }
    
    @IBAction func unwindFromDetailCoin(_ segue: UIStoryboardSegue) {
//        switch segue.identifier {
//        case "didAddProject"?:
//            let addProjectViewController = segue.source as! AddProjectViewController
//            let realm = try! Realm()
//            try! realm.write {
//                realm.add(addProjectViewController.project!)
//            }
//            tableView.insertRows(at: [IndexPath(row: projects.count - 1, section: 0)], with: .automatic)
//        case "didEditProject"?:
//            tableView.reloadRows(at: [indexPathToEdit], with: .automatic)
//        default:
//            fatalError("Unkown segue")
//        }
    }
    
    
}


extension CoinViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CryptoCell
        //cell.project = projects[indexPath.row]
        if let wr = cryptoCoins?[indexPath.row]  {
            cell.name = wr.name
            cell.imageIcon = "https://www.cryptocompare.com" + wr.imageUrl
        } else {
            cell.name = "N/A"
        }
        
        return cell
    }
}


extension CoinViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let editAction = UIContextualAction(style: .normal, title: "Edit") {
//            (action, view, completionHandler) in
//            self.indexPathToEdit = indexPath
//            self.performSegue(withIdentifier: "editProject", sender: self)
//            completionHandler(true)
//        }
//        editAction.backgroundColor = UIColor.orange
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
//            (action, view, completionHandler) in
//            let project = self.projects[indexPath.row]
//            let realm = try! Realm()
//            try! realm.write {
//                project.tasks.forEach(realm.delete(_:))
//                realm.delete(project)
//            }
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            completionHandler(true)
//        }
//        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
//    }
}


