//
//  InstagramViewController.swift
//  Lista
//
//  Created by Felipe Mannarino on 30/04/2018.
//  Copyright © 2018 Felipe Mannarino. All rights reserved.
//

import UIKit

class InstagramViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        loginRequest()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginRequest() {
        let url = "\(Constants.AUTHURL)?client_id=\(Constants.CLIENTID)&redirect_uri=\(Constants.REDIRECTURL)&response_type=token&scope=\(Constants.SCOPE)&DEBUG=True"
        let request = URLRequest.init(url: URL.init(string: url)!)
        webView.loadRequest(request)
    }
    func checkRequestForCallBack(request: URLRequest) -> Bool {
        let UrlString = (request.url?.absoluteString)! as String
        
        if UrlString.hasPrefix(Constants.REDIRECTURL) {
            let range: Range<String.Index> = UrlString.range(of: "#access_token=")!
            getAccessToken(authToken: UrlString.substring(from: range.upperBound))
            return false
        }
        return true
    }
    
    func getAccessToken(authToken: String) {
        self.navigationController?.popViewController(animated: true)
        let url = "\(Constants.APIURL)self/?access_token=\(authToken)"
        var request: URLRequest = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringCacheData
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) { (data, response, error) -> Void in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                print(json)
                let strFullName = (json?.value(forKey: "data") as AnyObject).value(forKey: "full_name") as? String
                
                let alert = UIAlertController(title: "FULL NAME", message: strFullName, preferredStyle: .alert)
                let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: "Ok action"), style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }.resume()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return checkRequestForCallBack(request: request)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
