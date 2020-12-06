//
//  DI.swift
//  job-runner
//
//  Created by Marek Latuszek on 04/12/2020.
//

import Foundation
import Swinject

class DI {
    
    static let container = Container()
    
    static func configure() {
        container.register(JobIdFromUrlHandler.self) { _ in JobIdFromUrlHandler() }
            .inObjectScope(.container)
        
        container.register(CurrentJobIdSource.self) { r in
            CurrentJobIdSource(jobIdFromUrlHandler: r.resolve(JobIdFromUrlHandler.self)!)
        }
        
        container.register(JobSource.self) { _ in JobSource() }
        
        container.register(ScriptRunner.self) { _ in ScriptRunner() }

        container.register(GetJobUseCase.self) { r in
            GetJobUseCase(currentJobIdSource: r.resolve(CurrentJobIdSource.self)!, jobSource: r.resolve(JobSource.self)!)
        }
        
        container.register(RunJobUseCase.self) { r in
            RunJobUseCase(scriptRunner: r.resolve(ScriptRunner.self)!)
        }
        
        
        container.register(JobViewModel.self) { r in
            JobViewModel(getJobUseCase: r.resolve(GetJobUseCase.self)!, runJobUseCase: r.resolve(RunJobUseCase.self)!)
        }
        
    }
    
}
