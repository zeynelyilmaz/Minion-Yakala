//
//  ViewController0.swift
//  Minion Yakala
//
//  Created by yilmazz on 6.10.2018.
//  Copyright © 2018 yilmazz. All rights reserved.
//

import UIKit

class ViewController0: UIViewController {

    var selectedCharacter = ""
    
    @IBOutlet weak var btnMinion: UIButton!
    @IBOutlet weak var btnMonster: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let hedefVC = segue.destination as! ViewController
        hedefVC.character = selectedCharacter
    }
    
    @IBAction func btnMinionClicked(_ sender: Any) {
        selectedCharacter = "minions"
        self.performSegue(withIdentifier: "VC1", sender: nil)
    }
    
    @IBAction func btnMonsterClicked(_ sender: Any) {
        selectedCharacter = "monsters"
        self.performSegue(withIdentifier: "VC1", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        selectedCharacter = ""
        
        btnMinion.layer.cornerRadius = 20;
        btnMinion.layer.borderWidth = 4;
        btnMinion.layer.borderColor = UIColor(red:136/255.0, green:62/255.0, blue:251/255.0, alpha: 1.0).cgColor
        btnMinion.clipsToBounds = true;
        
        btnMonster.layer.cornerRadius = 15;
        btnMonster.layer.borderWidth = 4;
        btnMonster.layer.borderColor = UIColor(red:136/255.0, green:62/255.0, blue:251/255.0, alpha: 1.0).cgColor
        btnMonster.clipsToBounds = true;
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
