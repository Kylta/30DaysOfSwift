//
//  ViewController.swift
//  Project 09 - ImageScroller
//
//  Created by Christophe Bugnon on 07/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: #imageLiteral(resourceName: "yuriy-garnaev-395879-unsplash"))
        
        setupScrollView()
        
        scrollView.delegate = self
        
        setZoomForScale(scrollViewSize: scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomForScale(scrollViewSize: scrollView.bounds.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        
        recenterImage()
    }
    
    // MARK: - Set up scroll view
    
    private func setupScrollView() {
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = .black
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    private func setZoomForScale(scrollViewSize: CGSize) {
        let imageSize = imageView.bounds.size
        
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        
        let minimumScale = min(widthScale, heightScale)
        
        // set up zooming properties for the scroll view
        scrollView.minimumZoomScale = minimumScale
        scrollView.maximumZoomScale = 3.0
    }
    
    private func recenterImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2.0 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: verticalSpace, left: horizontalSpace, bottom: verticalSpace, right: horizontalSpace)
    }
    
}

extension ViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.recenterImage()
    }
}

