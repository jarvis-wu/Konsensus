////
////  HomeViewController.swift
////  LocalHackDay2018
////
////  Created by Ziad Hamdieh on 2018-12-01.
////  Copyright © 2018 Jarvis Wu. All rights reserved.
////

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    private let items = ["item1", "item2", "item3", "item4"]

    private let appStyle = AppStyle()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupSearchBar()
        
        navigationController?.navigationBar.isHidden = true
        
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = .black
        navigationController?.navigationBar.backgroundColor = .black
    }

    func setupTableView() {

        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 0
        tableView.backgroundColor = .black
    }
    
    func setupSearchBar() {
        searchBar.showsCancelButton = false
        searchBar.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieCell
//        cell.title.text = "A"
//        cell.imageView?.image = nil
//        cell.genre.text = "B"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath.row, animated: false)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.textLabel?.text = "Now Showing"
        return headerView
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
//        let searchQuery = ""
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("running textDidChange")
//        let filteredMovies = items.filter { $0.contains(searchBar.text) }
        tableView.reloadData()
    }
    
}
