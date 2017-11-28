//
//  updatePatientViewController.swift
//  PatientDatabase
//
//  Created by Allison Marley on 11/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class updatePatientViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var warning: UILabel!

    
    @IBOutlet var shortBreathDisp: UISwitch!
    
    @IBAction func shortBreath2(_ sender: UISwitch) {
        if (sender.isOn == true) {
            patient.resp1 = 1;
            
        }
        else {
            patient.resp1 = 0;
        }
        
        if patient.cardiac1 == 1 && patient.cardiac2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a cardiac infection or disease. Please perform additional evaluation."
        }
        else if patient.resp1 == 1 && patient.resp2 == 1
        {
            
            warning.text = "The symptoms indicate that your patient may have a respiratory infection or disease. Please perform additional evaluation."
        }
        else if patient.gi1 == 1 && patient.gi2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease. Please perform additional evaluation."
        }
        else{
            warning.text = ""
        }
    }
    
    @IBOutlet weak var coughingDisp: UISwitch!
    @IBAction func coughing2(_ sender: UISwitch) {
        if (sender.isOn == true) {
            patient.resp2 = 1;
            
        }
        else {
            patient.resp2 = 0;
        }
        
        if patient.cardiac1 == 1 && patient.cardiac2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a cardiac infection or disease. Please perform additional evaluation."
        }
        else if patient.resp1 == 1 && patient.resp2 == 1
        {
            
            warning.text = "The symptoms indicate that your patient may have a respiratory infection or disease. Please perform additional evaluation."
        }
        else if patient.gi1 == 1 && patient.gi2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease. Please perform additional evaluation."
        }
        else{
            warning.text = ""
        }
    }
    
    @IBOutlet weak var nauseaDisp: UISwitch!
    @IBAction func nausea2(_ sender: UISwitch) {
        if (sender.isOn == true) {
            patient.gi1 = 1;
            
        }
        else {
            patient.gi1 = 0;
        }
        
        if patient.cardiac1 == 1 && patient.cardiac2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a cardiac infection or disease. Please perform additional evaluation."
        }
        else if patient.resp1 == 1 && patient.resp2 == 1
        {
            
            warning.text = "The symptoms indicate that your patient may have a respiratory infection or disease. Please perform additional evaluation."
        }
        else if patient.gi1 == 1 && patient.gi2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease. Please perform additional evaluation."
        }
        else{
            warning.text = ""
        }
    }

    @IBOutlet weak var vomitingDisp: UISwitch!
    @IBAction func vomiting2(_ sender: UISwitch) {
        if (sender.isOn == true) {
            patient.gi2 = 1;
            
        }
        else {
            patient.gi2 = 0;
        }
        
        if patient.cardiac1 == 1 && patient.cardiac2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a cardiac infection or disease. Please perform additional evaluation."
        }
        else if patient.resp1 == 1 && patient.resp2 == 1
        {
            
            warning.text = "The symptoms indicate that your patient may have a respiratory infection or disease. Please perform additional evaluation."
        }
        else if patient.gi1 == 1 && patient.gi2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease. Please perform additional evaluation."
        }
        else{
            warning.text = ""
        }
    }
    
    @IBOutlet weak var chestPainDisp: UISwitch!
    @IBAction func chestPain2(_ sender: UISwitch) {
        if (sender.isOn == true) {
            patient.cardiac1 = 1;
            
        }
        else {
            patient.cardiac1 = 0;
        }
        
        if patient.cardiac1 == 1 && patient.cardiac2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a cardiac infection or disease. Please perform additional evaluation."
        }
        else if patient.resp1 == 1 && patient.resp2 == 1
        {
            
            warning.text = "The symptoms indicate that your patient may have a respiratory infection or disease. Please perform additional evaluation."
        }
        else if patient.gi1 == 1 && patient.gi2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease. Please perform additional evaluation."
        }
        else{
            warning.text = ""
        }
    }
    
    @IBOutlet weak var numbnessDisp: UISwitch!
    @IBAction func numbness2(_ sender: UISwitch) {
        if (sender.isOn == true) {
            patient.cardiac2 = 1;
            
        }
        else {
            patient.cardiac2 = 0;
        }
        
        if patient.cardiac1 == 1 && patient.cardiac2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a cardiac infection or disease. Please perform additional evaluation."
        }
        else if patient.resp1 == 1 && patient.resp2 == 1
        {
            
            warning.text = "The symptoms indicate that your patient may have a respiratory infection or disease. Please perform additional evaluation."
        }
        else if patient.gi1 == 1 && patient.gi2 == 1
        {
            warning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease. Please perform additional evaluation."
        }
        else{
            warning.text = ""
        }
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
        
        warning.lineBreakMode = .byWordWrapping
        warning.numberOfLines = 0
        
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
        
        if patient.resp2 == 1
        {
            coughingDisp.setOn(true, animated: true)
        }
        else
        {
            coughingDisp.setOn(false, animated: true)
        }
        
        if patient.gi1 == 1
        {
            nauseaDisp.setOn(true, animated: true)
        }
        else
        {
            nauseaDisp.setOn(false, animated: true)
        }
        
        if patient.gi2 == 1
        {
            vomitingDisp.setOn(true, animated: true)
        }
        else
        {
            vomitingDisp.setOn(false, animated: true)
        }
        
        if patient.cardiac1 == 1
        {
            chestPainDisp.setOn(true, animated: true)
        }
        else
        {
            chestPainDisp.setOn(false, animated: true)
        }
        
        if patient.cardiac2 == 1
        {
            numbnessDisp.setOn(true, animated: true)
        }
        else
        {
            numbnessDisp.setOn(false, animated: true)
        }
        

        
        if patient.cardiac1 == 1 && patient.cardiac2 == 1
        {
        warning.text = "The symptoms indicate that your patient may have a cardiac infection or disease. Please perform additional evaluation."
        }
        else if patient.resp1 == 1 && patient.resp2 == 1
        {

            warning.text = "The symptoms indicate that your patient may have a respiratory infection or disease. Please perform additional evaluation."
        }
        else if patient.gi1 == 1 && patient.gi2 == 1
        {
        warning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease. Please perform additional evaluation."
        }
        else{
        warning.text = ""
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
