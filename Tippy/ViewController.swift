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
    @IBOutlet weak var splitBillView: UIView!
    @IBOutlet weak var twoPerson: UILabel!
    @IBOutlet weak var threePerson: UILabel!
    @IBOutlet weak var fourPerson: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shouldFillBillAmount()
        calculateTip()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        billField.becomeFirstResponder()
    
        let tipDefault = defaults.integer(forKey: "tipDefault")
        tipControl.selectedSegmentIndex = tipDefault
        self.splitBillView.alpha = 0
        setBackgroundColor()
    }
    
    func shouldFillBillAmount()
    {
        let theLastDate = defaults.object(forKey:"lastDateOpened") as? Date
        let now = Date()
        var interval = DateInterval.init(start: theLastDate!, end: now)
        
        let timeInterval = interval.duration
        let i = Int(timeInterval)
        if (i < 600)
        {
            if (defaults.object(forKey: "BillAmount") != nil) {
                let billAmount = defaults.double(forKey: "BillAmount")
                billField.text = String(format: "%.2f", billAmount)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        defaults.set(Date(), forKey: "lastDateOpened")
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
        shouldFillBillAmount()
        
        UIView.animate(withDuration: 1, animations: {
            self.splitBillView.alpha = 1
        })
    }

    @IBAction func calculateTipOnChange(_ sender: AnyObject) {
        let tipValues = [0.15, 0.2, 0.25]

        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipValues[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        defaults.set(billField.text, forKey: "BillAmount")
        defaults.synchronize()
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoPerson.text = String(format: "$%.2f", total/2)
        threePerson.text = String(format: "$%.2f", total/3)
        fourPerson.text = String(format: "$%.2f", total/4)
    }
    
    func calculateTip()
    {
        let tipValues = [0.15, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipValues[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoPerson.text = String(format: "$%.2f", total/2)
        threePerson.text = String(format: "$%.2f", total/3)
        fourPerson.text = String(format: "$%.2f", total/4)
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
