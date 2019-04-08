//
//  Article.swift
//  MVVMNewsApp
//
//  Created by Diler Barbosa on 08/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}


struct Article: Decodable {
    let title: String
    let description: String?
}
