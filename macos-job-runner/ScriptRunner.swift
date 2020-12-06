//
//  ScriptRunner.swift
//  macos-job-runner
//
//  Created by Marek Latuszek on 06/12/2020.
//

import Foundation

class ScriptRunner {
    
    func run(_ scritpt: String) {
        let task = Process()
            let pipe = Pipe()
            
            task.standardOutput = pipe
            task.arguments = ["-c", scritpt]
            task.launchPath = "/bin/zsh"
            task.launch()
        
//            pipe.fileHandleForReading.waitForDataInBackgroundAndNotify()
        
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            let output = String(data: data, encoding: .utf8)!
            
            print(output)
    }
    
}
