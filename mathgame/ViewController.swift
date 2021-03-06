//
//  ViewController.swift
//  mathgame
//
//  Created by 杉山航 on 2018/02/22.
//  Copyright © 2018年 杉山航. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    var nb_num: [Int] = []
    //    @IBOutlet weak var num_answer: UITextField!
    @IBOutlet weak var numl_1: UILabel!
    @IBOutlet weak var numl_2: UILabel!
    @IBOutlet weak var numl_3: UILabel!
    @IBOutlet weak var num_answer: UILabel!
    @IBOutlet weak var ruijo_label: UILabel!
    
    var num_1: UInt64 = 1
    var num_2: UInt64 = 1
    var num_3: UInt64 = 2
    var tmp_answer: UInt64 = 0
    var ruijo_count: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numl_1.text = String(num_1)
        numl_2.text = String(num_2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func num_typ(sender: AnyObject) {
        tmp_answer = tmp_answer * 10 + UInt64(sender.tag)
        num_answer.text = String(tmp_answer)
        if tmp_answer == num_3 {
            num_1 *= 2
            num_2 *= 2
            num_3 *= 2
            numl_1.text = String(num_1)
            numl_2.text = String(num_2)
            tmp_answer = 0
            num_answer.text = String(tmp_answer)
            ruijo_count += 1
            ruijo_label.text = String(ruijo_count)
        }
        else if num_3 >= 10 {
            
        }
        else {
            let alert:UIAlertController = UIAlertController(title: "不正解！", message: "正解は"+String(num_3)+"", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style:.default,
                    handler: {action in
                        //ボタンが押された時の動作
                        NSLog("OKが押された")
                        self.num_1 = 1
                        self.num_2 = 1
                        self.num_3 = 2
                        self.numl_1.text = String(self.num_1)
                        self.numl_2.text = String(self.num_2)
                        self.tmp_answer = 0
                        self.num_answer.text = String(self.tmp_answer)
                }
                )
            )
            present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func delete_num(_ sender: Any) {
        tmp_answer = tmp_answer / 10
        num_answer.text = String(tmp_answer)
    }
    @IBAction func clear_num(_ sender: Any) {
        tmp_answer = 0
        num_answer.text = String(tmp_answer)
    }
    
}

