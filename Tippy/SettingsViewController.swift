//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Charles Wang on 9/25/16.
//  Copyright © 2016 Charles Wang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet var theView: UIView!
    @IBOutlet weak var backgroundColorControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipDefault")
        
        setBackgroundColor()
        backgroundColorControl.selectedSegmentIndex = defaults.integer(forKey: "backgroundColor")
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func defaultTipSetter(_ sender: AnyObject) {
        let defaultTip = tipControl.selectedSegmentIndex
        print("\(defaultTip)")
        
        defaults.set(defaultTip, forKey: "tipDefault")
        defaults.synchronize()
    }
    
    @IBAction func changeBackground(_ sender: AnyObject) {
        let defaultColor = backgroundColorControl.selectedSegmentIndex
        defaults.set(defaultColor, forKey: "backgroundColor")
        defaults.synchronize()
        
        setBackgroundColor()
    }
    
    func setBackgroundColor()
    {
        let colorDefault = defaults.integer(forKey: "backgroundColor")
        if (colorDefault == 0)
        {theView.backgroundColor = UIColor.white}
        if (colorDefault == 1)
        {theView.backgroundColor = UIColor.black}
    }
}
