//
//  ViewController.swift
//  DIcee
//
//  Created by Sasha Nosochenko on 8/21/19.
//  Copyright © 2019 RIJIDCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstRandomVariable = 0
    var secondRandomVariable = 0
    
    @IBOutlet weak var diceImg1: UIImageView!
    @IBOutlet weak var diceImg2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImg()
    }

    @IBAction func refreshButtonPressed(_ sender: UIButton) {
        
        updateDiceImg()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImg()
    }
    
    func updateDiceImg() {
        firstRandomVariable = Int.random(in: 1 ... 6)
        secondRandomVariable = Int.random(in: 1 ... 6)
        
        let translationTransform = CATransform3DRotate(view.layer.transform, CGFloat(Double.pi), 0, 0, 1)
        
            
            CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
        
        diceImg1.layer.transform = translationTransform
        UIView.animate(withDuration: 0.4, delay: 0, animations: {
            self.diceImg1.layer.transform = CATransform3DIdentity
        })
        
        diceImg2.layer.transform = translationTransform
        UIView.animate(withDuration: 0.4, delay: 0, animations: {
            self.diceImg2.layer.transform = CATransform3DIdentity
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            print("uodate")
            self.diceImg2.image = UIImage(named: String(self.secondRandomVariable))
            self.diceImg1.image = UIImage(named: String(self.firstRandomVariable))
        }
        
        
    }
}

