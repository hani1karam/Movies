//
//  MovieInfoVC.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import UIKit
class MovieInfoVC: UIViewController {
    @IBOutlet var movieInfoTableView: UITableView!
    
   public var interactor: MovieInfoSceneBusinessLogic!
   public var dataStore: MovieInfoSceneDataStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension MovieInfoVC: MovieInfoSceneDisplayView {
    
    func display(photos: MovieInfoScene.Fetch.ViewModel) {
        dataStore.photos = photos.photos
        
        DispatchQueue.main.async { [weak self] in
            self?.movieInfoTableView.reloadData()
        }
    }
    
    func display(error: CustomError) {
        showAlert(title: nil, message: error.localizedDescription)
    }
}

extension MovieInfoVC: MoviesDelegate {
    
    func didSelectMovie(_ movie: Movie) {
        dataStore.movie = movie
        interactor.fetchMoviePhotos(title: dataStore.movie.title)
    }
}

extension MovieInfoVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if dataStore.photos.count > 0 {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let identifier = String(describing: MoviePhotosCell.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MoviePhotosCell
            cell.configure(photos: dataStore.photos)
            return cell
        } else {
            let identifier = String(describing: MovieInfoCell.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MovieInfoCell
            cell.configure(movie: dataStore.movie)
            return cell
        }
    }
}

extension MovieInfoVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return CGFloat(dataStore.photos.count * 50)
        }
        return UITableView.automaticDimension
    }
}

private extension MovieInfoVC {
    func setup() {
        setupTableView()
        self.title = "Info"
    }
    
    func setupTableView() {
        movieInfoTableView.rowHeight = UITableView.automaticDimension
        movieInfoTableView.estimatedRowHeight = 48
        register(cell: MovieInfoCell.self)
        register(cell: MoviePhotosCell.self)
        movieInfoTableView.dataSource = self
        movieInfoTableView.delegate = self
        movieInfoTableView.tableFooterView = UIView(frame: .zero)
    }
    
    func register(cell: Any) {
        let identifier = String(describing: cell)
        let nib = UINib(nibName: identifier, bundle: nil)
        movieInfoTableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
}
