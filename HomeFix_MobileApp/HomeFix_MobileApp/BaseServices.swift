//
//  BaseServices.swift
//  HomeFix_MobileApp
//
//  Created by Gjorche Cekovski on 9/9/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class BaseService {
  
  static var baseURL = "http://homefix.gear.host/api/"
  
  static func GetRequest(
    urlString: String,
    headers: Dictionary<String, String>,
    completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
  ) {
    
    guard let url = URL(string: urlString) else {
      print("Error creating URL")
      return
    }
    
    var urlRequest = URLRequest(url: url)
    for header in headers{
      urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
    }
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)

    let task = session.dataTask(with: urlRequest,completionHandler: completionHandler)
    task.resume()

  }
  
  static func PostRequest(
    urlString: String,
    headers: Dictionary<String, String>,
    bodyDictionary: [String: Any],
    completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
    
    guard let url = URL(string: urlString) else {
      print("Error creating URL")
      return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    
    for header in headers{
      urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
    }
    
    let jsonData: Data
    do {
      jsonData = try JSONSerialization.data(withJSONObject: bodyDictionary, options: JSONSerialization.WritingOptions())
      urlRequest.httpBody = jsonData
    } catch {
      print("Error creating JSON")
      return
    }
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    
    let task = session.dataTask(with: urlRequest,completionHandler: completionHandler)
    task.resume()
    
  }
  
  static func PutRequest(
    urlString: String,
    headers: Dictionary<String, String>,
    bodyObject: Any,
    completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
    
    guard let url = URL(string: urlString) else {
      print("Error creating URL")
      return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "PUT"
    
    for header in headers{
      urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
    }
    
    let jsonData: Data
    do {
      jsonData = try JSONSerialization.data(withJSONObject: bodyObject, options: JSONSerialization.WritingOptions())
      urlRequest.httpBody = jsonData
    } catch {
      print("Error creating JSON")
      return
    }
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    
    let task = session.dataTask(with: urlRequest,completionHandler: completionHandler)
    task.resume()
    
  }
  
  static func DeleteRequest(
    urlString: String,
    headers: Dictionary<String, String>,
    completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
    
    guard let url = URL(string: urlString) else {
      print("Error creating URL")
      return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "DELETE"
    
    for header in headers{
      urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
    }
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    
    let task = session.dataTask(with: urlRequest,completionHandler: completionHandler)
    task.resume()
    
  }

  
}
