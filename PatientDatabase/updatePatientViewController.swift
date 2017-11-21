//
//  updatePatientViewController.swift
//  PatientDatabase
//
//  Created by Allison Marley on 11/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class updatePatientViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var shortBreathDisp: UISwitch!
    
    @IBAction func shortBreath2(_ sender: UISwitch) {
        
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var patient: Patient!

    @IBOutlet var entryText: UITextView!

    //dismisses update screen when cancel button is pressed
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func updatePatient(_ sender: Any) {
        guard let newPatient = entryText.text else  {
            return
        }
        
        //reassigns name attribute in the patient core data file to the newEntry data
        patient.name = newPatient
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //dismisses update screen after saving the updated entry
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        entryText!.becomeFirstResponder()
        
        
        
        print(patient)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        configureEntryData(entry: patient)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func configureEntryData(entry: Patient) {
        
        guard let text = entry.name else {
            return
        }
        
        entryText!.text = text
        print(shortBreathDisp.isOn)
        
        if patient.resp1 == 1
        {
            shortBreathDisp.setOn(true, animated: true)
            
        }
        else
        {
            shortBreathDisp.setOn(false, animated: true)
        }
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
}
