//
//  ViewController.swift
//  NSBlockOperation
//
//  Created by Jalloh on 09/07/2016.
//  Copyright © 2016 CodeWithJalloh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var googlewebs:NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let queue = NSOperationQueue()
        let operationOne: NSBlockOperation = NSBlockOperation(block: {self.getWebs()
            
            let operationTwo: NSBlockOperation = NSBlockOperation(block: {
            self.loadWebs()
                
            })
            queue.addOperation(operationTwo)
        })
        queue.addOperation(operationOne)
        
    }
    
    
    
    func loadWebs() {
        let urls: NSMutableArray = NSMutableArray (objects:NSURL(string:"http://www.google.es")!, NSURL(string: "http://www.apple.com")!,NSURL(string: "http://carlosbutron.es")!, NSURL(string: "http://www.bing.com")!,NSURL(string: "http://www.yahoo.com")!)
        urls.addObjectsFromArray(googlewebs as [AnyObject])
        
        for iterator: AnyObject in urls {
            print("Downloaded \(iterator)")
        }
        
    }
    
    
    func getWebs() {
        let languages:NSArray = ["com", "ad", "ae", "com.af", "com.ag", "com.ai", "am", "co.uk", "as", "at"]
        let languageWebs = NSMutableArray()
        for(var i=0;i < languages.count; i++) {
            let webStr: NSString = "https://www.google.\(languages[i])"
            languageWebs.addObject(NSURL(fileURLWithPath: webStr as String))
        }
        googlewebs = languageWebs
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

