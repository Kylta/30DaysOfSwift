//
//  CameraViewController.swift
//  Project 04 - SnapChatMenu
//
//  Created by Christophe Bugnon on 01/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit
import AVKit

class CameraViewController: UIViewController {
    
    let chatButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "chat-recieved"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let storyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "card"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let circleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "circle").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        
        view.backgroundColor = .yellow
        
        setupNavigationBar()
        setupNavBarButton()
        
        view.addSubview(chatButton)
        chatButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        chatButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        chatButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        chatButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(storyButton)
        storyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        storyButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        storyButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        storyButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(circleButton)
        circleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        circleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        storyButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        circleButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    func setupNavBarButton() {
        
        let friendsBarButton = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(handleText))
        friendsBarButton.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Helvetica", size: 24)!], for: .normal)
        friendsBarButton.tintColor = .black
        
        let glassBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-search").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleGlass))
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(image: #imageLiteral(resourceName: "baby").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleBitmoji)), glassBarButton, friendsBarButton]
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: #imageLiteral(resourceName: "camera-1").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleCamera)), UIBarButtonItem(image: #imageLiteral(resourceName: "lightning").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleLightning)), UIBarButtonItem(image: #imageLiteral(resourceName: "moon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMoon))]
    }
    
    
    @objc func handleCamera() {
        print("Camera Handle")
    }
    
    @objc func handleLightning() {
        print("Lightning Pressed")
    }
    
    @objc func handleMoon() {
        print("Moon Pressed")
    }
    
    @objc func handleText() {
        print("Seach Pressed")
    }
    
    @objc func handleGlass() {
        print("Glass Pressed")
    }
    
    @objc func handleBitmoji() {
        print("Bitmoji Pressed")
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        //  navigationController?.navigationBar.barTintColor = .lightGray
        
    }
    
    func setupCamera() {
        let captureSession = AVCaptureSession()
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
    }
    
}
