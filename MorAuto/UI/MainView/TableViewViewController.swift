//
//  TableViewViewController.swift
//  MorAuto
//
//  Created by Manuel Moreno Cámara on 4/12/21.
//

import UIKit

class TableViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    private var cars = Cars()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Coches"
        cars.append(contentsOf: CarRepository().cars)
        
        tableView?.dataSource = self
        tableView?.delegate = self
    }
}

extension TableViewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as? CarCell else {
            return UITableViewCell()
        }
        
        if cars.count > indexPath.row {
            let car = cars[indexPath.row]
            
            cell.datesViews(image: car.image, marca: car.marca, model: car.model, value: car.value)
        }
        
        return cell
    }
}

extension TableViewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if cars.count > indexPath.row {
            let car = cars[indexPath.row]
                
                let storyBoardDescription = UIStoryboard(name: "DescriptionView", bundle: nil)
                
                if let destination = storyBoardDescription.instantiateInitialViewController() as? DescriptionViewController {
                    destination.insertDates(image: car.image, description: car.description, type: .car)
                    self.navigationController?.pushViewController(destination, animated: true)
            }
        }
    }
}
