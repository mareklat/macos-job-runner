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
    
    let getJobUseCase: GetJobUseCase
    
    @Published var jobId: String = "-"
    
    init(getJobUseCase: GetJobUseCase) {
        self.getJobUseCase = getJobUseCase
    }
    
    func setup() {
        getJobUseCase.execute()
            .subscribe(onNext: { job in
                self.jobId = "\(job.id)"
            })
            .disposed(by: disposeBag)

    }
    
}
