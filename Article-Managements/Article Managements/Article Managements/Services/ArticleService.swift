//
//  ArticleService.swift
//  Article Managements
//
//  Created by Eang Pheara on 12/14/16.
//  Copyright © 2016 Eang Pheara. All rights reserved.
//

import Foundation

class ArticleService{
    
    var data = [Articles]()
    var presenterInterface: PresenterInterface?
    var addNewArticlePresenterInterface: AddNewArticlePerseterInterface?

    func  fectData() {
        let url = URL(string: DataManager.Url.ARTICLE)
        var request = URLRequest(url: url!)
        request.setValue("\(DataManager.Url.header)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request){
            data,response, error in
            if error != nil {
                print("Error")
            }else{
                
                let httpStatus = response as? HTTPURLResponse
                if httpStatus!.statusCode == 200{
                    
                    if let urlContent = data{
                        do{
                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: .allowFragments) as! [String:Any]
                            let jsonData = jsonResult["DATA"] as! [AnyObject]
                            
                            for responseData in jsonData{
                                self.data.append(Articles(JSON: responseData as! [String:Any])!)
                            }
                            
                            //Notify to presenter
                            
                            self.presenterInterface?.responseData(data: self.data)
                        }catch {
                            print("error")
                        }
                    }
                }else{
                    print("error httpStatuse code is ", httpStatus?.statusCode)
                }
                
            }
        }
        
        task.resume()
    }
    
    
    //Post data to server
    
    func postData(title: String, description: String, image: String){
        let url = URL(string: "\(DataManager.Url.ARTICLE)")
        var request = URLRequest(url: url!)
        request.setValue("\(DataManager.Url.header)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.setValue("\(DataManager.Url.contentType)", forHTTPHeaderField: "Content-Type")
        request.setValue("\(DataManager.Url.contentType)", forHTTPHeaderField: "Accept")
        
        
        let dictionary  = ["TITLE": title , "DESCRIPTION": description, "IMAGE": image]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            
            
        }catch {
            print(error.localizedDescription)
        }
        let postTask = URLSession.shared.dataTask(with: request) {
            (data, response,error) in
            if error != nil {
                print("error")
            }else{
                if let urlContent = data {
                    if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode  != 200{
                            print("response =\(response)")
                    }
                    
                    let responseString = String(data: urlContent, encoding: .utf8)
                    print("Reesponse String =\(responseString)")
                }
            }
        }
        postTask.resume()
    }
   

    
}
