//
//  ConutriesViewController.swift
//  Countries
//
//  Created by omari katamadze on 18.12.22.
//

import UIKit

class ConutriesViewController: UIViewController {

    let searchBar = UISearchController()
    @IBOutlet weak var tableView: UITableView!
    var countriesFiltred : [Country] = []
    var apiManager : ApiManagerProtocol?
    var countriesList = DatasourceCountries.shared.countries {
        didSet {
            countriesFiltred = countriesList
            tableView.reloadData()
            }
    }
    
  
    var serching : Bool = false
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupApiManager()
        navigationItem.searchController = searchBar
        searchBar.searchResultsUpdater = self
        searchBar.searchBar.delegate = self
        // Do any additional setup after loading the view.
    }

    func setupApiManager(){
        apiManager = ApiManager()
            self.apiManager?.fetchCountries(
                complintion:{ countriesList in
                    self.countriesList = countriesList
                }
            )
        setupTableView()
    }
    
    func setupTableView(){
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: TableViewCell.className, bundle: nil), forCellReuseIdentifier: TableViewCell.className)
        
    }
    
    

}


extension ConutriesViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countriesFiltred.count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.className, for: indexPath) as! TableViewCell
        cell.configure(with: countriesFiltred[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let sb = UIStoryboard(name: "Country", bundle: nil)
          let vc = sb.instantiateViewController(withIdentifier: "Country") as! CountryViewController
       // vc.myDelegate = self
        
        vc._cca2 = String(countriesFiltred[indexPath.row].cca2)
        vc._region = String(countriesFiltred[indexPath.row].region)
        vc._population = countriesFiltred[indexPath.row].population
        vc._coutryName = countriesFiltred[indexPath.row].name.common
        vc._capital = countriesFiltred[indexPath.row].capital!.joined(separator: " ")
        vc._coatOfArms = countriesFiltred[indexPath.row].coatOfArms.png ?? ""
        vc._flag =  countriesFiltred[indexPath.row].flags.png ?? ""
           navigationController?.pushViewController(vc, animated: true)
   
          
      }
}

extension ConutriesViewController : UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        _ = searchController.searchResultsController as? ConutriesViewController
        if( text == "") { countriesFiltred = countriesList
            } else {
                countriesFiltred = countriesList.filter({$0.name.common.lowercased().contains(text.lowercased())})
                
            }
        serching = true
        tableView.reloadData()
    }
   /* func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if( searchText == "") { countriesFiltred = countriesList
            } else {
                countriesFiltred = countriesList.filter({$0.name.common.lowercased().contains(searchText.lowercased())})
                
            }
        serching = true
        tableView.reloadData()
      
           }
   */
    
    
    
    
}

