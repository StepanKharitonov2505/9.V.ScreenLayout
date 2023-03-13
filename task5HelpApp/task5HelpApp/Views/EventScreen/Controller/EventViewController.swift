//
//  EventViewController.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 19.02.2023.
//

import UIKit

final class EventViewController: UIViewController {

    // MARK: Properties
    private var setData: [Event] = []
    private var viewModel: EventViewModel
    private let eventsView = EventView()

    // MARK: LifeCycle
    init(viewModel: EventViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.view = eventsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.bindViewModel()

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.backgroundColorNavigationBar
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.compactAppearance = appearance

        let labelTitle: UILabel = UILabel()
        labelTitle.text = "Дети"
        labelTitle.textColor = UIColor.white
        labelTitle.font = UIFont(name: "OfficinaSansExtraBoldSCC", size: 21)!
        labelTitle.heightAnchor.constraint(equalToConstant: Constants.headerHelpCatHeight).isActive = true
        self.navigationItem.titleView = labelTitle

        let backButtonItem = UIBarButtonItem(
            image: UIImage(named: Constants.helpCatBackImageName),
            style: .plain,
            target: nil,
            action: #selector(self.navigationController?.popViewController(animated:)))
        backButtonItem.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backButtonItem

        let filterButtonItem = UIBarButtonItem(
            image: UIImage(named: Constants.filterButtonImageName),
            style: .plain,
            target: nil,
            action: nil)
        filterButtonItem.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = filterButtonItem
    }

    // MARK: Private func
    private func setupTableView() {
        self.eventsView.tableView.register(EventCell.self,
            forCellReuseIdentifier: Constants.reuseIDEventCell)
        self.eventsView.tableView.dataSource = self
        self.eventsView.tableView.delegate = self
    }
    private func bindViewModel() {
        let queue = DispatchQueue.global(qos: .background)
        queue.async {
            self.setData = self.viewModel.data
            DispatchQueue.main.async {
                self.eventsView.tableView.reloadData()
            }
        }
    }
}

// MARK: TableView Data Source
extension EventViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        guard let selectTypeEvents = setData.first else {
            return 0
        }
        return selectTypeEvents.futureEvents.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let disclosureArray = setData.first else {
            return UITableViewCell()
        }
        let item = disclosureArray.futureEvents[indexPath.section]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.reuseIDEventCell,
            for: indexPath) as? EventCell else {
            return UITableViewCell()
        }
        cell.layoutIfNeeded()
        cell.config(
            imageName: item.imageName,
            mainTitle: item.name,
            description: item.description,
            dateStart: item.startDate,
            dateFinish: item.finishDate)
        cell.applyGradientPattern()
        return cell
    }
}

// MARK: TableView Delegate
extension EventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.view.frame.width*Constants.relationHeightOfWidthEventCell
        return height
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.stumbleBetweenSections
    }
}
