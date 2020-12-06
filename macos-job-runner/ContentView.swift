//
//  ContentView.swift
//  job-runner
//
//  Created by Marek Latuszek on 04/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = DI.container.resolve(JobViewModel.self)!
    
    var body: some View {
        Text("Hello, World! \(viewModel.jobId)")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                viewModel.setup()
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
