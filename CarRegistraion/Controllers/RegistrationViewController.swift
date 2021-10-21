//
//  ViewController.swift
//  CarRegistraion
//
//  Created by Adnann Muratovic on 21.10.21.
//

import UIKit

class RegistrationViewController: UITableViewController {

    
    // MARK: - viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
       
    }
}

// MARK: -TableView DataSource
extension RegistrationViewController {
    
    private func setupTableView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Car Registraiom"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RegistrationTableViewCell
        
        // Animation
          UIView.animate(withDuration: 0.6) {
              cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
              cell.transform = .identity
          }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            tableView.reloadData()
        }
    }
}
