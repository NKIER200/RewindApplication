//
//  ErrorView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 20/06/2022.
//

import SwiftUI

struct ErrorView: View {
    let errorwrapper: errorWrapper
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationView{
            VStack {
                Text("An error has occured within the application!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorwrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorwrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    
    enum SampleError: Error{
        case errorRequired
    }
    
    static var wrapper: errorWrapper {
        errorWrapper(error: SampleError.errorRequired,
                     guidance: "You can ignore this.")
    }
    static var previews: some View {
        ErrorView(errorwrapper: wrapper)
    }
}
