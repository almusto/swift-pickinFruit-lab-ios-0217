//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      fruitPicker.delegate = self
      fruitPicker.dataSource = self
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
      let randomRow1 = Int(arc4random_uniform(UInt32(fruitsArray.count)))
      let randomRow2 = Int(arc4random_uniform(UInt32(fruitsArray.count)))
      let randomRow3 = Int(arc4random_uniform(UInt32(fruitsArray.count)))
        
      fruitPicker.selectRow(randomRow1, inComponent: 0, animated: true)
      fruitPicker.selectRow(randomRow2, inComponent: 1, animated: true)
      fruitPicker.selectRow(randomRow3, inComponent: 2, animated: true)

      if fruitPicker.selectedRow(inComponent: 0) == fruitPicker.selectedRow(inComponent: 1) && fruitPicker.selectedRow(inComponent: 0) == fruitPicker.selectedRow(inComponent: 2) {
        resultLabel.text = "WINNER!"
      } else {
      resultLabel.text = "TRY AGAIN"
      }




    }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 3

  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return fruitsArray.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return fruitsArray[row]
  }

}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



