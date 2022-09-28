//
//  tablaNotasViewController.swift
//  pods3
//
//  Created by Enrique Zamudio on 14/08/22.
//

import UIKit
import PopupDialog

class tablaNotasViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        tableView.delegate = self
    }
}

extension tablaNotasViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath)
        
        if let newCell = cell as? UserTableViewCell{
            newCell.configCelda(username: "Título Nota \(indexPath.row+1)", message: "Texto de la nota")
        }
        return cell
    }
}

extension tablaNotasViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        errorMensaje()
        print("Has seleccionado la nota número \(indexPath.row+1).")
        
        func errorMensaje(){
            
            // Prepare the popup assets
            let title = "Título Nota \(indexPath.row+1)"
            let message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            
            let image = UIImage(named: "logoNoticias")

            // Create the dialog
            let popup = PopupDialog(title: title, message: message, image: image)

            // Create buttons
            let buttonOne = CancelButton(title: "Cerrar") {
                print("Cerraste la nota.")
            }

            // Add buttons to dialog
            // Alternatively, you can use popup.addButton(buttonOne)
            // to add a single button
            popup.addButtons([buttonOne])

            // Present dialog
            self.present(popup, animated: true, completion: nil)
        }
        
    }
}


