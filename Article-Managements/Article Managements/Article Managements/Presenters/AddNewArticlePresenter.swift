//
//  AddNewArticlePresenter.swift
//  Article Managements
//
//  Created by Eang Pheara on 12/18/16.
//  Copyright © 2016 Eang Pheara. All rights reserved.
//

import Foundation
class AddNewArticlePresenter: AddNewArticlePerseterInterface {
    
    var addNewArticleInterface: AddNewArticleInterface?
    var articleService: ArticleService?
    
    func postData(title: String, description: String, image: String){
        addNewArticleInterface?.postData(title: title, description: description, image: image)
    }
    
    func uploadImage(image: Data){
        articleService?.addNewArticlePresenterInterface = self
        
    }
    func resopnseData(imageURL: String) {
        addNewArticleInterface?.returnImageUrl(imageURL: imageURL)
    }
}
