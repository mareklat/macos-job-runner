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
        VStack {
            Text("Job ID: \(viewModel.jobId)")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Button(
                action: {
                    viewModel.onStartClicked()
                },
                label: {
                    Text("Start")
                }
            )
        }
        .frame(width: 600, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
