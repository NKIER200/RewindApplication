import _AVKit_SwiftUI
////
////  contentzView.swift
////  Kier_Nathan_Rewind
////
////  Created by Nathan Kier on 12/12/2022.
////
//import SwiftUI
//import UIKit
//import AVFoundation
//import Photos
//import AVKit
//
//struct contentzView: View {
//    @State private var videoURL: URL?
//    @State private var caption: String = ""
//
//    var body: some View {
//        VStack {
//            // Display the selected video.
//            if let url = videoURL {
//                VideoPlayer(player: url)
//            }
//
//            // Allow the user to select a video from their camera roll.
//            Button("Choose Video") {
//                // Show the system image picker to let the user select a video.
//                let picker = UIImagePickerController()
//                picker.mediaTypes = ["public.movie"]
//                picker.delegate = self
//                UIApplication.shared.windows.first?.rootViewController?.present(picker, animated: true)
//            }
//
//            // Allow the user to enter a caption for the video.
//            TextField("Caption", text: $caption)
//
//            // Add a button to save the video with the caption.
//            Button("Save Video") {
//                // Save the video to the user's camera roll.
//            }
//        }
//    }
//}
//
//// Make the ContentView conform to the UIImagePickerControllerDelegate protocol.
//extension contentzView: UIImagePickerControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        // Get the selected video URL from the info dictionary.
//        if let url = info[.mediaURL] as? URL {
//            // Set the selected video URL on the ContentView.
//            videoURL = url
//        }
//
//        // Dismiss the image picker.
//        picker.dismiss(animated: true)
//    }
//}
//
//// Make the ContentView conform to the UINavigationControllerDelegate protocol.
//extension contentzView: UINavigationControllerDelegate {
//
//}
//
//struct contentzView_Previews: PreviewProvider {
//    static var previews: some View {
//        contentzView()
//    }
//}
