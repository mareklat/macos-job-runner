//
//  CurrentJobIdSource.swift
//  job-runner
//
//  Created by Marek Latuszek on 04/12/2020.
//

import Foundation
import RxSwift

struct CurrentJobIdSource {
    
    let jobIdFromUrlHandler: JobIdFromUrlHandler
    
    func get() -> Observable<Int> {
        return jobIdFromUrlHandler.loadAndListen()
    }
    
}
