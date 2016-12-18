//
//  AddNewArticleInterface.swift
//  Article Managements
//
//  Created by Eang Pheara on 12/18/16.
//  Copyright © 2016 Eang Pheara. All rights reserved.
//

import Foundation
protocol AddNewArticleInterface {
    func postData(title: String, description: String, image: String)
    func uploadImage(image: Data)
    func reloadTable()
    func returnImageUrl(imageURL: String)
}
