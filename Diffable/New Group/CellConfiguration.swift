//
//  CellConfiguration.swift
//  Diffable
//
//  Created by J Oh on 7/19/24.
//

import UIKit
import SnapKit

final class CellConfiguration: UICollectionViewCell {
    static let reuseIdentifier = "FriendCell"
    
    private var profileImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.tintColor = .label
        return view
    }()
    private var nameLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15)
        return view
    }()
    private var lastChatLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 13)
        view.textColor = .secondaryLabel
        view.numberOfLines = 2
        return view
    }()
    lazy private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .leading
        view.addArrangedSubview(nameLabel)
        view.addArrangedSubview(lastChatLabel)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(stackView)
        
        profileImageView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(10)
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20)
            make.size.equalTo(70)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with friend: Friend) {
        profileImageView.image = UIImage(systemName: friend.image)
        nameLabel.text = friend.name
        lastChatLabel.text = friend.lastChat
    }
    
}
