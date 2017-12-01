//
//  addPatientViewController.swift
//  PatientDatabase
//
//  Created by Allison Marley on 11/15/17.
//  Copyright © 2017 ASU. All rights reserved.
//
import UIKit

class addPatientViewController: UIViewController, UITextViewDelegate {
    
    var resp1: Int = 0;
    var resp2: Int = 0;
    var gi1: Int = 0;
    var gi2: Int = 0;
    var cardiac1: Int = 0;
    var cardiac2: Int = 0;
    
    @IBOutlet weak var initialwarning: UILabel!
    
    @IBOutlet var shortBreathDisp: UISwitch!
    @IBAction func shortBreath(_ sender: UISwitch) {
        
        if (sender.isOn == true) {
            resp1 = 1;
            
        }
        else {
            resp1 = 0;
        }
        
        if cardiac1 == 1 && cardiac2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a cardiac infection or disease."
        }
        else if resp1 == 1 && resp2 == 1
        {
            
            initialwarning.text = "The symptoms indicate that your patient may have a respiratory infection or disease."
        }
        else if gi1 == 1 && gi2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease."
        }
        else{
            initialwarning.text = ""
        }
    }
    
    @IBOutlet weak var coughingDisp: UISwitch!
    @IBAction func coughing(_ sender: UISwitch) {
        if (sender.isOn == true) {
            resp2 = 1;
        }
        else {
            resp2 = 0;
        }
        
        if cardiac1 == 1 && cardiac2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a cardiac infection or disease."
        }
        else if resp1 == 1 && resp2 == 1
        {
            
            initialwarning.text = "The symptoms indicate that your patient may have a respiratory infection or disease."
        }
        else if gi1 == 1 && gi2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease."
        }
        else{
            initialwarning.text = ""
        }
    }
    
    @IBOutlet weak var nauseaDisp: UISwitch!
    @IBAction func nausea(_ sender: UISwitch) {
        if (sender.isOn == true) {
            gi1 = 1;
        }
        else {
            gi1 = 0;
        }
        
        if cardiac1 == 1 && cardiac2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a cardiac infection or disease."
        }
        else if resp1 == 1 && resp2 == 1
        {
            
            initialwarning.text = "The symptoms indicate that your patient may have a respiratory infection or disease."
        }
        else if gi1 == 1 && gi2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease."
        }
        else{
            initialwarning.text = ""
        }
    }
    
    @IBOutlet weak var vomitingDisp: UISwitch!
    @IBAction func vomiting(_ sender: UISwitch) {
        if (sender.isOn == true) {
            gi2 = 1;
        }
        else {
            gi2 = 0;
        }
        
        if cardiac1 == 1 && cardiac2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a cardiac infection or disease."
        }
        else if resp1 == 1 && resp2 == 1
        {
            
            initialwarning.text = "The symptoms indicate that your patient may have a respiratory infection or disease."
        }
        else if gi1 == 1 && gi2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease."
        }
        else{
            initialwarning.text = ""
        }
    }

    @IBOutlet weak var chestPainDisp: UISwitch!
    @IBAction func chestPain(_ sender: UISwitch) {
        if (sender.isOn == true) {
            cardiac1 = 1;
        }
        else {
            cardiac1 = 0;
        }
        
        if cardiac1 == 1 && cardiac2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a cardiac infection or disease."
        }
        else if resp1 == 1 && resp2 == 1
        {
            
            initialwarning.text = "The symptoms indicate that your patient may have a respiratory infection or disease."
        }
        else if gi1 == 1 && gi2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease."
        }
        else{
            initialwarning.text = ""
        }
    }
    
    @IBOutlet weak var numbnessDisp: UISwitch!
    @IBAction func numbness(_ sender: UISwitch) {
        if (sender.isOn == true) {
            cardiac2 = 1;
        }
        else {
            cardiac2 = 0;
        }
        
        if cardiac1 == 1 && cardiac2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a cardiac infection or disease."
        }
        else if resp1 == 1 && resp2 == 1
        {
            
            initialwarning.text = "The symptoms indicate that your patient may have a respiratory infection or disease."
        }
        else if gi1 == 1 && gi2 == 1
        {
            initialwarning.text = "The symptoms indicate that your patient may have a gastrointestinal infection or disease."
        }
        else{
            initialwarning.text = ""
        }
    }
    
    
    @IBOutlet weak var enterPatient: UITextView!
    
    //@IBOutlet var enterPatient: UITextView?

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePatient(_ sender: Any) {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newPatient = Patient(context: context)
        newPatient.name =  enterPatient?.text!
   
        //shortness of breath switch
        newPatient.resp1 = Int16(resp1)
        newPatient.resp2 = Int16(resp2)
        newPatient.gi1 = Int16(gi1)
        newPatient.gi2 = Int16(gi2)
        newPatient.cardiac1 = Int16(cardiac1)
        newPatient.cardiac2 = Int16(cardiac2)
        
            
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterPatient?.delegate = self
        
        initialwarning.lineBreakMode = .byWordWrapping
        initialwarning.numberOfLines = 0
        
        
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        
    }
    
    
}
