//
//  GetJobUseCase.swift
//  job-runner
//
//  Created by Marek Latuszek on 04/12/2020.
//

import Foundation
import RxSwift

struct GetJobUseCase {
    
    let currentJobIdSource: CurrentJobIdSource
    let jobSource: JobSource
    
    func execute() -> Observable<Job> {
        return currentJobIdSource.get()
            .flatMap { id in jobSource.getById(jobId: id)}
    }
    
}
