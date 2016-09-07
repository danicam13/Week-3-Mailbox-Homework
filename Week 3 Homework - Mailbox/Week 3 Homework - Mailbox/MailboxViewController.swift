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
    @IBAction func didTapScreen(sender: AnyObject) {
    }
    
    var initialCenter: CGPoint!
    var initialLater: CGPoint!
    var initialDelete: CGPoint!
    var initialArchive: CGPoint!
    var initialFeed: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       rescheduleScreen.alpha = 0
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(320, 1450)
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        }
    
    func didPressSingleMessage(sender: UIPanGestureRecognizer) {
        
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        print("You location is: \(translation)")
        
        if  sender.state == UIGestureRecognizerState.Began {
            rescheduleScreen.alpha = 0
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
            
            
            if singleMessage.center.x < 20 {
                print("i want to be done")
                messageParentView.alpha = 0
                rescheduleScreen.alpha = 1 }
//            
//            if rescheduleScreen.center.x {
//            func didTapScreen(sender: UIGestureRecognizer) {
//                print("done")
//                rescheduleScreen.alpha = 0
//                messageParentView.alpha = 1
//            }
//            }

            
        } else if   sender.state == UIGestureRecognizerState.Ended {
            print("the center is: \(singleMessage.center.x)")
            
            if singleMessage.center.x > 560 {
                messageParentView.alpha = 0
                rescheduleScreen.alpha = 0
                messageFeed.center = CGPoint(x:
                    initialFeed.x, y:
                    initialFeed.y - 88)}
            
//            if singleMessage.center.x < 20 {
//                print("i want to be done")
//                messageParentView.alpha = 0
//                rescheduleScreen.alpha = 1 }
            
            
            func didTapScreen(sender: UIGestureRecognizer)
            {
                rescheduleScreen.alpha = 0
                print("tap")
            }
            
            singleMessage.center = initialCenter
            archiveIcon.center = initialArchive
            deleteIcon.center = initialDelete
            laterIcon.center = initialLater

                }
            }
//
//    @IBAction func didTapScreen(sender: UIGestureRecognizer)
//    {
//        rescheduleScreen.alpha = 0
//        print("tap")
//    }
 
    
        }
