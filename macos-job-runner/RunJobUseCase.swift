//
//  RunScriptUseCase.swift
//  macos-job-runner
//
//  Created by Marek Latuszek on 06/12/2020.
//

import Foundation

struct RunJobUseCase {
    
    let scriptRunner: ScriptRunner
    
    func execute(script: String) {
        scriptRunner.run(script)
    }
    
}
