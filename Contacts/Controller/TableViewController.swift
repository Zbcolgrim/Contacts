//
//  TableViewController.swift
//  Contacts
//
//  Created by Zachary Buffington on 9/10/21.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ContactManager.shared.contacts.count
    }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = ContactManager.shared.contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        
        return cell
    }
 

  

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let contact = ContactManager.shared.contacts[indexPath.row]
            ContactManager.shared.delete(contact: contact)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
            
          
        }    
    }
    


    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        
        
        guard segue.identifier == "updateContact",
        let indexPath = tableView.indexPathForSelectedRow,
            let destination = segue.destination as? ViewController else {return}
        let contact = ContactManager.shared.contacts[indexPath.row]
        destination.contact = contact
    }
    

}
