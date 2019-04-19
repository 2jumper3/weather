//
//  VKViewController.swift
//  WeatherApp
//
//  Created by Sergey on 12/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit
import WebKit

class VKViewController: UIViewController, WKNavigationDelegate {
    
    weak var webView: WKWebView?
    

    
    let client_id = "6895964"

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView()
        self.view.addSubview(webView)
        webView.navigationDelegate = self
        self.webView = webView
        
        self.makeRequest()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.webView?.frame = self.view.bounds
    }
    
    func makeRequest () {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: client_id),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "scope", value: "262150"), //65536
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.92"),
            URLQueryItem(name: "state", value: "test"),
            URLQueryItem(name: "revoke", value: "1")
        ]
        
        if let url = urlComponents.url {
            let request = URLRequest(url: url)
            self.webView?.load(request)
            
            // start
        }
        
        
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        if var url = navigationResponse.response.url, url.path == "/blank.html" {
            
            let urlString = url.absoluteString.replacingOccurrences(of: "https://oauth.vk.com/blank.html#", with: "https://oauth.vk.com/blank.html?")
            
            let urlComponents: URLComponents? = URLComponents(string: urlString)
            if let items = urlComponents?.queryItems {
                for item: URLQueryItem in items {
                    print("   \(item.name) = \(item.value)")
                    
                    if item.name == "access_token" {
                        print("TOKEN IS \(item.value)")
                        Session.shared.tokenID = item.value
                    }
                }
            }
//            dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "openVKLogin", sender: nil)

        }
        
        decisionHandler(.allow)
    }
}
