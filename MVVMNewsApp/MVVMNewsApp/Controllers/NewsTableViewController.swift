//
//  NewsTableViewController.swift
//  MVVMNewsApp
//
//  Created by Diler Barbosa on 08/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    private var articleList: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleList == nil ? 0 : self.articleList.articlesViewModel.count
    }
    
    private func populateNews() {
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=br&apiKey=7bf1e65c8db64d23a108cffc6d1a0801")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { response in
                let articles = response.articles
                self.articleList = ArticleListViewModel(articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }).disposed(by: disposeBag)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("Não achei a celula")
        }
        
        let articleViewModel = self.articleList.articleAt(indexPath.row)
        
        articleViewModel.title.asDriver(onErrorJustReturn: "")
            .drive(cell.titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleViewModel.description.asDriver(onErrorJustReturn: "")
            .drive(cell.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        return cell
        
    }
    
    
}
