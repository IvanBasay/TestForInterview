//
//  DashboardVC.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import UIKit

class DashboardVC: UIViewController {

    @IBOutlet weak var dashboardLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = 40
        loadXib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        dashboardLabel.isUserInteractionEnabled = true
        dashboardLabel.addGestureRecognizer(tap)
        view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.184, alpha: 1)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width * 0.85, height: collectionView.frame.height)
        layout.sideItemScale = 0.9
        layout.spacingMode = .fixed(spacing: 17)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    
    @objc func backTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    private func loadXib() {
        collectionView.register(UINib(nibName: "DashboardCVCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "SaleResultTVCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
    }
    

}

extension DashboardVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension DashboardVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SaleResultTVCell {
            cell.setRandomData()
            
            if indexPath.row == 4 {
                cell.lineView.isHidden = true
            } else {
                cell.lineView.isHidden = false
            }
            return cell
        }
        return UITableViewCell()
    }
}
