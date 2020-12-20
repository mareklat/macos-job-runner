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
            task.arguments = ["-c", "pwd && echo '#!/bin/bash \n \(scritpt)' > script.sh && chmod +x script.sh", "sh ./script.sh"]
            task.launchPath = "/bin/bash"
            task.launch()
        
//            pipe.fileHandleForReading.waitForDataInBackgroundAndNotify()
        
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            let output = String(data: data, encoding: .utf8)!
            
            print(output)
    }
    
}
