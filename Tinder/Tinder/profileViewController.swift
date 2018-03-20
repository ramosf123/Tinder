//
//  profileViewController.swift
//  Tinder
//
//  Created by Farid Ramos on 3/7/18.
//  Copyright © 2018 Farid Ramos. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {
    
    @IBOutlet weak var profileImg: UIImageView!
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImg.image = image
    }

    @IBAction func dismissProfile(_ sender: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
