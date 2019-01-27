//
//  ViewController.swift
//  basketBall
//
//  Created by Silje Marie Flaaten on 29/09/2018.
//  Copyright © 2018 Silje Marie Flaaten. All rights reserved.
//

import ARKit
import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    // 1: Konstanter og Variabler
    
    // 2: Konstruktør og funksjoner
    
    let launchButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Launch", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.addTarget(self, action: #selector(handleLaunch), for: .touchUpInside)
        
        return butt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //setupLayout()
        view.backgroundColor = .white

        view.addSubview(launchButton)
        launchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        launchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36).isActive = true
        
    }

    
    func setupLayout() {
        print("Hello, I am a Layout!")
        
        //0: Lage viewen som vi vil legge til.
        let button = UIButton(type: .system)
        button.setTitle("Launch", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLaunch), for: .touchUpInside)
        
        //1: Legge til den nye viewen
        view.addSubview(button)
        
        //2: Fortelle hvor på skjermen den skal være.
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36).isActive = true
        
    }
    
    // planeDetection finner flate overflater i the camera-captured image
    // var planeDetection: ARWorldTrackingConfiguration.PlaneDetection { get set }
    
    // Starts AR processing for the session with the specified configuration and options
    func run(configuration: ARConfiguration, options: ARSession.RunOptions = []) {
        
    }
    
    
    @objc func handleLaunch() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            print("User has accepted camera: \(granted)")
        }
        print("Hello, I was pressed!")
        
        let captureSession = AVCaptureSession()

        // Setup inputs
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .unspecified) else { return }
        
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else { return }
        guard captureSession.canAddInput(videoDeviceInput) else { return }
        captureSession.addInput(videoDeviceInput)
        

        // Setup outputs
        let output = AVCapturePhotoOutput()
        if captureSession.canAddOutput(output) {
            captureSession.addOutput(output)
        }
        
        
        
        // Setup output preview.
        // Obs, får ikke til fullscreen på ipad
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)

        previewLayer.frame = view.frame
        
        captureSession.startRunning()
        
        
        
        // registrere en tap gesture som trigger et AR kall
        
        
        
        
    }


}

