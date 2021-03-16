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
    let db = Firestore.firestore()
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.title
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName:"MessageCell",bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
        
    }
    func loadMessages() {
        db.collection("messages").order(by: "timestamp").addSnapshotListener {
            (querySnapshot,error) in
            if let e = error {
                print(e)
            } else {
                self.messages = []
                if let snapshotDocuments  = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data  = doc.data()
                        print(data)
                        if let messageSender = data["sender"] as? String, let messageBody = data["body"] as? String, let messageTimestamp =  data["timestamp"] as? Double {
                            self.messages.append(Message(sender: messageSender, body: messageBody, timestamp: messageTimestamp))
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1,section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                        
                    }
                }
            }
        }
    }
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text
           ,let sender = Auth.auth().currentUser?.email {
            db.collection("messages").addDocument(data: ["sender":sender,"body":messageBody,"timestamp":Date().timeIntervalSince1970]){
                (error) in
                if let  e = error {
                    print(e)
                } else {
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
        
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
        let currentUser = Auth.auth().currentUser?.email
        cell.messageLabel.text = message.body
        cell.rightImageView.image = (message.sender == currentUser) ? UIImage(named: "MeAvatar") : UIImage(named: "YouAvatar")
        cell.messageStack.semanticContentAttribute = (message.sender == currentUser) ? UISemanticContentAttribute.forceLeftToRight : UISemanticContentAttribute.forceRightToLeft
        cell.messageBubble.backgroundColor = (message.sender == currentUser) ? UIColor.systemPurple : UIColor.lightGray
        cell.messageLabel.textColor = (message.sender == currentUser) ? UIColor.white : UIColor.blue
        return cell
    }
}
