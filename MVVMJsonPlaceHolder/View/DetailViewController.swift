//
//  DetailViewController.swift
//  MVVMJsonPlaceHolder
//
//  Created by Soner Karaevli on 20.04.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var bodyTxt: UILabel!
    
    var selectedBodyTxt: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bodyTxt.text = selectedBodyTxt
    }
    


}
