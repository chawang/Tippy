//
//  ViewController.swift
//  Tippy
//
//  Created by Charles Wang on 9/25/16.
//  Copyright © 2016 Charles Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var settingsButtons: UIBarButtonItem!
    @IBOutlet var theView: UIView!
    let defaults = UserDefaults.standard
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        let tipDefault = defaults.integer(forKey: "tipDefault")
        tipControl.selectedSegmentIndex = tipDefault
        
        setBackgroundColor()
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTipOnChange(_ sender: AnyObject) {
        let tipValues = [0.15, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipValues[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func setBackgroundColor()
    {
        let colorDefault = defaults.integer(forKey: "backgroundColor")
        if (colorDefault == 0)
        {theView.backgroundColor = UIColor.cyan}
        if (colorDefault == 1)
        {theView.backgroundColor = UIColor.orange}
    }
}
