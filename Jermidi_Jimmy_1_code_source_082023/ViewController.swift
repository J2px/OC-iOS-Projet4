//
//  ViewController.swift
//  Jermidi_Jimmy_1_code_source_082023
//
//  Created by Jimmy JERMIDI on 22/08/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addView1: UIView!
    @IBOutlet weak var addButton1: UIButton!
    @IBOutlet weak var addView2: UIView!
    @IBOutlet weak var addButton2: UIButton!
    @IBOutlet weak var addView3: UIView!
    @IBOutlet weak var addButton3: UIButton!
    @IBOutlet weak var addView4: UIView!
    @IBOutlet weak var addButton4: UIButton!
    @IBOutlet weak var rectAddViewTop: UIView!
    @IBOutlet weak var addButtonTop: UIButton!
    @IBOutlet weak var rectAddViewBottom: UIView!
    @IBOutlet weak var addButtonBottom: UIButton!
    @IBOutlet weak var selectView1: UIView!
    @IBOutlet weak var selectedView1: UIImageView!
    @IBOutlet weak var selectButton1: UIButton!
    @IBOutlet weak var selectView2: UIView!
    @IBOutlet weak var selectedView2: UIImageView!
    @IBOutlet weak var selectedButton2: UIButton!
    @IBOutlet weak var selectView3: UIView!
    @IBOutlet weak var selectedView3: UIImageView!
    @IBOutlet weak var selectButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideViews1()
        
    }

    @IBAction func tapSelect1(_ sender: Any) {
        startOption1()
    }
    
    @IBAction func tapSelect2(_ sender: Any) {
        startOption2()
    }
    
    @IBAction func tapSelect3(_ sender: Any) {
        startOption3()
    }
    
    private func startOption1(){
        hideViews1()
        
    }
    
    private func startOption2(){
        hideViews2()
        
    }
    
    private func startOption3(){
        hideViews3()
        
    }
    
    private func hideViews1(){
        selectedView1.isHidden = false
        selectedView2.isHidden = true
        selectedView3.isHidden = true
        addView1.isHidden = true
        addView2.isHidden = true
        addView3.isHidden = false
        addView4.isHidden = false
        rectAddViewTop.isHidden = false
        rectAddViewBottom.isHidden = true
    }
    
    private func hideViews2(){
        selectedView1.isHidden = true
        selectedView2.isHidden = false
        selectedView3.isHidden = true
        addView1.isHidden = false
        addView2.isHidden = false
        addView3.isHidden = true
        addView4.isHidden = true
        rectAddViewTop.isHidden = true
        rectAddViewBottom.isHidden = false
    }
    
    private func hideViews3(){
        selectedView1.isHidden = true
        selectedView2.isHidden = true
        selectedView3.isHidden = false
        addView1.isHidden = false
        addView2.isHidden = false
        addView3.isHidden = false
        addView4.isHidden = false
        rectAddViewTop.isHidden = true
        rectAddViewBottom.isHidden = true
        
    }
    
}

