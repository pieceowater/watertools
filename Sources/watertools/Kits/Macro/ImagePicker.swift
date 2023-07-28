//
//  ImagePicker.swift
//  
//
//  Created by yury mid on 28.07.2023.
//

import SwiftUI
import UIKit
import AVFoundation
import Photos
import MobileCoreServices

struct ImagePicker: UIViewControllerRepresentable {
    @Binding public var selectedImage: UIImage?
    @Binding public var isImagePickerPresented: Bool
    public var sourceType: UIImagePickerController.SourceType = .camera

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = sourceType // .camera / photoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]

        // Check camera permission
        checkCameraPermission { granted in
            if granted {
                // Permission granted, present the image picker
                DispatchQueue.main.async {
                    isImagePickerPresented = true
                }
            } else {
                // Permission denied, show an alert or take appropriate action
                print("Camera permission denied.")
            }
        }

        return imagePicker
    }

    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    public class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        public var parent: ImagePicker

        public init(_ parent: ImagePicker) {
            self.parent = parent
        }

        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                withAnimation {
                    parent.selectedImage = image
                }
            }
            picker.dismiss(animated: true, completion: nil)
        }

        public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }

    // Check camera permission
    public func checkCameraPermission(completion: @escaping (Bool) -> Void) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            completion(true)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                completion(granted)
            }
        case .denied, .restricted:
            completion(false)
        @unknown default:
            completion(false)
        }
    }
}
