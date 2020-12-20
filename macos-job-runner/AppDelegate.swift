//
//  AppDelegate.swift
//  job-runner
//
//  Created by Marek Latuszek on 04/12/2020.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    
    override init() {
        super.init()
        DI.configure()
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view.
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        
        let handler = DI.container.resolve(JobIdFromUrlHandler.self)!
        handler.set(id: 1111)//TODO
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func application(_ application: NSApplication, open urls: [URL]) {

        if let components = NSURLComponents(url: urls.first!, resolvingAgainstBaseURL: true) {
            let host = components.host!
            let handler = DI.container.resolve(JobIdFromUrlHandler.self)!
            handler.set(id: Int(host)!)
        }
    }


}

