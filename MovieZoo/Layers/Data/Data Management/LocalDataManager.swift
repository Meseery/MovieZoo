import Foundation

class LocalDataManager<T: Decodable> {
    func loadData(from file:String) -> T? {
        guard
            let filePathURL = Bundle.main.url(forResource: file,
                                              withExtension: "json"),
            let fileContent = try? Data(contentsOf: filePathURL)
            else { return nil }
        return try? JSONDecoder().decode(T.self, from: fileContent)
    }
}


extension LocalDataManager where T == [Movie] {
    func loadData(from file:String) -> [Movie]? {
        guard
            let filePathURL = Bundle.main.url(forResource: file,
                                              withExtension: "json"),
            let fileContent = try? Data(contentsOf: filePathURL),
            let movies = try? JSONDecoder().decode([String: [Movie]].self, from: fileContent).values.first
            else { return nil }
        
        return movies
    }
}
