//
//  ViewController.swift
//  swiftChatter
//
//  Created by 李子恒 on 26-05-2024.
//

import UIKit

class PostVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var usernameLabel: UILabel!
    

    @IBOutlet weak var messageTextView: UITextView!
    
    @IBAction func submitChatt(_ sender: Any) {
        ChattStore.shared.postChatt(Chatt(username: usernameLabel.text,
            message: messageTextView.text))

        dismiss(animated: true, completion: nil)
    }
    

}

