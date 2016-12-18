//
//  ArticlePresenter.swift
//  Article Managements
//
//  Created by Eang Pheara on 12/15/16.
//  Copyright © 2016 Eang Pheara. All rights reserved.
//

import Foundation

class ArticlePresenter: PresenterInterface  {
    //Create object of protocol
    var articleInterface: ArticleViewInterface?
    var articleService: ArticleService?
    
    func loadData(viewInterface: ArticleViewInterface){
        
        print("Atteched View Presenter loaded")
        
        //Set Delegete
        self.articleInterface = viewInterface
        articleService = ArticleService()
        articleService?.presenterInterface = self
        //articleService?.fectData()
        
        
        //Notify to caller
        //articleInterface?.attectView()
        

    }
    //Notify to view
    func responseData(data: [Articles]){
        
        print("Load data to view")
        articleInterface?.loadData(data: data)
        
    }
    func fectData(){
        articleService?.fectData()
    }

}
