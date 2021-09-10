//
//  ViewController.swift
//  Contacts
//
//  Created by Zachary Buffington on 9/10/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = contact?.name ?? "New Contact"
        nameTextField.text = contact?.name
        emailTextField.text = contact?.email
        phoneTextField.text = "\(contact?.phone ?? 0)"
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
              let email = emailTextField.text,
              let phoneString = phoneTextField.text,
              !name.isEmpty,
              !email.isEmpty,
              let phone = Int(phoneString) else {return}
        if let contact = contact {
            ContactManager.shared.update(contact: contact, newName: name, newEmail: email, newPhone: phone)
            
            
        } else {
            ContactManager.shared.createContact(name: name, email: email, phone: phone)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}

