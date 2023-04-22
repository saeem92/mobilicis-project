//
//  HomeVC.swift
//  mobilicis
//
//  Created by saeem  on 23/04/23.
//

import UIKit
import CoreServices
import AVFoundation
import CoreTelephony
import SystemConfiguration
import SystemConfiguration.CaptiveNetwork
import CoreGraphics

class InfoViewController: UIViewController {
    
    let modelLabel = UILabel()
    let systemVersionLabel = UILabel()
    let carrierNameLabel = UILabel()
    let freestorageLabel = UILabel()
    let batteryhealthLabel = UILabel()
    let batterylevelLabel = UILabel()
    let cameraapertureLabel = UILabel()
    let processorLabel = UILabel()
    let gpuinformationLabel = UILabel()
  

    override func viewDidLoad() {
        super.viewDidLoad()


        navigationController?.isNavigationBarHidden = false
        let button = UIButton(type: .system)
        button.setTitle("Get Device Info", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        setupLabels()
    }

    @objc func buttonTapped() {
        getDeviceInformation()
    }
  
    func getDeviceInformation() {
        
        let device = UIDevice.current
        let model = device.model
        let systemVersion = device.systemVersion
        let modelName = device.name

        let ctTelephonyInfo = CTTelephonyNetworkInfo()
        let carrier = ctTelephonyInfo.subscriberCellularProvider
        let carrierName = carrier?.carrierName

        let storageInfo = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path)!
        let freeSpace: UInt64
        do {
            let storageAttributes = try FileManager.default.attributesOfFileSystem(forPath: storageInfo)
            if let space = storageAttributes[.systemFreeSize] as? NSNumber {
                freeSpace = space.uint64Value
            } else {
                freeSpace = 0
            }
        } catch {
            freeSpace = 0
        }

        let batteryHealth = device.batteryLevel * 100
        let batteryLevel = device.batteryState

        let cameraInfo = AVCaptureDevice.default(for: .video)
//        let cameraMegaPixel = (cameraInfo?.activeFormat.totalPixels)! / (1024 * 1024)
        let cameraAperture = cameraInfo?.activeFormat.formatDescription
//        let imei = ctTelephonyInfo.mobileEquipmentIdentifier

        let cpuInfo = ""
        let gpuInfo = ""

        print("Model: \(modelName) (\(model))")
        print("iOS Version: \(systemVersion)")
        print("Carrier Name: \(String(describing: carrierName))")
        print("Free Storage: \(freeSpace / (1024 * 1024)) MB")
        print("Battery Health: \(batteryHealth)%")
        print("Battery Level: \(batteryLevel.rawValue)")
//        print("Camera MegaPixel: \(cameraMegaPixel) MP")
        print("Camera Aperture: \(String(describing: cameraAperture))")
        print("Processor: \(cpuInfo)")
        print("GPU Information: \(gpuInfo)")
//        print("IMEI: \(String(describing: imei))")
        
        modelLabel.text = "Model: \(modelName) (\(model))"
        systemVersionLabel.text = "iOS Version: \(systemVersion)"
        carrierNameLabel.text = "Carrier Name: \(String(describing: carrierName))"
        freestorageLabel.text = "Free Storage: \(freeSpace / (1024 * 1024)) MB"
        batteryhealthLabel.text = "Battery Health: \(batteryHealth)%"
        batterylevelLabel.text = "Battery Level: \(batteryLevel.rawValue)"
        cameraapertureLabel.text = "Camera Aperture: \(String(describing: cameraAperture))"
        processorLabel.text = "Processor: \(cpuInfo)"
        gpuinformationLabel.text = "GPU Information: \(gpuInfo)"
    }
    
    func setupLabels() {
        let labels = [
            modelLabel, systemVersionLabel, carrierNameLabel, freestorageLabel, batteryhealthLabel, batterylevelLabel, cameraapertureLabel, processorLabel, gpuinformationLabel
            
        ]

        var previousLabel: UILabel?
        for label in labels {
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)

            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])

            if let previous = previousLabel {
                NSLayoutConstraint.activate([
                    label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 20)
                ])
            } else {
                NSLayoutConstraint.activate([
                    label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
                ])
            }

            previousLabel = label
        }
    }

}


