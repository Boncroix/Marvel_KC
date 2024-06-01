//
//  NetworkHeros.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 1/5/24.
//

import Foundation

//MARK: - Protocol
protocol NetworkHerosProtocol {
    func getHeros() async throws -> [Hero]
}

//MARK: - NetworkHeros
final class NetworkHeros: NetworkHerosProtocol {
    
    //MARK: - GetHeros
    func getHeros() async throws -> [Hero] {
        
        guard let url = URL(string: "\(ConstApp.API_URL)\(stringEndpoint(endpoint: .heros))\(ConstApp.TS)&\(ConstApp.PUBLIC_KEY)&\(ConstApp.HASH_MD5)") else {
            throw NetworkError.malformedURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        request.setValue(HTTPMethods.content, forHTTPHeaderField: HTTPHeader.contentType)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = (response as? HTTPURLResponse),
              httpResponse.getStatusCode() == HTTPResponseCodes.SUCCESS else {
            throw NetworkError.statusCodeError(response.getStatusCode())
        }
        
        guard let modelResponse = try? JSONDecoder().decode([Hero].self, from: data) else {
            throw NetworkError.dataDecodingFailed
        }
        
        return modelResponse
    }
}

//MARK: - NetworkHerosFake
final class NetworkHerosFake: NetworkHerosProtocol {
    func getHeros() async throws -> [Hero] {
        let fakeHeros: [Hero] = [
            Hero(id: 1, name: "Capitán Destello", description: "Un héroe veloz con poderes de relámpagos", comics: Comics(available: 5, collectionURI: "https://api.fakecomics.com/collections/1", items: [ComicsItem(resourceURI: "https://api.fakecomics.com/comics/1", name: "Capitán Destello: Orígenes"), ComicsItem(resourceURI: "https://api.fakecomics.com/comics/2", name: "Capitán Destello: La Saga de los Rayos")], returned: 2), series: Comics(available: 3, collectionURI: "https://api.fakecomics.com/collections/2", items: [ComicsItem(resourceURI: "https://api.fakecomics.com/series/1", name: "Capitán Destello: Serie Principal"), ComicsItem(resourceURI: "https://api.fakecomics.com/series/2", name: "Capitán Destello: Aventuras Electrizantes")], returned: 2)),
            
            Hero(id: 2, name: "Fénix Cósmico", description: "Un ser cósmico con poderes de manipulación de la realidad", comics: Comics(available: 8, collectionURI: "https://api.fakecomics.com/collections/3", items: [ComicsItem(resourceURI: "https://api.fakecomics.com/comics/3", name: "Fénix Cósmico: El Despertar"), ComicsItem(resourceURI: "https://api.fakecomics.com/comics/4", name: "Fénix Cósmico: Caída del Universo")], returned: 2), series: Comics(available: 4, collectionURI: "https://api.fakecomics.com/collections/4", items: [ComicsItem(resourceURI: "https://api.fakecomics.com/series/3", name: "Fénix Cósmico: Serie Principal"), ComicsItem(resourceURI: "https://api.fakecomics.com/series/4", name: "Fénix Cósmico: Guardianes del Cosmos")], returned: 2)),
            
            Hero(id: 3, name: "Doctor Escarcha", description: "Un científico convertido en villano con el poder del hielo", comics: Comics(available: 6, collectionURI: "https://api.fakecomics.com/collections/5", items: [ComicsItem(resourceURI: "https://api.fakecomics.com/comics/5", name: "Doctor Escarcha: La Transformación"), ComicsItem(resourceURI: "https://api.fakecomics.com/comics/6", name: "Doctor Escarcha: El Frío Eterno")], returned: 2), series: Comics(available: 2, collectionURI: "https://api.fakecomics.com/collections/6", items: [ComicsItem(resourceURI: "https://api.fakecomics.com/series/5", name: "Doctor Escarcha: Serie Principal"), ComicsItem(resourceURI: "https://api.fakecomics.com/series/6", name: "Doctor Escarcha: La Conquista Glacial")], returned: 2))
        ]
        return fakeHeros
    }
}

