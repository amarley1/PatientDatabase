//
//  addPatientViewController.swift
//  PatientDatabase
//
//  Created by Allison Marley on 11/15/17.
//  Copyright © 2017 ASU. All rights reserved.
//
import UIKit

class addPatientViewController: UIViewController, UITextViewDelegate {
    

    @IBOutlet weak var enterPatient: UITextView!
    
    //@IBOutlet var enterPatient: UITextView?

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePatient(_ sender: Any) {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newPatient = Patient(context: context)
        newPatient.name =  enterPatient?.text!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterPatient?.delegate = self
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
