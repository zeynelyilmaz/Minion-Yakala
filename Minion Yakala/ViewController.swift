//
//  ViewController.swift
//  Minion Yakala
//
//  Created by yilmazz on 28.09.2018.
//  Copyright © 2018 yilmazz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var skor = 20
    var winskor = 0
    var gameTimer: Timer!
    var hideTimer: Timer!
    let interval = 0.5
    
    @IBOutlet weak var lblSkor: UILabel!
    @IBOutlet weak var lblwinSkor: UILabel!
    @IBOutlet weak var lblKarakter: UILabel!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    
    var images = [UIImageView]()            // images array
    
    var minions = ["Minion-Curious-icon", "Minion-Dancing-icon", "Minion-Evil-3-icon", "Minion-Evil-4-icon", "Minion-Girl-icon", "Minion-Happy-icon", "Minion-Playing-Golf-icon", "Minion-Reading-icon", "Minion-Sad-icon"]
    
    var monsters = ["Monsters-5-icon", "Monsters-Art-icon", "Monsters-Cute-Blue-icon", "Monsters-Fish-icon", "Monsters-James-P-Sullivan-icon", "Monsters-Randy-icon", "Monsters-Scary-icon", "Monsters-Snail-icon", "Monsters-Young-Mikes-icon"]
    
    var character = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // append images to the array
        images.append(img1)
        images.append(img2)
        images.append(img3)
        images.append(img4)
        images.append(img5)
        images.append(img6)
        images.append(img7)
        images.append(img8)
        images.append(img9)
        
        // load selected character icons
        if (character == "minions") {
            for iconImage in 0..<minions.count {
                images[iconImage].image = UIImage(named: minions[iconImage])
            }
            // update character as selected
            lblKarakter.text = "Minion Yakala"
        }
        else if (character == "monsters") {
            for iconImage in 0..<monsters.count {
                images[iconImage].image = UIImage(named: monsters[iconImage])
            }
            // update character as selected
            lblKarakter.text = "Monster Yakala"
        }
        
        // add recognizers to the images
        // UserInteractions must be enabled (img1.isUserInteractionEnabled = true)
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        img1.addGestureRecognizer(recognizer1)
        
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        img2.addGestureRecognizer(recognizer2)
        
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        img3.addGestureRecognizer(recognizer3)
        
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        img4.addGestureRecognizer(recognizer4)
        
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        img5.addGestureRecognizer(recognizer5)
        
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        img6.addGestureRecognizer(recognizer6)
        
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        img7.addGestureRecognizer(recognizer7)
        
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        img8.addGestureRecognizer(recognizer8)
        
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        img9.addGestureRecognizer(recognizer9)
        
        
        showOneMinion()
        
        
        gameTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(showOneMinion), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func skorArttir() {
        winskor = winskor + 1
        lblwinSkor.text = String(winskor)
    }
    
    
    @objc func showOneMinion() {
        for minion in images {
            minion.isHidden = true          // hide all
        }
        
        let randomNumber = Int(arc4random_uniform(UInt32(images.count)-1)) // range 0...8
        images[randomNumber].isHidden = false   // show one
    }
    
    
    @objc func runTimedCode() {
        skor = skor - 1
        lblSkor.text = String(skor)
        
        if (skor == 0) {
            gameTimer.invalidate()
            hideTimer.invalidate()
            
            // Alert
            let alert = UIAlertController(title: "Oyun Bitti", message: "Oyun sona erdi. \n Yeniden oynamak ister misiniz?", preferredStyle: UIAlertControllerStyle.alert)
            
            let btnOK = UIAlertAction(title: "Evet", style: UIAlertActionStyle.default) { (UIAlertAction) in
                self.gameTimerResume()
            }
            
            let btnCancel = UIAlertAction(title: "Hayır", style: UIAlertActionStyle.cancel) { (UIAlertAction) in
                self.performSegue(withIdentifier: "VC2", sender: nil)
            }
            
            alert.addAction(btnOK)
            alert.addAction(btnCancel)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func gameTimerResume() {
        skor = 20
        winskor = 0
        
        lblSkor.text = String(skor)
        //lblwinSkor.text = "Skor: \(String(winskor))"
        lblwinSkor.text = String(winskor)
        
        gameTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(showOneMinion), userInfo: nil, repeats: true)
    }


}

