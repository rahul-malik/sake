import Foundation

// MARK: - Git

public final class Git {
    
    // MARK: - Attributes
    
    let shell: Shelling
    
    // MARK: - Init
    
    init(shell: Shelling) {
        self.shell = shell
    }
    
    
    public func branch() throws -> String {
        try verifyGitDirectory()
        return ""
    }
    
    public func anyChanges() throws -> Bool {
        try verifyGitDirectory()
        return false
    }
    
    public func commitAll(message: String) throws  {
        try verifyGitDirectory()
        shell.run(command: "git add .")
        shell.run(command: "git commit -m \(message)")
    }
    
    public func addRemote(_ remote: String, url: String) throws {
        try verifyGitDirectory()
        shell.run(command: "git remote add \(remote) \(url)")
    }
    
    public func removeRemote(_ remote: String) throws {
        try verifyGitDirectory()
        shell.run(command: "git remote remove \(remote)")
    }
    
    // MARK: - Fileprivate
    
    fileprivate func verifyGitDirectory() throws {
        let currentDirecory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let gitDirectory = currentDirecory.appendingPathComponent(".git")
        if !FileManager.default.fileExists(atPath: gitDirectory.path) {
            throw "The current directory is not a git directory"
        }
    }
}
