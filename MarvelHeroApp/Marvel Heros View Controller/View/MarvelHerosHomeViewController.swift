//
//  MarvelHerosHomeViewController.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//

import UIKit


class MarvelHerosHomeViewController: UIViewController {
    
    @IBOutlet weak var marvelHerosTableView: UITableView!
    
    var storedOffsets = [Int: CGFloat]()
    lazy var viewModel: MarvelHerosHomeViewModel = {
        return MarvelHerosHomeViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = MarvelConstants.View.navigationTitle
        
        setUpTableView()
        bindViewModel()
        viewModel.getMarvelHeros()
    }
    
    // MARK: - View Setup
    private func setUpTableView() {
        //self.title = HomeViewContants.View.navigationTitle
        marvelHerosTableView.tableFooterView = UIView()
        marvelHerosTableView.dataSource = self
        marvelHerosTableView.delegate = self
        marvelHerosTableView.estimatedRowHeight = 250
        marvelHerosTableView.rowHeight = UITableView.automaticDimension
        marvelHerosTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        // Register Talbe cell
        marvelHerosTableView.register(UINib(
                                        nibName: MarvelConstants.CellIdentifiers.tableViewHerosCollectionCell,
                                        bundle: nil),
                                      forCellReuseIdentifier: MarvelConstants.CellIdentifiers.tableViewHerosCollectionCell)
        
        marvelHerosTableView.register(UINib(
                                        nibName: MarvelConstants.CellIdentifiers.tableViewHeroInformationCell,
                                        bundle: nil),
                                      forCellReuseIdentifier: MarvelConstants.CellIdentifiers.tableViewHeroInformationCell)
    }
    // MARK: - Bindings
    private func bindViewModel() {
        
        viewModel.herosCells.bindAndFire() { [weak self] _ in
            DispatchQueue.main.async {
                guard let tableViewCell = self?.marvelHerosTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewHerosCollectionCell,
                      let collectionView = tableViewCell.collectionView else{
                    return
                }
                collectionView.reloadData()
            }
        }
        
        viewModel.comicsCells.bindAndFire() { [weak self] _ in
            DispatchQueue.main.async {
                self?.marvelHerosTableView?.reloadSections(IndexSet(integersIn: 1...1), with: .none)//reloadData()//
            }
        }
        
        viewModel.onShowError = { [weak self] alert in
            DispatchQueue.main.async {
                self?.presentSingleButtonDialog(alert: alert)
            }
        }
        
        viewModel.showLoadingHud.bind() { [weak self] visible in
            if let `self` = self {
                // TODO: Show Hide Loader
            }
        }
        
    }
    
}
// MARK: - Alert
extension MarvelHerosHomeViewController: SingleButtonDialogPresenter {
    
}
