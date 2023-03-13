//
//  HelpCategoriesViewController.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 26.01.2023.
//

import UIKit

final class HelpCategoriesViewController: UIViewController {

    // MARK: Properties
    var setCell: [Cathegory] = []

    // MARK: Private Properties
    private let viewModel: HelpCategoriesModel
    private let helpCategoriesView = HelpCategoriesView()

    // MARK: Construction
    init(viewModel: HelpCategoriesModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: LifeCycle
    override func loadView() {
        super.loadView()
        self.view = helpCategoriesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.helpCategoriesView.collectionView.register(
            HelpCategoriesCollectionCell.self,
            forCellWithReuseIdentifier:
            Constants.helpCategoriesCellReuseID)
        self.helpCategoriesView.collectionView.register(
            HeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: Constants.helpCatCellHeaderReuseID)
        self.helpCategoriesView.collectionView.delegate = self
        self.helpCategoriesView.collectionView.dataSource = self
        self.bindViewModel()

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.backgroundColorNavigationBar
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.compactAppearance = appearance

        let labelTitle: UILabel = UILabel()
        labelTitle.text = Constants.titleHelpCatScreen
        labelTitle.textColor = UIColor.white
        labelTitle.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: 21)!
        labelTitle.heightAnchor.constraint(equalToConstant: Constants.headerHelpCatHeight).isActive = true
        self.navigationItem.titleView = labelTitle

        let exitButtonItem = UIBarButtonItem(
            image: UIImage(named: Constants.helpCatBackImageName),
            style: .plain,
            target: nil,
            action: #selector(NSXPCConnection.suspend))
        exitButtonItem.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = exitButtonItem
    }

    private func bindViewModel() {
        let queue = DispatchQueue.global(qos: .background)
        queue.async {
            self.setCell = self.viewModel.data
            DispatchQueue.main.async {
                self.helpCategoriesView.collectionView.reloadData()
            }
        }
    }
}

// MARK: UICollectionViewDataSource
extension HelpCategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setCell.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.helpCategoriesCellReuseID,
            for: indexPath) as? HelpCategoriesCollectionCell else {
            return UICollectionViewCell()
        }

        let app = setCell[indexPath.item]
        configure(cell: cell, with: app)

        return cell
    }

    private func configure(cell: HelpCategoriesCollectionCell, with app: Cathegory) {
        cell.label.text = app.title
        cell.imageView.image = UIImage(named: app.image)
    }
}

// MARK: UICollectionViewDelegate
extension HelpCategoriesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(EventViewController(viewModel: EventViewModel(selectCathegoryID: 1)),
                                                 animated: true)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension HelpCategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = Constants.coeffWidthHelpCell*collectionView.bounds.size.width
        let roundWidthCell = widthCell.rounded(.down)
        let heightCell = Constants.relationHeightOfWidthHelpCell*roundWidthCell
        let size: CGSize = CGSize(width: roundWidthCell, height: heightCell)
        return size
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
        let edgeInset = Constants.coefInsetAllSide*collectionView.bounds.size.width
        let roundEdgeInset = ((edgeInset*10).rounded(.down))/10
        let edgeInsets: UIEdgeInsets = UIEdgeInsets(
            top: .zero,
            left: roundEdgeInset,
            bottom: roundEdgeInset,
            right: roundEdgeInset)
        return edgeInsets
    }
}

// MARK: UICollectionViewHeader
extension HelpCategoriesViewController {
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: Constants.helpCatCellHeaderReuseID,
            for: indexPath) as? HeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        header.configure()
        return header
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int) -> CGSize {
        let heightHeader = Constants.headerHelpCatHeight
        let widthHeader = self.view.frame.size.width
        let size: CGSize = CGSize(width: widthHeader, height: heightHeader)
        return size
    }
}
