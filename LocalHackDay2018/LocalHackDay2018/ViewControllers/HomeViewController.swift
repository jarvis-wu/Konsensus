////
////  HomeViewController.swift
////  LocalHackDay2018
////
////  Created by Ziad Hamdieh on 2018-12-01.
////  Copyright © 2018 Jarvis Wu. All rights reserved.
////

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private var movies = [Movie]()
    private var filteredMovies = [Movie]()
    private let appStyle = AppStyle()
    private var isSearching = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupSearchBar()
        
        let movie1 = Movie(title: "The Grinch", genre: "Fantasy", rating: 6.4, imageUrl: "TheGrinch")
        let movie2 = Movie(title: "Creed 2", genre: "Drama/Sport", rating: 8.0, imageUrl: "Creed2")
        let movie3 = Movie(title: "Robin Hood", genre: "Fantasy", rating: 5.3, imageUrl: "RobinHood")
        let movie4 = Movie(title: "Bohemian Rhapsody", genre: "Drama/Biography", rating: 8.4, imageUrl: "BoRha")
        let movie5 = Movie(title: "Venom", genre: "Thriller/Science Fiction", rating: 7.0, imageUrl: "Venom")
        movies = [movie1, movie2, movie3, movie4, movie5]
        
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
        if isSearching {
            return filteredMovies.count
        }
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieCell
        cell.selectionStyle = .none
        if isSearching {
            cell.title.text = filteredMovies[indexPath.row].title
            cell.genre.text = filteredMovies[indexPath.row].genre
            cell.rating.text = String(filteredMovies[indexPath.row].rating)
            cell.movieSplash.image = UIImage(named: filteredMovies[indexPath.row].imageUrl)
        } else {
            cell.title.text = movies[indexPath.row].title
            cell.genre.text = movies[indexPath.row].genre
            cell.rating.text = String(movies[indexPath.row].rating)
            cell.movieSplash.image = UIImage(named: movies[indexPath.row].imageUrl)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == 0 {
            present(UIViewController(), animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.textLabel?.text = "Now Showing"
        return headerView
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        isSearching = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        //        let searchQuery = ""
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        isSearching = false
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMovies = movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        if searchText.isEmpty {
            filteredMovies = movies
        }
        tableView.reloadData()
        print("\(filteredMovies)")
    }
    
}
