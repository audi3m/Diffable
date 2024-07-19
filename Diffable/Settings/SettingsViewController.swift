//
//  ViewController.swift
//  Diffable
//
//  Created by J Oh on 7/19/24.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {

    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    var dataSource: UICollectionViewDiffableDataSource<Settings, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "설정"
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view)
        }
        
        configDataSource()
        updateSnapshot()
    }
    
    private func configDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, Item>!
        registration = UICollectionView.CellRegistration { cell, indexPath, item in
            var cellContent = UIListContentConfiguration.valueCell()
            cellContent.text = item.name
            cellContent.textProperties.font = .systemFont(ofSize: 17)
            cellContent.image = UIImage(systemName: item.image)
            cellContent.imageProperties.tintColor = .label
            let config = UIImage.SymbolConfiguration(pointSize: 17)
            cellContent.imageProperties.preferredSymbolConfiguration = config
            cell.contentConfiguration = cellContent
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
            return cell
        })
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Settings, Item>()
        snapshot.appendSections(Settings.allCases)
        snapshot.appendItems(Settings.all.items, toSection: .all)
        snapshot.appendItems(Settings.personal.items, toSection: .personal)
        snapshot.appendItems(Settings.etc.items, toSection: .etc)
        dataSource.apply(snapshot) // reload
    }
    
    func layout() -> UICollectionViewCompositionalLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }

}



