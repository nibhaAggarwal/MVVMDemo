//
//  ScrollViewController.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 06/11/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView?
    @IBOutlet weak var pageCtrl: UIPageControl?
    var slides: [PageView] = []
    var objScrollViewModel: ScrollViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollview?.delegate = self
        objScrollViewModel = ScrollViewModel(ref: self, callBack: {
            
        })
        slides = objScrollViewModel!.createSlides()
        objScrollViewModel!.setupSlidescrollview(slides: slides)
        
        pageCtrl?.numberOfPages = slides.count
        pageCtrl?.currentPage = 0
        self.view.bringSubviewToFront(pageCtrl!)
    }
}


extension ScrollViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageCtrl!.currentPage = Int(pageIndex)
            
            let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
            let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
            
            // vertical
            let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
            let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
            
            let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
            let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
            
            
            /*
             * below code changes the background color of view on paging the scrollview
             */
    //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
            
        
            /*
             * below code scales the imageview on paging the scrollview
             */
            let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
            
            if(percentOffset.x > 0 && percentOffset.x <= 0.25) {

                slides[0].viewObject?.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
                slides[1].viewObject?.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)

            } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
                slides[1].viewObject?.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
                slides[2].viewObject?.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)

            } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
                slides[2].viewObject?.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
                slides[3].viewObject?.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)

            } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
                slides[3].viewObject?.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
                slides[4].viewObject?.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
            }
        }
}
