//
//  ArticleViewModel.swift
//  MVVMNewsApp
//
//  Created by Diler Barbosa on 08/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleListViewModel {
    let articlesViewModel: [ArticleViewModel]
}

extension ArticleListViewModel {
    
    init(_ articles: [Article]) {
        self.articlesViewModel = articles.compactMap(ArticleViewModel.init)
    }
    
}

extension ArticleListViewModel {
    
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.articlesViewModel[index]
    }
    
}

struct ArticleViewModel {
    let article: Article
    init(_ article: Article) {
        self.article = article
    }
}


extension ArticleViewModel {
    
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
    
}

