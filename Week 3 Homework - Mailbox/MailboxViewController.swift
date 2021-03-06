//
//  MailboxViewController.swift
//  Week 3 Homework - Mailbox
//
//  Created by Camous, Dani on 9/1/16.
//  Copyright © 2016 Dani Camous. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageParentView: UIView!
    @IBOutlet weak var singleMessage: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var rescheduleScreen: UIImageView!
    @IBOutlet weak var messageFeed: UIImageView!
    
    var initialCenter: CGPoint!
    var initialLater: CGPoint!
    var initialDelete: CGPoint!
    var initialArchive: CGPoint!
    var initialFeed: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(320, 1500)
        
//         var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(MailboxViewController.onCustomPan(_:)))
        

        // Do any additional setup after loading the view.
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    
    @IBAction func didPressMessageView(sender: UIPanGestureRecognizer) {
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
    
        } else if sender.state == UIGestureRecognizerState.Changed {
                
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
        }
        
    }
    
    
    func didPressSingleMessage(sender: UIPanGestureRecognizer) {
        
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        print("You location is: \(translation)")
        
        if  sender.state == UIGestureRecognizerState.Began {
            initialCenter = singleMessage.center
            initialArchive = archiveIcon.center
            initialLater = laterIcon.center
            initialDelete = deleteIcon.center
            initialFeed = messageFeed.center
            messageParentView.backgroundColor = UIColor.grayColor()
            
        } else if   sender.state == UIGestureRecognizerState.Changed {
            singleMessage.center = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y)
            archiveIcon.center = CGPoint(x: initialArchive.x + translation.x - 30, y: initialCenter.y)
            laterIcon.center = CGPoint(x: initialLater.x + translation.x + 10, y: initialLater.y)
            deleteIcon.center = CGPoint(x: initialDelete.x + translation.x - 10, y: initialCenter.y)
            deleteIcon.alpha = 0
            
                if translation.x > 60 {
                messageParentView.backgroundColor = UIColor.greenColor()
                archiveIcon.alpha = 1
                deleteIcon.alpha = 0
                laterIcon.alpha = 0
            }
            
                if translation.x > 260 {
                messageParentView.backgroundColor = UIColor.redColor()
                archiveIcon.alpha = 0
                deleteIcon.alpha = 1
                laterIcon.alpha = 0
            }
            
            if translation.x < -60 {
                messageParentView.backgroundColor = UIColor.yellowColor()
                archiveIcon.alpha = 0
                deleteIcon.alpha = 0
                laterIcon.alpha = 1
            }
            
            
            if translation.x < -260 {
                messageParentView.backgroundColor = UIColor.brownColor()
                archiveIcon.alpha = 0
                deleteIcon.alpha = 0
                laterIcon.alpha = 1
                print("hi")
            }
            
        } else if   sender.state == UIGestureRecognizerState.Ended {
            if singleMessage.center.x > 270 {
                messageParentView.alpha = 0
                rescheduleScreen.alpha = 0
                messageFeed.center = CGPoint(x:
                    initialFeed.x, y:
                    initialFeed.y - 88)}
            
            else if singleMessage.center.x < -260 {
                messageParentView.alpha = 0
                rescheduleScreen.alpha = 1
                print("i want to be done")
                
            singleMessage.center = initialCenter
            archiveIcon.center = initialArchive
            print("yes")
            deleteIcon.center = initialDelete
            laterIcon.center = initialLater
                
            
                    
                }
            }
            
        }
        
        }

    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
            return UIColor(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
//
//    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
////        var point = panGestureRecognizer.locationInView(view)
////        var translation = panGestureRecognizer.translationInView(view)
////        var velocity = panGestureRecognizer.velocityInView(view)
////        
////        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
////            
////        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
////            If translation.x > 60 {singleMessage.backgroundColor = UIColor.greencolor}
////            
////           
////        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
////            
////        }
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
