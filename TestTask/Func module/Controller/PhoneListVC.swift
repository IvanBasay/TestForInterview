//
//  ViewController.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import UIKit

class PhoneListVC: UIViewController {

    @IBOutlet private weak var phoneTableView: UITableView!
    
    lazy var refreshControl: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
        refreshControl.transform = CGAffineTransform(scaleX: 0.87, y: 0.87)
        return refreshControl
    }()
    
    private var contacts: [ContactModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadXib()
        configTableView()
        setupRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func loadData() {
        if !UDKey.localStorageFill {
            NetworkManager.shared.getContactList(count: 20) { [weak self] (contactsResult) in
                self?.contacts = contactsResult
                self?.phoneTableView.reloadData()
                self?.refreshControl.perform(#selector(UIRefreshControl.endRefreshing), with: nil, afterDelay: 0)

                DispatchQueue.global(qos: .background).async {
                    for contact in self?.contacts ?? [] {
                        PersistanceManager.shared.saveContact(contact)
                    }
                    UDKey.localStorageFill = true
                }
            }
        } else {
            refreshControl.perform(#selector(UIRefreshControl.endRefreshing), with: nil, afterDelay: 0)
            contacts = PersistanceManager.shared.fetchAllContacts()
            phoneTableView.reloadData()
        }
    }
    
    private func configTableView() {
        phoneTableView.dataSource = self
        phoneTableView.delegate = self
        phoneTableView.rowHeight = 80
    }

    private func loadXib() {
        phoneTableView.register(UINib(nibName: "ContactTVCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
    }
    
    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        phoneTableView.refreshControl = refreshControl
    }
    
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        loadData()
    }

}

extension PhoneListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContactTVCell else { return UITableViewCell() }
        cell.setContact(contacts[indexPath.row], sourceType: contacts[indexPath.row].sourceType)
        return cell
    }

}

extension PhoneListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        
        let sb = UIStoryboard(name: "FuncUI", bundle: Bundle.main)
        if let vc = sb.instantiateViewController(withIdentifier: "ContactDetailVC") as? ContactDetailVC {
            vc.contact = contact
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
