//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    var messages: [Message] = [Message(sender: "1@2.com", body: "Hey!"),Message(sender: "wisarutgolf11@gmail.com", body: "Hello"),Message(sender: "1@2.com", body: "How are you ")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.title
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName:"MessageCell",bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logoutPress(_ sender: UIBarButtonItem) {
        do {
        try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let error as NSError{
            print(error)
        }
    }
    
}
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier,for: indexPath) as! MessageCell
        let message = messages[indexPath.row]
        cell.messageLabel.text = message.body
        cell.rightImageView.image = (message.sender == "wisarutgolf11@gmail.com") ? UIImage(named: "MeAvatar") : UIImage(named: "YouAvatar")
        cell.messageStack.semanticContentAttribute = (message.sender == "wisarutgolf11@gmail.com") ? UISemanticContentAttribute.forceLeftToRight : UISemanticContentAttribute.forceRightToLeft
        return cell
    }
}
