//
//  landingPageViewController.swift
//  pods3
//
//  Created by Enrique Zamudio on 15/08/22.
//

import UIKit

@available(iOS 11.0, *)
class landingPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Noticias(_ sender: UIButton) {
        performSegue(withIdentifier: "noticias_segue", sender: nil)
    }
    
    @IBAction func VersionImpresa(_ sender: UIButton) {
        performSegue(withIdentifier: "home_segue", sender: nil)
    }
    

}
