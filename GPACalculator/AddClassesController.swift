//
//  Add Classes
//
//  AddClasses.swift
//  GPACalculator
//
//  Created by Joseph Jin on 3/14/17.
//  Copyright © 2017 Animator Joe. All rights reserved.
//

import UIKit

class AddClassesController: UIViewController {

    @IBOutlet var classNameField: UITextField!
    @IBOutlet var multiplierField: UITextField!
    @IBOutlet var currentGradeField: UITextField!
    
    @IBOutlet var multiplierBar: UISegmentedControl!
    @IBOutlet var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.isHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func addNewClass(_ sender: Any) {
        
        // Class name
        guard let className = classNameField.text else {
            print("No class name specified.")
            return
        }
        
        print(className)
        
        // Multiplier
        var multiplier: Double = -1
        
        switch multiplierBar.selectedSegmentIndex {
            case 0:
                multiplier = 1
                break
            case 1:
                multiplier = 1.1
                break
            case 2:
                multiplier = 1.2
                break
            case 3:
                fallthrough
            default:
                guard let multiplierText = multiplierField.text, !multiplierText.isEmpty else {
                    print("No multiplier specified.")
                    return
                }
                
                // Can't use guard without let.
                guard let _multiplier = Double(multiplierText) else {
                    print("Malformed multiplier.")
                    return
                }
                multiplier = _multiplier
        }
        
        print(multiplier)
        
        // Current grade
        var currentGrade = -1
        
        guard let currentGradeText = currentGradeField.text, !currentGradeText.isEmpty else {
            print("No current grade specified.")
            return
        }
        guard let _currentGrade = Int(currentGradeText) else {
            print("Malformed current grade.")
            return
        }
        currentGrade = _currentGrade
        
        print(currentGrade)
        
        // Add the classclass
        guard className != "", multiplier != -1, currentGrade != -1 else {
            warningLabel.isHidden = false
            return
        }
        
        classesAndGrades.append([className,multiplier,currentGrade])
            
        UserDefaults.standard.set(classesAndGrades, forKey: "savedList")
            
        warningLabel.isHidden = true
    }
    
    
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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