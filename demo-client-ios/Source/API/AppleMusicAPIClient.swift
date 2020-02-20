import Apollo
import IGListKit

public struct AppleMusicAPIClient {
  
  private static var apolloClient: ApolloClient!
  
  public static func setup(apolloClient: ApolloClient) {
    AppleMusicAPIClient.apolloClient = apolloClient
  }
  
  public static func searchPlaylists(storefront: String, term: String?, language: String?, limit: Int?, offset: String?, completion: @escaping (Result<[Playlist], AppleMusicAPIClientError>) -> Void) {
    let client = getApiClient()
    let query = MusicSearchQuery(storefront: storefront, term: term, language: language, limit: limit, offset: offset, types: ["playlists"])
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let data = queryResult.data?.musicSearch.results.playlists?.data else {
          completion(.success([]))
          return
        }
        let playlists = data.compactMap { datum -> Playlist? in
          let cellFragment = datum.fragments.playlistCellFragment
          let navigationFragment = datum.fragments.playlistNavigationFragment
          return Playlist(fragment: cellFragment, navigationFragment: navigationFragment)
        }
        completion(.success(playlists))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func searchPlaylistHints(storefront: String, term: String?, language: String?, limit: Int?, completion: @escaping (Result<[String], AppleMusicAPIClientError>) -> ()) {
    searchHints(storefront: storefront, term: term, language: language, limit: limit, types: ["playlists"], completion: completion)
  }
  
  public static func searchAlbums(storefront: String, term: String?, language: String?, limit: Int?, offset: String?, completion: @escaping (Result<[Album], AppleMusicAPIClientError>) -> Void) {
    let client = getApiClient()
    let query = MusicSearchQuery(storefront: storefront, term: term, language: language, limit: limit, offset: offset, types: ["albums"])
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let data = queryResult.data?.musicSearch.results.albums?.data else {
          completion(.success([]))
          return
        }
        let albums = data.compactMap { datum -> Album? in
          let cellFragment = datum.fragments.albumCellFragment
          let navigationFragment = datum.fragments.albumNavigationFragment
          return Album(fragment: cellFragment, navigationFragment: navigationFragment)
        }
        completion(.success(albums))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func searchAlbumHints(storefront: String, term: String?, language: String?, limit: Int?, completion: @escaping (Result<[String], AppleMusicAPIClientError>) -> ()) {
    searchHints(storefront: storefront, term: term, language: language, limit: limit, types: ["albums"], completion: completion)
  }
  
  public static func searchSongs(storefront: String, term: String?, language: String?, completion: @escaping (Result<[Song], AppleMusicAPIClientError>) -> Void) {
    let client = getApiClient()
    let query = MusicSearchQuery(storefront: storefront, term: term, language: language, limit: nil, offset: nil, types: ["songs"])
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let data = queryResult.data?.musicSearch.results.songs?.data else {
          completion(.failure(.graphqlError(description: "No terms")))
          return
        }
        let songs = data.compactMap { datum -> Song? in
          let cellFragment = datum.fragments.songCellFragment
          let navigationFragment = datum.fragments.songNavigationFragment
          return Song(fragment: cellFragment, navigationFragment: navigationFragment)
        }
        completion(.success(songs))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func searchSongHints(storefront: String, term: String?, language: String?, limit: Int?, completion: @escaping (Result<[String], AppleMusicAPIClientError>) -> ()) {
    searchHints(storefront: storefront, term: term, language: language, limit: limit, types: ["songs"], completion: completion)
  }
  
  public static func searchMusicVideos(storefront: String, term: String?, language: String?, limit: Int?, offset: String?, completion: @escaping (Result<[MusicVideo], AppleMusicAPIClientError>) -> Void) {
    let client = getApiClient()
    let query = MusicSearchQuery(storefront: storefront, term: term, language: language, limit: limit, offset: offset, types: ["music-videos"])
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let data = queryResult.data?.musicSearch.results.musicVideos?.data else {
          completion(.success([]))
          return
        }
        let musicVideos = data.compactMap { datum -> MusicVideo? in
          let cellFragment = datum.fragments.musicVideoCellFragment
          let navigationFragment = datum.fragments.musicVideoNavigationFragment
          return MusicVideo(fragment: cellFragment, navigationFragment: navigationFragment)
        }
        completion(.success(musicVideos))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func searchMusicVideoHints(storefront: String, term: String?, language: String?, limit: Int?, completion: @escaping (Result<[String], AppleMusicAPIClientError>) -> ()) {
    searchHints(storefront: storefront, term: term, language: language, limit: limit, types: ["music-videos"], completion: completion)
  }
  
  public static func searchArtists(storefront: String, term: String?, language: String?, limit: Int?, offset: String?, completion: @escaping (Result<[Artist], AppleMusicAPIClientError>) -> Void) {
    let client = getApiClient()
    let query = MusicSearchQuery(storefront: storefront, term: term, language: language, limit: limit, offset: offset, types: ["artists"])
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let data = queryResult.data?.musicSearch.results.artists?.data else {
          completion(.success([]))
          return
        }
        let artists = data.compactMap { datum -> Artist? in
          let cellFragment = datum.fragments.artistCellFragment
          let navigationFragment = datum.fragments.artistNavigationFragment
          return Artist(fragment: cellFragment, navigationFragment: navigationFragment)
        }
        completion(.success(artists))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func searchArtistHints(storefront: String, term: String?, language: String?, limit: Int?, completion: @escaping (Result<[String], AppleMusicAPIClientError>) -> ()) {
    searchHints(storefront: storefront, term: term, language: language, limit: limit, types: ["artists"], completion: completion)
  }
  
  public static func searchHints(storefront: String, term: String?, language: String?, limit: Int?, types: [String], completion: @escaping (Result<[String], AppleMusicAPIClientError>) -> ()) {
    let client = getApiClient()
    let query = MusicSearchHintsQuery(storefront: storefront, term: term, language: language, limit: limit, types: types)
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let terms = queryResult.data?.musicSearchHints.results.terms else {
          completion(.failure(.graphqlError(description: "No terms")))
          return
        }
        completion(.success(terms))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func fetchPlaylistCharts(storefront: String, language: String?, limit: Int?, offset: Int, completion: @escaping (Result<PlaylistChart, AppleMusicAPIClientError>) -> ()) {
    let client = getApiClient()
    let query = PlaylistChartsQuery(storefront: storefront, language: language, limit: limit, offset: offset)
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let dbChart = queryResult.data?.charts.playlists[safe: 0] else {
          completion(.failure(.graphqlError(description: "Charts is nil")))
          return
        }
        completion(.success(.init(fragment: dbChart.fragments.chartFragment)))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func fetchPlaylist(id: String, storefront: String, language: String?, completion: @escaping (Result<Playlist, AppleMusicAPIClientError>) -> ()) {
    let client = getApiClient()
    let query = PlaylistQuery(id: id, storefront: storefront, language: language)
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let dbPlaylist = queryResult.data?.playlist.data[safe: 0] else {
          completion(.failure(.graphqlError(description: "playlist is nil")))
          return
        }
        guard let playlist = Playlist(fragment: dbPlaylist.fragments.playlistCellFragment, navigationFragment: dbPlaylist.fragments.playlistNavigationFragment) else {
          completion(.failure(.notFoundError))
          return
        }
        completion(.success(playlist))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func fetchAlbumCharts(storefront: String, language: String?, limit: Int?, offset: Int, completion: @escaping (Result<AlbumChart, AppleMusicAPIClientError>) -> ()) {
    let client = getApiClient()
    let query = AlbumChartsQuery(storefront: storefront, language: language, limit: limit, offset: offset)
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let dbChart = queryResult.data?.charts.albums[safe: 0] else {
          completion(.failure(.graphqlError(description: "Charts is nil")))
          return
        }
        completion(.success(.init(fragment: dbChart.fragments.chartFragment)))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func fetchAlbum(id: String, storefront: String, language: String?, completion: @escaping (Result<Album, AppleMusicAPIClientError>) -> ()) {
    let client = getApiClient()
    let query = AlbumQuery(id: id, storefront: storefront, language: language)
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let dbAlbum = queryResult.data?.album.data[safe: 0] else {
          completion(.failure(.graphqlError(description: "album is nil")))
          return
        }
        guard let album = Album(fragment: dbAlbum.fragments.albumCellFragment, navigationFragment: dbAlbum.fragments.albumNavigationFragment) else {
          completion(.failure(.notFoundError))
          return
        }
        completion(.success(album))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func fetchSongCharts(storefront: String, language: String?, limit: Int?, offset: Int, completion: @escaping (Result<SongChart, AppleMusicAPIClientError>) -> ()) {
    let client = getApiClient()
    let query = SongChartsQuery(storefront: storefront, language: language, limit: limit, offset: offset)
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let dbChart = queryResult.data?.charts.songs[safe: 0] else {
          completion(.failure(.graphqlError(description: "Charts is nil")))
          return
        }
        completion(.success(.init(fragment: dbChart.fragments.chartFragment)))
      case .failure:
        completion(.failure(.networkError))
        
      }
    }
  }
  
  public static func fetchSong(id: String, storefront: String, language: String?, completion: @escaping (Result<Song, AppleMusicAPIClientError>) -> ()) {
    let client = getApiClient()
    let query = SongQuery(id: id, storefront: storefront, language: language)
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let dbSong = queryResult.data?.song.data[safe: 0] else {
          completion(.failure(.graphqlError(description: "song is nil")))
          return
        }
        let song = Song(fragment: dbSong.fragments.songCellFragment, navigationFragment: dbSong.fragments.songNavigationFragment)
        completion(.success(song))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func fetchMusicVideoCharts(storefront: String, language: String?, limit: Int?, offset: Int, completion: @escaping (Result<MusicVideoChart, AppleMusicAPIClientError>) -> ()) {
    let client = getApiClient()
    let query = MusicVideoChartsQuery(storefront: storefront, language: language, limit: limit, offset: offset)
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let dbChart = queryResult.data?.charts.musicVideos[safe: 0] else {
          completion(.failure(.graphqlError(description: "Charts is nil")))
          return
        }
        completion(.success(.init(fragment: dbChart.fragments.chartFragment)))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  public static func fetchMusicVideo(id: String, storefront: String, language: String?, completion: @escaping (Result<MusicVideo, AppleMusicAPIClientError>) -> ()) {
    let client = getApiClient()
    let query = MusicVideoQuery(id: id, storefront: storefront, language: language)
    client.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
      switch result {
      case let .success(queryResult):
        guard let dbMusicVideo = queryResult.data?.musicVideo.data[safe: 0] else {
          completion(.failure(.graphqlError(description: "song is nil")))
          return
        }
        let musicVideo = MusicVideo(fragment: dbMusicVideo.fragments.musicVideoCellFragment, navigationFragment: dbMusicVideo.fragments.musicVideoNavigationFragment)
        completion(.success(musicVideo))
      case .failure:
        completion(.failure(.networkError))
      }
    }
  }
  
  private static func getApiClient() -> ApolloClient { return apolloClient }
  
  public enum AppleMusicAPIClientError: Error {
    case networkError
    case graphqlError(description: String)
    case notFoundError
  }
  
  public class PlaylistChart: Codable, ListDiffable {
    public var id: String { "\(chart)-\(playlists[safe: 0]?.id ?? "")-\(playlists.count)" }
    public let chart: String
    public let name: String
    public let playlists: [Playlist]
    
    public init(fragment: ChartFragment) {
      self.chart = fragment.chart
      self.name =  fragment.name
      self.playlists = fragment.data.compactMap { datum -> Playlist? in
        guard let dbPlaylist = datum.asPlaylist else { return nil }
        return Playlist(fragment: dbPlaylist.fragments.playlistCellFragment)
      }
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
      return id as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      guard let object = object as? PlaylistChart else {
        return false
      }
      if self === object {
        return true
      } else if self.id == object.id {
        return true
      }
      return false
    }
  }
  
  public class AlbumChart: Codable, ListDiffable {
    public var id: String { "\(chart)-\(albums[safe: 0]?.id ?? "")-\(albums.count)" }
    public let chart: String
    public let name: String
    public let albums: [Album]
    
    public init(fragment: ChartFragment) {
      self.chart = fragment.chart
      self.name =  fragment.name
      self.albums = fragment.data.compactMap { datum -> Album? in
        guard let dbAlbum = datum.asAlbum else { return nil }
        return Album(fragment: dbAlbum.fragments.albumCellFragment)
      }
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
      return id as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      guard let object = object as? AlbumChart else {
        return false
      }
      if self === object {
        return true
      } else if self.id == object.id {
        return true
      }
      return false
    }
  }
  
  public class SongChart: Codable, ListDiffable {
    public var id: String { "\(chart)-\(songs[safe: 0]?.id ?? "")-\(songs.count)" }
    public let chart: String
    public let name: String
    public let songs: [Song]
    
    public init(fragment: ChartFragment) {
      self.chart = fragment.chart
      self.name =  fragment.name
      self.songs = fragment.data.compactMap { datum -> Song? in
        guard let dbSong = datum.asSong else { return nil }
        return Song(fragment: dbSong.fragments.songCellFragment)
      }
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
      return id as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      guard let object = object as? SongChart else {
        return false
      }
      if self === object {
        return true
      } else if self.id == object.id {
        return true
      }
      return false
    }
  }
  
  public class MusicVideoChart: Codable, ListDiffable {
    public var id: String { "\(chart)-\(musicVideos[safe: 0]?.id ?? "")-\(musicVideos.count)" }
    public let chart: String
    public let name: String
    public let musicVideos: [MusicVideo]
    
    public init(fragment: ChartFragment) {
      self.chart = fragment.chart
      self.name =  fragment.name
      self.musicVideos = fragment.data.compactMap { datum -> MusicVideo? in
        guard let dbSong = datum.asMusicVideo else { return nil }
        return MusicVideo(fragment: dbSong.fragments.musicVideoCellFragment)
      }
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
      return id as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      guard let object = object as? MusicVideoChart else {
        return false
      }
      if self === object {
        return true
      } else if self.id == object.id {
        return true
      }
      return false
    }
  }
  
  public class SongSearch: Codable, ListDiffable {
    public var id: String { "\(searchTerm)-\(songs[safe: 0]?.id ?? "")-\(songs.count)" }
    public let searchTerm: String
    public let songs: [Song]
    
    public init(searchTerm: String, songs: [Song]) {
      self.searchTerm = searchTerm
      self.songs =  songs
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
      return id as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      guard let object = object as? SongSearch else {
        return false
      }
      if self === object {
        return true
      } else if self.id == object.id {
        return true
      }
      return false
    }
  }
  
  public class Playlist: Codable, ListDiffable {
    public let id: String
    public let name: String
    public let curatorName: String?
    public let imageURL: URL?
    public var songs: [Song]?
    public var musicVideos: [MusicVideo]?
    
    public static func getImageURL(from artworkUrlString: String) -> URL {
      return URL.transform(from: artworkUrlString.replacingOccurrences(of: "{w}", with: "120").replacingOccurrences(of: "{h}", with: "120"))
    }
    
    public init?(fragment: PlaylistCellFragment, navigationFragment: PlaylistNavigationFragment? = nil) {
      guard let attributes = fragment.optionalAttributes else { return nil }
      self.id = fragment.id
      self.name = attributes.name
      self.curatorName = attributes.curatorName
      if let urlString = attributes.artwork?.url {
        self.imageURL = Song.getImageURL(from: urlString)
      } else {
        self.imageURL = nil
      }
      if let navigationFragment = navigationFragment {
        self.songs = navigationFragment.relationships?.tracks?.data.compactMap { datum -> Song? in
          guard let fragment = datum.asSong?.fragments.songCellFragment else { return nil }
          return Song(fragment: fragment)
        }
        self.musicVideos = navigationFragment.relationships?.tracks?.data.compactMap { datum -> MusicVideo? in
          guard let fragment = datum.asMusicVideo?.fragments.musicVideoCellFragment else { return nil }
          return MusicVideo(fragment: fragment)
        }
      }
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
      return id as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      guard let object = object as? Playlist else {
        return false
      }
      if self === object {
        return true
      } else if self.id == object.id {
        return true
      }
      return false
    }
  }
  
  public class Album: Codable, ListDiffable {
    public let id: String
    public let name: String
    public let artistName: String
    public let genres: [String]
    public let isSingle: Bool
    public let trackCount: Int
    public let record: String
    public let copyright: String?
    public let editorialNotes: String?
    public let imageURL: URL?
    public var songs: [Song]?
    public var musicVideos: [MusicVideo]?
    
    public static func getImageURL(from artworkUrlString: String) -> URL {
      return URL.transform(from: artworkUrlString.replacingOccurrences(of: "{w}", with: "120").replacingOccurrences(of: "{h}", with: "120"))
    }
    
    public init?(fragment: AlbumCellFragment, navigationFragment: AlbumNavigationFragment? = nil) {
      guard let attributes = fragment.optionalAttributes else { return nil }
      self.id = fragment.id
      self.name = attributes.name
      self.artistName = attributes.artistName
      self.genres = attributes.genreNames
      self.isSingle = attributes.isSingle
      self.trackCount = attributes.trackCount
      self.record = attributes.recordLabel
      self.copyright = attributes.copyright
      self.editorialNotes = attributes.editorialNotes?.short
      if let urlString = attributes.artwork?.url {
        self.imageURL = Song.getImageURL(from: urlString)
      } else {
        self.imageURL = nil
      }
      if let navigationFragment = navigationFragment {
        self.songs = navigationFragment.relationships?.tracks?.data.compactMap { datum -> Song? in
          guard let fragment = datum.asSong?.fragments.songCellFragment else { return nil }
          return Song(fragment: fragment)
        }
        self.musicVideos = navigationFragment.relationships?.tracks?.data.compactMap { datum -> MusicVideo? in
          guard let fragment = datum.asMusicVideo?.fragments.musicVideoCellFragment else { return nil }
          return MusicVideo(fragment: fragment)
        }
      }
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
      return id as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      guard let object = object as? Album else {
        return false
      }
      if self === object {
        return true
      } else if self.id == object.id {
        return true
      }
      return false
    }
  }
  
  public class Song: Codable, ListDiffable {
    public let id: String
    public let name: String
    public let artistName: String
    public let duration: Int
    public let imageURL: URL
    public let previewURL: URL
    public var albums: [Album]?
    public var artists: [Artist]?
    
    // local state
    public let isPlaying: Bool
    public let isFavorite: Bool
    
    public static func getDuration(from milliseconds: Int?) -> Int {
      guard let milliseconds = milliseconds else { return 0 }
      return Int(milliseconds / 1000)
    }
    
    public static func getImageURL(from artworkUrlString: String) -> URL {
      return URL.transform(from: artworkUrlString.replacingOccurrences(of: "{w}", with: "120").replacingOccurrences(of: "{h}", with: "120"))
    }
    
    public init(fragment: SongCellFragment, navigationFragment: SongNavigationFragment? = nil, localFragment: SongLocalFragment = SongLocalFragment()) {
      self.id = fragment.id
      self.name = fragment.attributes!.name
      self.artistName = fragment.attributes!.artistName
      self.duration = Song.getDuration(from: fragment.attributes!.durationInMillis ?? 30_000)
      self.imageURL = Song.getImageURL(from: fragment.attributes!.artwork.url)
      self.previewURL = URL.transform(from: fragment.attributes!.previews[0].url)
      if let navigationFragment = navigationFragment {
        self.albums = navigationFragment.relationships?.albums?.data.compactMap { datum -> Album? in
          let fragment = datum.fragments.albumCellFragment
          return Album(fragment: fragment)
        }
        self.artists = navigationFragment.relationships?.artists?.data.compactMap { datum -> Artist? in
          let fragment = datum.fragments.artistCellFragment
          return Artist(fragment: fragment)
        }
      }
      self.isPlaying = localFragment.isPlaying
      self.isFavorite = localFragment.isFavorite
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
      return id as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      guard let object = object as? Song else {
        return false
      }
      if self === object {
        return true
      } else if self.id == object.id {
        return true
      }
      return false
    }
  }
  
  public struct SongLocalFragment {
    public var isPlaying: Bool = false
    public var isFavorite: Bool = false
    
    public init(isPlaying: Bool = false, isFavorite: Bool = false) {
      self.isPlaying = isPlaying
      self.isFavorite = isFavorite
    }
  }
  
  public class MusicVideo: Codable, ListDiffable {
    public let id: String
    public let name: String
    public let artistName: String
    public let imageURL: URL
    public var previewURL: URL
    public var hlsPreviewURL: URL?
    public var albums: [Album]?
    public var artists: [Artist]?
    
    public static func getImageURL(from artworkUrlString: String) -> URL {
      return URL.transform(from: artworkUrlString.replacingOccurrences(of: "{w}", with: "400").replacingOccurrences(of: "{h}", with: "400"))
    }
    
    public init(fragment: MusicVideoCellFragment, navigationFragment: MusicVideoNavigationFragment? = nil) {
      self.id = fragment.id
      self.name = fragment.attributes!.name
      self.artistName = fragment.attributes!.artistName
      self.imageURL = MusicVideo.getImageURL(from: fragment.attributes!.artwork.url)
      self.previewURL = URL.transform(from: fragment.attributes!.previews[0].url)
      if let hlsString = fragment.attributes!.previews[0].hlsUrl {
        self.hlsPreviewURL = URL.transform(from: hlsString)
      }
      if let navigationFragment = navigationFragment {
        self.albums = navigationFragment.relationships?.albums?.data.compactMap { datum -> Album? in
          let fragment = datum.fragments.albumCellFragment
          return Album(fragment: fragment)
        }
        self.artists = navigationFragment.relationships?.artists?.data.compactMap { datum -> Artist? in
          let fragment = datum.fragments.artistCellFragment
          return Artist(fragment: fragment)
        }
      }
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
      return id as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      guard let object = object as? Song else {
        return false
      }
      if self === object {
        return true
      } else if self.id == object.id {
        return true
      }
      return false
    }
  }

  public class Artist: Codable, ListDiffable {
    public let id: String
    public let name: String
    public let genreNames: [String]
    public var albums: [Album]?
    public var musicVideos: [MusicVideo]?
    public var playlists: [Playlist]?
    
    public init(fragment: ArtistCellFragment, navigationFragment: ArtistNavigationFragment? = nil) {
      self.id = fragment.id
      self.name = fragment.attributes!.name
      self.genreNames = fragment.attributes!.genreNames
      if let navigationFragment = navigationFragment {
        self.albums = navigationFragment.relationships?.albums?.data.compactMap { datum -> Album? in
          let fragment = datum.fragments.albumCellFragment
          return Album(fragment: fragment)
        }
        self.musicVideos = navigationFragment.relationships?.musicVideos?.data.compactMap { datum -> MusicVideo? in
          let fragment = datum.fragments.musicVideoCellFragment
          return MusicVideo(fragment: fragment)
        }
        self.playlists = navigationFragment.relationships?.playlists?.data.compactMap { datum -> Playlist? in
          let fragment = datum.fragments.playlistCellFragment
          return Playlist(fragment: fragment)
        }
      }
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
      return id as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      guard let object = object as? Song else {
        return false
      }
      if self === object {
        return true
      } else if self.id == object.id {
        return true
      }
      return false
    }
  }
}

extension URL {
  static func transform(from stringValue: String) -> URL{ return URL(string: stringValue)! }
}
