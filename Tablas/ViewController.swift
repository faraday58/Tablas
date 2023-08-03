//
//  ViewController.swift
//  Tablas
//
//  Created by ios dev lab fi unam on 03/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTableView: UITableView!
    
    private let countries = ["España", "México", "Italia", "Francia", "Brasil", "Portugal", "Colombia", "China"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    func setUpTableView(){
        myTableView.dataSource = self //Sirve para ver que elementos tendra nuestra tabla
        
        myTableView.tableFooterView = UIView() //Se crearan celdas dependiendo del tamaño del arreglo
        myTableView.delegate = self //detectar clicks en la tabla
        myTableView.register(UINib(nibName: "MyCustomTableViewCell", bundle:nil), forCellReuseIdentifier: "myCustomCell")
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //Numero de elementos que tendra la tabla
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //Define el contenido de cada celda
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "myCell") //reutilizar celda y ahorrar recursos
            if cell == nil { //para crear por primera vez la celda
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
                cell?.backgroundColor = .orange
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                cell?.accessoryType = .checkmark
            }
            cell?.textLabel?.text = countries[indexPath.row] //acceder a cada elemento del arreglo
            return cell!
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell
        cell?.numberLabel.text = String(indexPath.row + 1)
        cell?.countryLabel.text = countries[indexPath.row]
        cell?.myImage.image = UIImage(systemName: "flag.fill")
        return cell!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 50 //tamaño celda 1
        }
        return 150 //tamaño celda custom
    }
}
extension ViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //se llama cuando se detecta un click
            print(indexPath.row + 1) // imprime la posicion del arreglo
            print(countries[indexPath.row]) //imprime el contenido del arreglo
        }
    }
