//
//  CardsViewController.swift
//  Tinder
//
//  Created by Farid Ramos on 3/5/18.
//  Copyright © 2018 Farid Ramos. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardInitialCenter = cardView.center

    }
    
    @IBAction func didTap(_ sender: Any) {
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "profileSegue") {
            let profile = segue.destination as! profileViewController
            profile.image = profileImg.image
        }
    }

    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        if sender.state == .began {
            cardInitialCenter = cardView.center
        } else if sender.state == .changed {
            cardView.transform = CGAffineTransform(translationX: translation.x, y: 0)
            cardView.transform = cardView.transform.rotated(by: CGFloat(Double(translation.x)/10 * Double.pi / 180))
        } else if sender.state == .ended {
            if translation.x > 50 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.cardView.transform = CGAffineTransform(translationX: velocity.x * 100, y: 0)
                }, completion: nil)
            }
            else{
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.cardView.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: nil)
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
