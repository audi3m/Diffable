//
//  ChatList.swift
//  Diffable
//
//  Created by J Oh on 7/19/24.
//

import UIKit
import SnapKit

final class ChatList: UIViewController {
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    var dataSource: UICollectionViewDiffableDataSource<Chat, Friend>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "채팅"
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view)
        }
        
        configDataSource()
        updateSnapshot()
        
    }
    
    private func configDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, Friend>!
        registration = UICollectionView.CellRegistration { cell, indexPath, item in
//            var config = UIListContentConfiguration.makeContentView(MyContentConfiguration)
            let config = self.configContent(item: item)
            cell.contentConfiguration = config
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
            return cell
        })
        
    }
    
    private func configContent(item: Friend) -> UIListContentConfiguration {
        var cellContent = UIListContentConfiguration.subtitleCell()
        
        cellContent.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        cellContent.text = item.name
        cellContent.textProperties.font = .systemFont(ofSize: 17)
        cellContent.textToSecondaryTextVerticalPadding = 10
        cellContent.secondaryText = item.lastChat
        cellContent.secondaryTextProperties.numberOfLines = 2
        cellContent.secondaryTextProperties.font = .systemFont(ofSize: 13)
        cellContent.secondaryTextProperties.color = .secondaryLabel
        cellContent.image = UIImage(systemName: item.image)
        cellContent.imageProperties.tintColor = .label
        cellContent.imageToTextPadding = 20
        
        let config = UIImage.SymbolConfiguration(pointSize: 35)
        cellContent.imageProperties.preferredSymbolConfiguration = config
        
        return cellContent
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Chat, Friend>()
        snapshot.appendSections(Chat.allCases)
        snapshot.appendItems(Chat.all.friends, toSection: .all)
        dataSource.apply(snapshot) // reload
    }
    
    func layout() -> UICollectionViewCompositionalLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
}
