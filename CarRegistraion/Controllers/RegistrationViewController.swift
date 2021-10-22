//
//  ViewController.swift
//  CarRegistraion
//
//  Created by Adnann Muratovic on 21.10.21.
//

import UIKit

class RegistrationViewController: UITableViewController {
    
    var welcomeElement = [Welcome]()

    // MARK: - viewLifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        parseJson()
        self.tableView.allowsMultipleSelection = true
        setupTableView()
        
    }
}

// MARK: - Parse and Load JSON
extension RegistrationViewController {
    fileprivate func parseJson() {
        if let url = URL(string: "https://registration-springboot.herokuapp.com/api/registracija") {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    if let error = error {
                        print(error)
                    }
                    
                    return
                }
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    let jsonResult = try jsonDecoder.decode(Welcome.self, from: data)
                    print(jsonResult)
                    
                    DispatchQueue.main.async {
                        self.welcomeElement.append(jsonResult)
                        print(self.welcomeElement)
                        self.tableView.reloadData()
                    }
                    
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            
            task.resume()
        }
    }
}

// MARK: -TableView DataSource
extension RegistrationViewController {
    
    private func setupTableView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Car Registration"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return welcomeElement.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RegistrationTableViewCell
    
        if tableView == self.tableView {
            let elem = welcomeElement[indexPath.item]
            cell.nameLabel.text = elem[indexPath.item].registrovanoNaOsobuDto.ime
            cell.lastNameLabel.text = String(elem[indexPath.item].registrovanoNaOsobuDto.jmbg)
        }
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
