//
//  HelpCategoriesView.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 26.01.2023.
//

import UIKit
import SnapKit

final class HelpCategoriesView: UIView {

    // MARK: Subviews
    let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        return collectionView
    }()

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureUI()
    }

    // MARK: UI
    private func layoutCollectionSetup() {
        collectionViewLayout.headerReferenceSize = .zero
        collectionViewLayout.footerReferenceSize = .zero
        collectionViewLayout.scrollDirection = .vertical
    }

    private func configureUI() {
        self.layoutCollectionSetup()
        self.backgroundColor = UIColor.backgroundColorHelpCategoriesScr
        self.addCollectionView()
        self.setupConstraints()

    }

    private func addCollectionView() {
        self.addSubview(self.collectionView)
    }

    private func setupConstraints() {
        let selfArea = self.safeAreaLayoutGuide
        self.collectionView.snp.makeConstraints { make in
            make.leading.equalTo(selfArea.snp.leading)
            make.trailing.equalTo(selfArea.snp.trailing)
            make.bottom.equalTo(selfArea.snp.bottom)
            make.top.equalTo(selfArea.snp.top)
        }
    }
}
