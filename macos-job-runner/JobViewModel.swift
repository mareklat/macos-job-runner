//
//  JobViewModel.swift
//  job-runner
//
//  Created by Marek Latuszek on 04/12/2020.
//

import Foundation
import RxSwift

class JobViewModel: ObservableObject {

    private let disposeBag = DisposeBag()
    
    private let getJobUseCase: GetJobUseCase
    private let runJobUseCase: RunJobUseCase
    
    private var job: Job? = nil
    
    @Published var jobId: String = "-"
    
    init(getJobUseCase: GetJobUseCase, runJobUseCase: RunJobUseCase) {
        self.getJobUseCase = getJobUseCase
        self.runJobUseCase = runJobUseCase
    }
    
    func setup() {
        getJobUseCase.execute()
            .subscribe(onNext: { job in
                self.job = job
                self.jobId = "\(job.id)"
            })
            .disposed(by: disposeBag)

    }
    
    func onStartClicked() {
        if let job = job {
            runJobUseCase.execute(script: job.script)
        }
    }
    
}
