//
//  JobSource.swift
//  job-runner
//
//  Created by Marek Latuszek on 04/12/2020.
//

import Foundation
import RxSwift

class JobSource {
    
    func getById(jobId: Int) -> Observable<Job>  {
        return Observable.just(Job(
            id: jobId,
            script: "ls && touch test && ls",
            artifacts: [],
            created: Date(),
            status: .pending,
            generatedArtifacts: []
        ))
    }
    
}
