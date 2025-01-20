import Foundation

func fetchJSON<T: Decodable>(from url: String, as type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
    guard let url = URL(string: url) else {
        completion(.failure(URLError(.badURL)))
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, _, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        guard let data = data else {
            completion(.failure(URLError(.badServerResponse)))
            return
        }
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}

// Usage:
struct Post: Decodable {
    let id: Int
    let title: String
}

fetchJSON(from: "https://jsonplaceholder.typicode.com/posts/1", as: Post.self) { result in
    switch result {
    case .success(let post):
        print("Post title: \(post.title)")
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}
