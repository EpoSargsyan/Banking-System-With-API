//
//  QRTransferViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 29.03.24.
//

import UIKit
import GreenBank_ViewModel
import GreenBank_CustomUIComponents
import AVFoundation

final class QRTransferViewController: BaseViewController<TransactionsViewModel> {
    var captureSession = AVCaptureSession()
    var someView = UIView()
    
    var qrTransferView = QRTransfersView()
    public var previewView = VideoPreviewView()
    
    private lazy var backCameraInput: AVCaptureDeviceInput? = {
        var defaultVideoDevice: AVCaptureDevice?
        // Choose the back dual camera, if available, otherwise default to a wide angle camera.
        if let dualCameraDevice = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) {
            defaultVideoDevice = dualCameraDevice
        } else if let dualWideCameraDevice = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back) {
            // If a rear dual camera is not available, default to the rear dual wide camera.
            defaultVideoDevice = dualWideCameraDevice
        } else if let backCameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            // If a rear dual wide camera is not available, default to the rear wide angle camera.
            defaultVideoDevice = backCameraDevice
        }
        
        guard let camera = defaultVideoDevice else { return nil }
        let input = try? AVCaptureDeviceInput(device: camera)
        
        return input
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        makeAnimations()
        makeQRvisible()
    }
    
    func setupUI() {
        qrTransferView.setupUI()
        view.backgroundColor = AppColor.cremeWhite.uiColor
        qrTransferView.frame = view.bounds
        view.addSubview(qrTransferView)
        navigationItem.hidesBackButton = true
    }
    
    func makeAnimations() {
        let backButtonAction = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
            self.tabBarController?.tabBar.isHidden = false
        }
        
        qrTransferView.backButton.addAction(backButtonAction, for: .touchUpInside)
    }
    
    func makeQRvisible() {
        captureSession.addInput(backCameraInput!)
        
        let captureMetaDataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(captureMetaDataOutput)
        
        captureMetaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetaDataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        previewView.session = captureSession
        previewView.videoPreviewLayer.videoGravity = .resizeAspectFill
        previewView.frame = qrTransferView.cameraView.bounds
        previewView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        previewView.clipsToBounds = true
        qrTransferView.cameraView.insertSubview(previewView, at: 0)
        
        DispatchQueue.global(qos: .background).async {
            self.captureSession.startRunning()
        }
    }
}

extension QRTransferViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 {
            
        }
        
        let metaDataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metaDataObj.type == AVMetadataObject.ObjectType.qr {
            let barCodeObject = previewView.videoPreviewLayer.transformedMetadataObject(for: metaDataObj)
            
            self.qrTransferView.cameraView.frame = barCodeObject!.bounds
            
            if metaDataObj.stringValue != nil {
                
            }
        }
    }
}
