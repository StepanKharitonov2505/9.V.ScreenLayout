//
//  EventView.swift
//  task5HelpApp
//
//  Created by Степан Харитонов on 19.02.2023.
//

import UIKit
import SnapKit

final class EventView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView(
            frame: .zero,
            style: .grouped)
        tableView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        return tableView
    }()
    var segmentedView = UIView()
    var segmentedControl = UISegmentedControl()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }

    // MARK: UI
    private func configureUI() {
        styleSegmentedControl()
        addSegmentedView()
        addTableView()
        setupConstraint()
    }

    private func addTableView() {
        self.tableView.backgroundColor = UIColor.eventViewLightGreyColor
        self.tableView.separatorStyle = .none
        self.addSubview(self.tableView)
    }

    private func addSegmentedView() {
        self.segmentedView.backgroundColor = UIColor.white
        self.segmentedView.addSubview(segmentedControl)
        self.addSubview(segmentedView)
    }

    private func styleSegmentedControl() {
        let items = ["Текущие", "Завершенные"]
        self.segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = UIColor.backgroundColorNavigationBar
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white,
                                                 .font: UIFont.systemFont(ofSize: Constants.fontSizeSegmentedControl,
                                                                          weight: .medium)],
                                                for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.backgroundColorNavigationBar,
                                                 .font: UIFont.systemFont(ofSize: Constants.fontSizeSegmentedControl,
                                                                          weight: .medium)],
                                                for: .normal)
    }

    private func setupConstraint() {
        let safeArea = self.safeAreaLayoutGuide
        self.segmentedView.snp.makeConstraints { make in
           make.leading.equalTo(safeArea.snp.leading)
           make.trailing.equalTo(safeArea.snp.trailing)
           make.top.equalTo(safeArea.snp.top)
           make.height.equalTo(safeArea.snp.width).multipliedBy(Constants.relationHeightOfWidthSegmentedView)
       }

        self.segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(segmentedView.snp.top).offset(Constants.offsetTopSegmentedControl)
            make.bottom.equalTo(segmentedView.snp.bottom).offset(Constants.offsetBottomSegmentedControl)
            make.trailing.equalTo(segmentedView.snp.trailing).offset(-Constants.offsetTrailingLeadingSegmentedControl)
            make.leading.equalTo(segmentedView.snp.leading).offset(Constants.offsetTrailingLeadingSegmentedControl)
        }

        self.tableView.snp.makeConstraints { make in
            make.leading.equalTo(safeArea.snp.leading)
            make.trailing.equalTo(safeArea.snp.trailing)
            make.bottom.equalTo(safeArea.snp.bottom)
            make.top.equalTo(self.segmentedView.snp.bottom)
        }

    }
}
