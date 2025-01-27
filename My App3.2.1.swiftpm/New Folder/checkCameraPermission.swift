import SwiftUI
import AVFoundation

func checkCameraPermission() {
    print("on")
    let cameraStatus = AVCaptureDevice.authorizationStatus(for: .video)
    
    switch cameraStatus {
    case .notDetermined:
        // The user has not yet been asked for permission
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted {
                print("Camera access granted")
            } else {
                print("Camera access denied")
            }
        }
    case .restricted, .denied:
        // The user has denied or restricted camera access
        print("Camera access is restricted or denied")
    case .authorized:
        // The user has already granted permission
        print("Camera access is already authorized")
    @unknown default:
        print("Unknown camera permission status")
    }
}
