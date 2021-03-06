//
//  StoreViewController.swift
//  test
//
//  Created by 노근(hnoh) on 2021/04/10.
//

import UIKit

class StoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let cellData = ["monSNStar", "news"]
    let backButton: UIButton = {
        let backButton = UIButton()
        let image = UIImage(named: "back")
        backButton.setImage(image, for: .normal)
        backButton.addTarget(self, action: #selector(back(sender:)), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()
    var storeView: UITableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        
        self.storeView.dataSource = self
        self.storeView.delegate = self
        self.storeView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.storeView.register(CustomTable.self, forCellReuseIdentifier: "app")
        self.view = view
        self.storeView.rowHeight = 100
        self.view.addSubview(self.storeView)
        self.view.addSubview(self.backButton)
        
        view.backgroundColor = UIColor.lightGray
        self.storeView.backgroundColor = UIColor.lightGray
        self.storeView.alwaysBounceVertical = false
        self.storeView.translatesAutoresizingMaskIntoConstraints = false
        
        self.storeView.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 30).isActive = true
        self.storeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.storeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        self.storeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
        self.backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        self.backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.backButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        self.backButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return cellData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "app", for: indexPath) as! CustomTable
        if indexPath.section == 0 {
            self.storeView.rowHeight = 175
            cell.appImage.image = UIImage(named: "monSNStar_B")
            cell.appLabel.font = UIFont.boldSystemFont(ofSize: 30)
            cell.appLabel.text = "MONSNSTAR"
            cell.appText.font = UIFont.boldSystemFont(ofSize: 20)
            cell.appText.text = "드디어 출시!"
            
            cell.appImage.topAnchor.constraint(equalTo: cell.topAnchor, constant: 20).isActive = true
            cell.appImage.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20).isActive = true
            cell.appImage.widthAnchor.constraint(equalToConstant: 125).isActive = true
            cell.appImage.heightAnchor.constraint(equalToConstant: 125).isActive = true
            
            cell.appLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 20).isActive = true
            cell.appLabel.leadingAnchor.constraint(equalTo: cell.appImage.trailingAnchor, constant: 20).isActive = true
            cell.appLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
            
            cell.appText.topAnchor.constraint(equalTo: cell.appLabel.bottomAnchor, constant: 10).isActive = true
            cell.appText.leadingAnchor.constraint(equalTo: cell.appImage.trailingAnchor, constant: 20).isActive = true
            cell.appText.heightAnchor.constraint(equalTo: cell.appLabel.heightAnchor).isActive = true
            
        } else {
            self.storeView.rowHeight = 100
            cell.appImage.image = UIImage(named: cellData[indexPath.row])
            cell.appLabel.text = cellData[indexPath.row]
            cell.appText.text = cellData[indexPath.row]
            
            cell.appImage.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
            cell.appImage.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 0).isActive = true
            cell.appImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
            cell.appImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
            cell.appImage.layer.cornerRadius = 12
            
            cell.appLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10).isActive = true
            cell.appLabel.leadingAnchor.constraint(equalTo: cell.appImage.trailingAnchor, constant: 10).isActive = true
            cell.appLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
            
            cell.appText.topAnchor.constraint(equalTo: cell.appLabel.bottomAnchor, constant: 10).isActive = true
            cell.appText.leadingAnchor.constraint(equalTo: cell.appImage.trailingAnchor, constant: 10).isActive = true
            cell.appText.heightAnchor.constraint(equalTo: cell.appLabel.heightAnchor).isActive = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc : DownloadViewController = DownloadViewController()
        dvc.modalPresentationStyle = .fullScreen
        dvc.appImage.image = UIImage(named: cellData[indexPath.row])
        dvc.appLabel.text = cellData[indexPath.row]
        present(dvc, animated: true, completion: nil)
    }
    
    @objc func back(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }
}
