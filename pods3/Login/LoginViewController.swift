//
//  LoginViewController.swift
//  pods3
//
//  Created by Enrique Zamudio on 19/07/22.
//

import UIKit
import PopupDialog

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func loginButton() {
        let email = emailTextField.text
        let pass = passTextField.text
        
        if email == "se.zamudio@gmail.com" && pass == "1234"{
            performSegue(withIdentifier: "landinPage_segue", sender: nil)
            print("Bienvenido")
        }else{
            errorMensaje()
            print("Credenciales inválidas")
        }
        
    }

    private func errorMensaje(){
        
        // Prepare the popup assets
        let title = "Error"
        let message = "Credenciales inválidas"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "Intentar de nuevo") {
            print("You canceled the car dialog.")
        }

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
}
