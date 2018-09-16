//
//  ViewController.swift
//  addCancelButtonAnimation
//
//  Created by Paulo Jose on 10/01/18.
//  Copyright © 2018 Paulo Jose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var showing: Bool = false
    
    @IBOutlet weak var addCancelUIView: UIImageView!
    
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var notificationImageView: UIImageView!
    
    var starInitialPosition: CGPoint!
    var locationInitialPosition: CGPoint!
    var notificationInitialPosition: CGPoint!
    
    override func viewWillAppear(_ animated: Bool) {
        addCancelUIView.layer.zPosition = 2
        
        starImageView.layer.zPosition = 1
        locationImageView.layer.zPosition = 1
        notificationImageView.layer.zPosition = 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starInitialPosition = starImageView.center
        locationInitialPosition = locationImageView.center
        notificationInitialPosition = notificationImageView.center
        
        starImageView.center = addCancelUIView.center
        locationImageView.center = addCancelUIView.center
        notificationImageView.center = addCancelUIView.center
        
        starImageView.isHidden = true
        locationImageView.isHidden = true
        notificationImageView.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
        
        addCancelUIView.transform = CGAffineTransform(rotationAngle: 2.35)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addCancelUIView.isUserInteractionEnabled = true
        addCancelUIView.addGestureRecognizer(tap)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        if showing {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseInOut], animations: {
                self.addCancelUIView.transform = CGAffineTransform(rotationAngle: 2.35)
                
                self.starImageView.center = self.addCancelUIView.center
                self.locationImageView.center = self.addCancelUIView.center
                self.notificationImageView.center = self.addCancelUIView.center
                
            }, completion: {_ in
                self.starImageView.isHidden = true
                self.locationImageView.isHidden = true
                self.notificationImageView.isHidden = true
            })
        } else {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseInOut], animations: {
                self.addCancelUIView.transform = CGAffineTransform(rotationAngle: 0)
                
                self.starImageView.isHidden = false
                self.locationImageView.isHidden = false
                self.notificationImageView.isHidden = false
                
                self.starImageView.center = self.starInitialPosition
                self.locationImageView.center = self.locationInitialPosition
                self.notificationImageView.center = self.notificationInitialPosition
                
            }, completion: nil)
        }
        
        showing = !showing
        
    }
    
    
}

