// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class PlaylistChartsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query PlaylistCharts($storefront: String!, $language: String, $limit: Int, $offset: Int) {
      charts(storefront: $storefront, types: "playlists", l: $language, limit: $limit, offset: $offset) {
        __typename
        playlists {
          __typename
          ...ChartFragment
        }
      }
    }
    """

  public let operationName: String = "PlaylistCharts"

  public var queryDocument: String { return operationDefinition.appending(ChartFragment.fragmentDefinition).appending(SongCellFragment.fragmentDefinition).appending(MusicVideoCellFragment.fragmentDefinition).appending(PlaylistCellFragment.fragmentDefinition).appending(AlbumCellFragment.fragmentDefinition) }

  public var storefront: String
  public var language: String?
  public var limit: Int?
  public var offset: Int?

  public init(storefront: String, language: String? = nil, limit: Int? = nil, offset: Int? = nil) {
    self.storefront = storefront
    self.language = language
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["storefront": storefront, "language": language, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("charts", arguments: ["storefront": GraphQLVariable("storefront"), "types": "playlists", "l": GraphQLVariable("language"), "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.object(Chart.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(charts: Chart) {
      self.init(unsafeResultMap: ["__typename": "Query", "charts": charts.resultMap])
    }

    /// Fetch one or more charts from the Apple Music Catalog.
    public var charts: Chart {
      get {
        return Chart(unsafeResultMap: resultMap["charts"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "charts")
      }
    }

    public struct Chart: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ChartResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("playlists", type: .nonNull(.list(.nonNull(.object(Playlist.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(playlists: [Playlist]) {
        self.init(unsafeResultMap: ["__typename": "ChartResponse", "playlists": playlists.map { (value: Playlist) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The playlists returned when fetching charts.
      public var playlists: [Playlist] {
        get {
          return (resultMap["playlists"] as! [ResultMap]).map { (value: ResultMap) -> Playlist in Playlist(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Playlist) -> ResultMap in value.resultMap }, forKey: "playlists")
        }
      }

      public struct Playlist: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Chart"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ChartFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var chartFragment: ChartFragment {
            get {
              return ChartFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class AlbumChartsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AlbumCharts($storefront: String!, $language: String, $limit: Int, $offset: Int) {
      charts(storefront: $storefront, types: "albums", l: $language, limit: $limit, offset: $offset) {
        __typename
        albums {
          __typename
          ...ChartFragment
        }
      }
    }
    """

  public let operationName: String = "AlbumCharts"

  public var queryDocument: String { return operationDefinition.appending(ChartFragment.fragmentDefinition).appending(SongCellFragment.fragmentDefinition).appending(MusicVideoCellFragment.fragmentDefinition).appending(PlaylistCellFragment.fragmentDefinition).appending(AlbumCellFragment.fragmentDefinition) }

  public var storefront: String
  public var language: String?
  public var limit: Int?
  public var offset: Int?

  public init(storefront: String, language: String? = nil, limit: Int? = nil, offset: Int? = nil) {
    self.storefront = storefront
    self.language = language
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["storefront": storefront, "language": language, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("charts", arguments: ["storefront": GraphQLVariable("storefront"), "types": "albums", "l": GraphQLVariable("language"), "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.object(Chart.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(charts: Chart) {
      self.init(unsafeResultMap: ["__typename": "Query", "charts": charts.resultMap])
    }

    /// Fetch one or more charts from the Apple Music Catalog.
    public var charts: Chart {
      get {
        return Chart(unsafeResultMap: resultMap["charts"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "charts")
      }
    }

    public struct Chart: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ChartResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("albums", type: .nonNull(.list(.nonNull(.object(Album.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(albums: [Album]) {
        self.init(unsafeResultMap: ["__typename": "ChartResponse", "albums": albums.map { (value: Album) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The albums returned when fetching charts.
      public var albums: [Album] {
        get {
          return (resultMap["albums"] as! [ResultMap]).map { (value: ResultMap) -> Album in Album(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Album) -> ResultMap in value.resultMap }, forKey: "albums")
        }
      }

      public struct Album: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Chart"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ChartFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var chartFragment: ChartFragment {
            get {
              return ChartFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class SongChartsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SongCharts($storefront: String!, $language: String, $limit: Int, $offset: Int) {
      charts(storefront: $storefront, types: "songs", l: $language, limit: $limit, offset: $offset) {
        __typename
        songs {
          __typename
          ...ChartFragment
        }
      }
    }
    """

  public let operationName: String = "SongCharts"

  public var queryDocument: String { return operationDefinition.appending(ChartFragment.fragmentDefinition).appending(SongCellFragment.fragmentDefinition).appending(MusicVideoCellFragment.fragmentDefinition).appending(PlaylistCellFragment.fragmentDefinition).appending(AlbumCellFragment.fragmentDefinition) }

  public var storefront: String
  public var language: String?
  public var limit: Int?
  public var offset: Int?

  public init(storefront: String, language: String? = nil, limit: Int? = nil, offset: Int? = nil) {
    self.storefront = storefront
    self.language = language
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["storefront": storefront, "language": language, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("charts", arguments: ["storefront": GraphQLVariable("storefront"), "types": "songs", "l": GraphQLVariable("language"), "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.object(Chart.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(charts: Chart) {
      self.init(unsafeResultMap: ["__typename": "Query", "charts": charts.resultMap])
    }

    /// Fetch one or more charts from the Apple Music Catalog.
    public var charts: Chart {
      get {
        return Chart(unsafeResultMap: resultMap["charts"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "charts")
      }
    }

    public struct Chart: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ChartResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("songs", type: .nonNull(.list(.nonNull(.object(Song.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(songs: [Song]) {
        self.init(unsafeResultMap: ["__typename": "ChartResponse", "songs": songs.map { (value: Song) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The songs returned when fetching charts.
      public var songs: [Song] {
        get {
          return (resultMap["songs"] as! [ResultMap]).map { (value: ResultMap) -> Song in Song(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Song) -> ResultMap in value.resultMap }, forKey: "songs")
        }
      }

      public struct Song: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Chart"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ChartFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var chartFragment: ChartFragment {
            get {
              return ChartFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class MusicVideoChartsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MusicVideoCharts($storefront: String!, $language: String, $limit: Int, $offset: Int) {
      charts(storefront: $storefront, types: "music-videos", l: $language, limit: $limit, offset: $offset) {
        __typename
        musicVideos {
          __typename
          ...ChartFragment
        }
      }
    }
    """

  public let operationName: String = "MusicVideoCharts"

  public var queryDocument: String { return operationDefinition.appending(ChartFragment.fragmentDefinition).appending(SongCellFragment.fragmentDefinition).appending(MusicVideoCellFragment.fragmentDefinition).appending(PlaylistCellFragment.fragmentDefinition).appending(AlbumCellFragment.fragmentDefinition) }

  public var storefront: String
  public var language: String?
  public var limit: Int?
  public var offset: Int?

  public init(storefront: String, language: String? = nil, limit: Int? = nil, offset: Int? = nil) {
    self.storefront = storefront
    self.language = language
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["storefront": storefront, "language": language, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("charts", arguments: ["storefront": GraphQLVariable("storefront"), "types": "music-videos", "l": GraphQLVariable("language"), "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.object(Chart.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(charts: Chart) {
      self.init(unsafeResultMap: ["__typename": "Query", "charts": charts.resultMap])
    }

    /// Fetch one or more charts from the Apple Music Catalog.
    public var charts: Chart {
      get {
        return Chart(unsafeResultMap: resultMap["charts"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "charts")
      }
    }

    public struct Chart: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ChartResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("musicVideos", type: .nonNull(.list(.nonNull(.object(MusicVideo.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(musicVideos: [MusicVideo]) {
        self.init(unsafeResultMap: ["__typename": "ChartResponse", "musicVideos": musicVideos.map { (value: MusicVideo) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The music videos returned when fetching charts.
      public var musicVideos: [MusicVideo] {
        get {
          return (resultMap["musicVideos"] as! [ResultMap]).map { (value: ResultMap) -> MusicVideo in MusicVideo(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: MusicVideo) -> ResultMap in value.resultMap }, forKey: "musicVideos")
        }
      }

      public struct MusicVideo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Chart"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ChartFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var chartFragment: ChartFragment {
            get {
              return ChartFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class PlaylistQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Playlist($id: String!, $storefront: String!, $language: String) {
      playlist(id: $id, storefront: $storefront, l: $language, include: "") {
        __typename
        data {
          __typename
          ...PlaylistCellFragment
          ...PlaylistNavigationFragment
        }
      }
    }
    """

  public let operationName: String = "Playlist"

  public var queryDocument: String { return operationDefinition.appending(PlaylistCellFragment.fragmentDefinition).appending(PlaylistNavigationFragment.fragmentDefinition).appending(SongCellFragment.fragmentDefinition).appending(MusicVideoCellFragment.fragmentDefinition) }

  public var id: String
  public var storefront: String
  public var language: String?

  public init(id: String, storefront: String, language: String? = nil) {
    self.id = id
    self.storefront = storefront
    self.language = language
  }

  public var variables: GraphQLMap? {
    return ["id": id, "storefront": storefront, "language": language]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("playlist", arguments: ["id": GraphQLVariable("id"), "storefront": GraphQLVariable("storefront"), "l": GraphQLVariable("language"), "include": ""], type: .nonNull(.object(Playlist.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(playlist: Playlist) {
      self.init(unsafeResultMap: ["__typename": "Query", "playlist": playlist.resultMap])
    }

    /// Fetch one or more playlists by using their identifiers.
    public var playlist: Playlist {
      get {
        return Playlist(unsafeResultMap: resultMap["playlist"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "playlist")
      }
    }

    public struct Playlist: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PlaylistResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "PlaylistResponse", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data included in the response for a playlist object request.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Playlist"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PlaylistCellFragment.self),
          GraphQLFragmentSpread(PlaylistNavigationFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var playlistCellFragment: PlaylistCellFragment {
            get {
              return PlaylistCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public var playlistNavigationFragment: PlaylistNavigationFragment {
            get {
              return PlaylistNavigationFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class AlbumQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Album($id: String!, $storefront: String!, $language: String) {
      album(id: $id, storefront: $storefront, l: $language, include: "") {
        __typename
        data {
          __typename
          ...AlbumCellFragment
          ...AlbumNavigationFragment
        }
      }
    }
    """

  public let operationName: String = "Album"

  public var queryDocument: String { return operationDefinition.appending(AlbumCellFragment.fragmentDefinition).appending(AlbumNavigationFragment.fragmentDefinition).appending(SongCellFragment.fragmentDefinition).appending(MusicVideoCellFragment.fragmentDefinition) }

  public var id: String
  public var storefront: String
  public var language: String?

  public init(id: String, storefront: String, language: String? = nil) {
    self.id = id
    self.storefront = storefront
    self.language = language
  }

  public var variables: GraphQLMap? {
    return ["id": id, "storefront": storefront, "language": language]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("album", arguments: ["id": GraphQLVariable("id"), "storefront": GraphQLVariable("storefront"), "l": GraphQLVariable("language"), "include": ""], type: .nonNull(.object(Album.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(album: Album) {
      self.init(unsafeResultMap: ["__typename": "Query", "album": album.resultMap])
    }

    /// Fetch an album by using its identifier.
    public var album: Album {
      get {
        return Album(unsafeResultMap: resultMap["album"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "album")
      }
    }

    public struct Album: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AlbumResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "AlbumResponse", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data included in the response for an album object request.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Album"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(AlbumCellFragment.self),
          GraphQLFragmentSpread(AlbumNavigationFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var albumCellFragment: AlbumCellFragment {
            get {
              return AlbumCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public var albumNavigationFragment: AlbumNavigationFragment {
            get {
              return AlbumNavigationFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class SongQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Song($id: String!, $storefront: String!, $language: String) {
      song(id: $id, storefront: $storefront, l: $language, include: "") {
        __typename
        data {
          __typename
          ...SongCellFragment
          ...SongNavigationFragment
        }
      }
    }
    """

  public let operationName: String = "Song"

  public var queryDocument: String { return operationDefinition.appending(SongCellFragment.fragmentDefinition).appending(SongNavigationFragment.fragmentDefinition).appending(AlbumCellFragment.fragmentDefinition).appending(ArtistCellFragment.fragmentDefinition) }

  public var id: String
  public var storefront: String
  public var language: String?

  public init(id: String, storefront: String, language: String? = nil) {
    self.id = id
    self.storefront = storefront
    self.language = language
  }

  public var variables: GraphQLMap? {
    return ["id": id, "storefront": storefront, "language": language]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("song", arguments: ["id": GraphQLVariable("id"), "storefront": GraphQLVariable("storefront"), "l": GraphQLVariable("language"), "include": ""], type: .nonNull(.object(Song.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(song: Song) {
      self.init(unsafeResultMap: ["__typename": "Query", "song": song.resultMap])
    }

    /// Fetch a song by using its identifier.
    public var song: Song {
      get {
        return Song(unsafeResultMap: resultMap["song"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "song")
      }
    }

    public struct Song: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SongResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "SongResponse", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data included in the response for a song object request.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Song"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SongCellFragment.self),
          GraphQLFragmentSpread(SongNavigationFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var songCellFragment: SongCellFragment {
            get {
              return SongCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public var songNavigationFragment: SongNavigationFragment {
            get {
              return SongNavigationFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class MusicVideoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MusicVideo($id: String!, $storefront: String!, $language: String) {
      musicVideo(id: $id, storefront: $storefront, l: $language, include: "") {
        __typename
        data {
          __typename
          ...MusicVideoCellFragment
          ...MusicVideoNavigationFragment
        }
      }
    }
    """

  public let operationName: String = "MusicVideo"

  public var queryDocument: String { return operationDefinition.appending(MusicVideoCellFragment.fragmentDefinition).appending(MusicVideoNavigationFragment.fragmentDefinition).appending(AlbumCellFragment.fragmentDefinition).appending(ArtistCellFragment.fragmentDefinition) }

  public var id: String
  public var storefront: String
  public var language: String?

  public init(id: String, storefront: String, language: String? = nil) {
    self.id = id
    self.storefront = storefront
    self.language = language
  }

  public var variables: GraphQLMap? {
    return ["id": id, "storefront": storefront, "language": language]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("musicVideo", arguments: ["id": GraphQLVariable("id"), "storefront": GraphQLVariable("storefront"), "l": GraphQLVariable("language"), "include": ""], type: .nonNull(.object(MusicVideo.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(musicVideo: MusicVideo) {
      self.init(unsafeResultMap: ["__typename": "Query", "musicVideo": musicVideo.resultMap])
    }

    /// Fetch a music video by using its identifier.
    public var musicVideo: MusicVideo {
      get {
        return MusicVideo(unsafeResultMap: resultMap["musicVideo"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "musicVideo")
      }
    }

    public struct MusicVideo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MusicVideoResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "MusicVideoResponse", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data included in the response for a music video object request.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MusicVideo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(MusicVideoCellFragment.self),
          GraphQLFragmentSpread(MusicVideoNavigationFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var musicVideoCellFragment: MusicVideoCellFragment {
            get {
              return MusicVideoCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public var musicVideoNavigationFragment: MusicVideoNavigationFragment {
            get {
              return MusicVideoNavigationFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class ArtistQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Artist($id: String!, $storefront: String!, $language: String) {
      artist(id: $id, storefront: $storefront, l: $language, include: "") {
        __typename
        data {
          __typename
          ...ArtistCellFragment
          ...ArtistNavigationFragment
        }
      }
    }
    """

  public let operationName: String = "Artist"

  public var queryDocument: String { return operationDefinition.appending(ArtistCellFragment.fragmentDefinition).appending(ArtistNavigationFragment.fragmentDefinition).appending(AlbumCellFragment.fragmentDefinition).appending(MusicVideoCellFragment.fragmentDefinition).appending(PlaylistCellFragment.fragmentDefinition) }

  public var id: String
  public var storefront: String
  public var language: String?

  public init(id: String, storefront: String, language: String? = nil) {
    self.id = id
    self.storefront = storefront
    self.language = language
  }

  public var variables: GraphQLMap? {
    return ["id": id, "storefront": storefront, "language": language]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("artist", arguments: ["id": GraphQLVariable("id"), "storefront": GraphQLVariable("storefront"), "l": GraphQLVariable("language"), "include": ""], type: .nonNull(.object(Artist.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(artist: Artist) {
      self.init(unsafeResultMap: ["__typename": "Query", "artist": artist.resultMap])
    }

    /// Fetch an artist by using the artist's identifier.
    public var artist: Artist {
      get {
        return Artist(unsafeResultMap: resultMap["artist"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "artist")
      }
    }

    public struct Artist: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ArtistResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "ArtistResponse", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data included in the response for an artist object request.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Artist"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ArtistCellFragment.self),
          GraphQLFragmentSpread(ArtistNavigationFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var artistCellFragment: ArtistCellFragment {
            get {
              return ArtistCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public var artistNavigationFragment: ArtistNavigationFragment {
            get {
              return ArtistNavigationFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class MusicSearchQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MusicSearch($storefront: String!, $term: String, $language: String, $limit: Int, $offset: String, $types: [String!]!) {
      musicSearch(storefront: $storefront, term: $term, l: $language, limit: $limit, offset: $offset, types: $types) {
        __typename
        results {
          __typename
          playlists {
            __typename
            data {
              __typename
              id
              ...PlaylistCellFragment
              ...PlaylistNavigationFragment
              type
            }
          }
          albums {
            __typename
            data {
              __typename
              id
              ...AlbumCellFragment
              ...AlbumNavigationFragment
              type
            }
          }
          artists {
            __typename
            data {
              __typename
              id
              ...ArtistCellFragment
              ...ArtistNavigationFragment
              type
            }
          }
          songs {
            __typename
            data {
              __typename
              id
              ...SongCellFragment
              ...SongNavigationFragment
              type
            }
          }
          musicVideos {
            __typename
            data {
              __typename
              id
              ...MusicVideoCellFragment
              ...MusicVideoNavigationFragment
              type
            }
          }
        }
      }
    }
    """

  public let operationName: String = "MusicSearch"

  public var queryDocument: String { return operationDefinition.appending(PlaylistCellFragment.fragmentDefinition).appending(PlaylistNavigationFragment.fragmentDefinition).appending(SongCellFragment.fragmentDefinition).appending(MusicVideoCellFragment.fragmentDefinition).appending(AlbumCellFragment.fragmentDefinition).appending(AlbumNavigationFragment.fragmentDefinition).appending(ArtistCellFragment.fragmentDefinition).appending(ArtistNavigationFragment.fragmentDefinition).appending(SongNavigationFragment.fragmentDefinition).appending(MusicVideoNavigationFragment.fragmentDefinition) }

  public var storefront: String
  public var term: String?
  public var language: String?
  public var limit: Int?
  public var offset: String?
  public var types: [String]

  public init(storefront: String, term: String? = nil, language: String? = nil, limit: Int? = nil, offset: String? = nil, types: [String]) {
    self.storefront = storefront
    self.term = term
    self.language = language
    self.limit = limit
    self.offset = offset
    self.types = types
  }

  public var variables: GraphQLMap? {
    return ["storefront": storefront, "term": term, "language": language, "limit": limit, "offset": offset, "types": types]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("musicSearch", arguments: ["storefront": GraphQLVariable("storefront"), "term": GraphQLVariable("term"), "l": GraphQLVariable("language"), "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset"), "types": GraphQLVariable("types")], type: .nonNull(.object(MusicSearch.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(musicSearch: MusicSearch) {
      self.init(unsafeResultMap: ["__typename": "Query", "musicSearch": musicSearch.resultMap])
    }

    /// Search the catalog by using a query.
    public var musicSearch: MusicSearch {
      get {
        return MusicSearch(unsafeResultMap: resultMap["musicSearch"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "musicSearch")
      }
    }

    public struct MusicSearch: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MusicSearchResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("results", type: .nonNull(.object(Result.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(results: Result) {
        self.init(unsafeResultMap: ["__typename": "MusicSearchResponse", "results": results.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The results included in the response for a search request.
      public var results: Result {
        get {
          return Result(unsafeResultMap: resultMap["results"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "results")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MusicSearchResults"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("playlists", type: .object(Playlist.selections)),
          GraphQLField("albums", type: .object(Album.selections)),
          GraphQLField("artists", type: .object(Artist.selections)),
          GraphQLField("songs", type: .object(Song.selections)),
          GraphQLField("musicVideos", type: .object(MusicVideo.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(playlists: Playlist? = nil, albums: Album? = nil, artists: Artist? = nil, songs: Song? = nil, musicVideos: MusicVideo? = nil) {
          self.init(unsafeResultMap: ["__typename": "MusicSearchResults", "playlists": playlists.flatMap { (value: Playlist) -> ResultMap in value.resultMap }, "albums": albums.flatMap { (value: Album) -> ResultMap in value.resultMap }, "artists": artists.flatMap { (value: Artist) -> ResultMap in value.resultMap }, "songs": songs.flatMap { (value: Song) -> ResultMap in value.resultMap }, "musicVideos": musicVideos.flatMap { (value: MusicVideo) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The playlists returned for the search query.
        public var playlists: Playlist? {
          get {
            return (resultMap["playlists"] as? ResultMap).flatMap { Playlist(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "playlists")
          }
        }

        /// The albums returned for the search query.
        public var albums: Album? {
          get {
            return (resultMap["albums"] as? ResultMap).flatMap { Album(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "albums")
          }
        }

        /// The artists returned for the search query.
        public var artists: Artist? {
          get {
            return (resultMap["artists"] as? ResultMap).flatMap { Artist(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "artists")
          }
        }

        /// The songs returned for the search query.
        public var songs: Song? {
          get {
            return (resultMap["songs"] as? ResultMap).flatMap { Song(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "songs")
          }
        }

        /// The music videos returned for the search query.
        public var musicVideos: MusicVideo? {
          get {
            return (resultMap["musicVideos"] as? ResultMap).flatMap { MusicVideo(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "musicVideos")
          }
        }

        public struct Playlist: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PlaylistResponse"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(data: [Datum]) {
            self.init(unsafeResultMap: ["__typename": "PlaylistResponse", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// (Required) The data included in the response for a playlist object request.
          public var data: [Datum] {
            get {
              return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
            }
          }

          public struct Datum: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Playlist"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(PlaylistCellFragment.self),
              GraphQLFragmentSpread(PlaylistNavigationFragment.self),
              GraphQLField("type", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// (Required) This value will always be playlists.
            public var type: String {
              get {
                return resultMap["type"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var playlistCellFragment: PlaylistCellFragment {
                get {
                  return PlaylistCellFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }

              public var playlistNavigationFragment: PlaylistNavigationFragment {
                get {
                  return PlaylistNavigationFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }

        public struct Album: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["AlbumResponse"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(data: [Datum]) {
            self.init(unsafeResultMap: ["__typename": "AlbumResponse", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// (Required) The data included in the response for an album object request.
          public var data: [Datum] {
            get {
              return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
            }
          }

          public struct Datum: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Album"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(AlbumCellFragment.self),
              GraphQLFragmentSpread(AlbumNavigationFragment.self),
              GraphQLField("type", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// (Required) This value will always be albums
            public var type: String {
              get {
                return resultMap["type"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var albumCellFragment: AlbumCellFragment {
                get {
                  return AlbumCellFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }

              public var albumNavigationFragment: AlbumNavigationFragment {
                get {
                  return AlbumNavigationFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }

        public struct Artist: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ArtistResponse"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(data: [Datum]) {
            self.init(unsafeResultMap: ["__typename": "ArtistResponse", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// (Required) The data included in the response for an artist object request.
          public var data: [Datum] {
            get {
              return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
            }
          }

          public struct Datum: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Artist"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(ArtistCellFragment.self),
              GraphQLFragmentSpread(ArtistNavigationFragment.self),
              GraphQLField("type", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// (Required) This value will always be artists.
            public var type: String {
              get {
                return resultMap["type"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var artistCellFragment: ArtistCellFragment {
                get {
                  return ArtistCellFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }

              public var artistNavigationFragment: ArtistNavigationFragment {
                get {
                  return ArtistNavigationFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }

        public struct Song: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["SongResponse"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(data: [Datum]) {
            self.init(unsafeResultMap: ["__typename": "SongResponse", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// (Required) The data included in the response for a song object request.
          public var data: [Datum] {
            get {
              return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
            }
          }

          public struct Datum: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Song"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(SongCellFragment.self),
              GraphQLFragmentSpread(SongNavigationFragment.self),
              GraphQLField("type", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// (Required) This value will always be songs.
            public var type: String {
              get {
                return resultMap["type"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var songCellFragment: SongCellFragment {
                get {
                  return SongCellFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }

              public var songNavigationFragment: SongNavigationFragment {
                get {
                  return SongNavigationFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }

        public struct MusicVideo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MusicVideoResponse"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(data: [Datum]) {
            self.init(unsafeResultMap: ["__typename": "MusicVideoResponse", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// (Required) The data included in the response for a music video object request.
          public var data: [Datum] {
            get {
              return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
            }
          }

          public struct Datum: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MusicVideo"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(MusicVideoCellFragment.self),
              GraphQLFragmentSpread(MusicVideoNavigationFragment.self),
              GraphQLField("type", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// (Required) This value will always be musicVideos.
            public var type: String {
              get {
                return resultMap["type"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var musicVideoCellFragment: MusicVideoCellFragment {
                get {
                  return MusicVideoCellFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }

              public var musicVideoNavigationFragment: MusicVideoNavigationFragment {
                get {
                  return MusicVideoNavigationFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class MusicSearchHintsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MusicSearchHints($storefront: String!, $term: String, $language: String, $limit: Int, $types: [String!]!) {
      musicSearchHints(storefront: $storefront, term: $term, l: $language, limit: $limit, types: $types) {
        __typename
        results {
          __typename
          terms
        }
      }
    }
    """

  public let operationName: String = "MusicSearchHints"

  public var storefront: String
  public var term: String?
  public var language: String?
  public var limit: Int?
  public var types: [String]

  public init(storefront: String, term: String? = nil, language: String? = nil, limit: Int? = nil, types: [String]) {
    self.storefront = storefront
    self.term = term
    self.language = language
    self.limit = limit
    self.types = types
  }

  public var variables: GraphQLMap? {
    return ["storefront": storefront, "term": term, "language": language, "limit": limit, "types": types]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("musicSearchHints", arguments: ["storefront": GraphQLVariable("storefront"), "term": GraphQLVariable("term"), "l": GraphQLVariable("language"), "limit": GraphQLVariable("limit"), "types": GraphQLVariable("types")], type: .nonNull(.object(MusicSearchHint.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(musicSearchHints: MusicSearchHint) {
      self.init(unsafeResultMap: ["__typename": "Query", "musicSearchHints": musicSearchHints.resultMap])
    }

    /// Fetch the search term results for a hint.
    public var musicSearchHints: MusicSearchHint {
      get {
        return MusicSearchHint(unsafeResultMap: resultMap["musicSearchHints"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "musicSearchHints")
      }
    }

    public struct MusicSearchHint: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MusicSearchHintsResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("results", type: .nonNull(.object(Result.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(results: Result) {
        self.init(unsafeResultMap: ["__typename": "MusicSearchHintsResponse", "results": results.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The results included in the response for a search hints request.
      public var results: Result {
        get {
          return Result(unsafeResultMap: resultMap["results"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "results")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MusicSearchHints"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("terms", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(terms: [String]) {
          self.init(unsafeResultMap: ["__typename": "MusicSearchHints", "terms": terms])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// (Required) The autocomplete options derived from the search hint.
        public var terms: [String] {
          get {
            return resultMap["terms"]! as! [String]
          }
          set {
            resultMap.updateValue(newValue, forKey: "terms")
          }
        }
      }
    }
  }
}

public struct ChartFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ChartFragment on Chart {
      __typename
      chart
      name
      data {
        __typename
        ... on Song {
          ...SongCellFragment
        }
        ... on MusicVideo {
          ...MusicVideoCellFragment
        }
        ... on Playlist {
          ...PlaylistCellFragment
        }
        ... on Album {
          ...AlbumCellFragment
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Chart"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("chart", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(chart: String, name: String, data: [Datum]) {
    self.init(unsafeResultMap: ["__typename": "Chart", "chart": chart, "name": name, "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// (Required) The chart identifier.
  public var chart: String {
    get {
      return resultMap["chart"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "chart")
    }
  }

  /// (Required) The localized name for the chart.
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// (Required) An array of the requested objects, ordered by popularity. For
  /// example, if songs were specified as the chart type in the request, the array
  /// contains Song objects.
  public var data: [Datum] {
    get {
      return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
    }
  }

  public struct Datum: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Album", "Song", "MusicVideo", "Playlist"]

    public static let selections: [GraphQLSelection] = [
      GraphQLTypeCase(
        variants: ["Song": AsSong.selections, "MusicVideo": AsMusicVideo.selections, "Playlist": AsPlaylist.selections, "Album": AsAlbum.selections],
        default: [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        ]
      )
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var asSong: AsSong? {
      get {
        if !AsSong.possibleTypes.contains(__typename) { return nil }
        return AsSong(unsafeResultMap: resultMap)
      }
      set {
        guard let newValue = newValue else { return }
        resultMap = newValue.resultMap
      }
    }

    public struct AsSong: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Song"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(SongCellFragment.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var songCellFragment: SongCellFragment {
          get {
            return SongCellFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public var asMusicVideo: AsMusicVideo? {
      get {
        if !AsMusicVideo.possibleTypes.contains(__typename) { return nil }
        return AsMusicVideo(unsafeResultMap: resultMap)
      }
      set {
        guard let newValue = newValue else { return }
        resultMap = newValue.resultMap
      }
    }

    public struct AsMusicVideo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MusicVideo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(MusicVideoCellFragment.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var musicVideoCellFragment: MusicVideoCellFragment {
          get {
            return MusicVideoCellFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public var asPlaylist: AsPlaylist? {
      get {
        if !AsPlaylist.possibleTypes.contains(__typename) { return nil }
        return AsPlaylist(unsafeResultMap: resultMap)
      }
      set {
        guard let newValue = newValue else { return }
        resultMap = newValue.resultMap
      }
    }

    public struct AsPlaylist: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Playlist"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(PlaylistCellFragment.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var playlistCellFragment: PlaylistCellFragment {
          get {
            return PlaylistCellFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public var asAlbum: AsAlbum? {
      get {
        if !AsAlbum.possibleTypes.contains(__typename) { return nil }
        return AsAlbum(unsafeResultMap: resultMap)
      }
      set {
        guard let newValue = newValue else { return }
        resultMap = newValue.resultMap
      }
    }

    public struct AsAlbum: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Album"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(AlbumCellFragment.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var albumCellFragment: AlbumCellFragment {
          get {
            return AlbumCellFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct PlaylistCellFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment PlaylistCellFragment on Playlist {
      __typename
      id
      optionalAttributes: attributes {
        __typename
        name
        curatorName
        artwork {
          __typename
          url
        }
      }
      type
    }
    """

  public static let possibleTypes: [String] = ["Playlist"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(String.self))),
    GraphQLField("attributes", alias: "optionalAttributes", type: .object(OptionalAttribute.selections)),
    GraphQLField("type", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String, optionalAttributes: OptionalAttribute? = nil, type: String) {
    self.init(unsafeResultMap: ["__typename": "Playlist", "id": id, "optionalAttributes": optionalAttributes.flatMap { (value: OptionalAttribute) -> ResultMap in value.resultMap }, "type": type])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return resultMap["id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The attributes for the playlist.
  public var optionalAttributes: OptionalAttribute? {
    get {
      return (resultMap["optionalAttributes"] as? ResultMap).flatMap { OptionalAttribute(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "optionalAttributes")
    }
  }

  /// (Required) This value will always be playlists.
  public var type: String {
    get {
      return resultMap["type"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  public struct OptionalAttribute: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["PlaylistAttributes"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("curatorName", type: .scalar(String.self)),
      GraphQLField("artwork", type: .object(Artwork.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String, curatorName: String? = nil, artwork: Artwork? = nil) {
      self.init(unsafeResultMap: ["__typename": "PlaylistAttributes", "name": name, "curatorName": curatorName, "artwork": artwork.flatMap { (value: Artwork) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// (Required) The localized name of the album.
    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    /// The display name of the curator.
    public var curatorName: String? {
      get {
        return resultMap["curatorName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "curatorName")
      }
    }

    /// The playlist artwork.
    public var artwork: Artwork? {
      get {
        return (resultMap["artwork"] as? ResultMap).flatMap { Artwork(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "artwork")
      }
    }

    public struct Artwork: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Artwork"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("url", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(url: String) {
        self.init(unsafeResultMap: ["__typename": "Artwork", "url": url])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The URL to request the image asset. The image filename must be
      /// preceded by {w}x{h}, as placeholders for the width and height values as
      /// described above (for example, {w}x{h}bb.jpeg).
      public var url: String {
        get {
          return resultMap["url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "url")
        }
      }
    }
  }
}

public struct AlbumCellFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment AlbumCellFragment on Album {
      __typename
      id
      optionalAttributes: attributes {
        __typename
        name
        artistName
        genreNames
        isSingle
        trackCount
        recordLabel
        copyright
        releaseDate
        artwork {
          __typename
          url
        }
        editorialNotes {
          __typename
          short
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Album"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(String.self))),
    GraphQLField("attributes", alias: "optionalAttributes", type: .object(OptionalAttribute.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String, optionalAttributes: OptionalAttribute? = nil) {
    self.init(unsafeResultMap: ["__typename": "Album", "id": id, "optionalAttributes": optionalAttributes.flatMap { (value: OptionalAttribute) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return resultMap["id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The attributes for the album.
  public var optionalAttributes: OptionalAttribute? {
    get {
      return (resultMap["optionalAttributes"] as? ResultMap).flatMap { OptionalAttribute(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "optionalAttributes")
    }
  }

  public struct OptionalAttribute: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["AlbumAttributes"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("artistName", type: .nonNull(.scalar(String.self))),
      GraphQLField("genreNames", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
      GraphQLField("isSingle", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("trackCount", type: .nonNull(.scalar(Int.self))),
      GraphQLField("recordLabel", type: .nonNull(.scalar(String.self))),
      GraphQLField("copyright", type: .scalar(String.self)),
      GraphQLField("releaseDate", type: .scalar(String.self)),
      GraphQLField("artwork", type: .object(Artwork.selections)),
      GraphQLField("editorialNotes", type: .object(EditorialNote.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String, artistName: String, genreNames: [String], isSingle: Bool, trackCount: Int, recordLabel: String, copyright: String? = nil, releaseDate: String? = nil, artwork: Artwork? = nil, editorialNotes: EditorialNote? = nil) {
      self.init(unsafeResultMap: ["__typename": "AlbumAttributes", "name": name, "artistName": artistName, "genreNames": genreNames, "isSingle": isSingle, "trackCount": trackCount, "recordLabel": recordLabel, "copyright": copyright, "releaseDate": releaseDate, "artwork": artwork.flatMap { (value: Artwork) -> ResultMap in value.resultMap }, "editorialNotes": editorialNotes.flatMap { (value: EditorialNote) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// (Required) The localized name of the album.
    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    /// (Required) The artist’s name.
    public var artistName: String {
      get {
        return resultMap["artistName"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "artistName")
      }
    }

    /// (Required) The names of the genres associated with this album.
    public var genreNames: [String] {
      get {
        return resultMap["genreNames"]! as! [String]
      }
      set {
        resultMap.updateValue(newValue, forKey: "genreNames")
      }
    }

    /// (Required) Indicates whether the album contains a single song.
    public var isSingle: Bool {
      get {
        return resultMap["isSingle"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "isSingle")
      }
    }

    /// (Required) The number of tracks.
    public var trackCount: Int {
      get {
        return resultMap["trackCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "trackCount")
      }
    }

    /// (Required) The name of the record label for the album.
    public var recordLabel: String {
      get {
        return resultMap["recordLabel"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "recordLabel")
      }
    }

    /// The copyright text.
    public var copyright: String? {
      get {
        return resultMap["copyright"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "copyright")
      }
    }

    /// (Required) The release date of the album in YYYY-MM-DD format.
    public var releaseDate: String? {
      get {
        return resultMap["releaseDate"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "releaseDate")
      }
    }

    /// The album artwork.
    public var artwork: Artwork? {
      get {
        return (resultMap["artwork"] as? ResultMap).flatMap { Artwork(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "artwork")
      }
    }

    /// The notes about the album that appear in the iTunes Store.
    public var editorialNotes: EditorialNote? {
      get {
        return (resultMap["editorialNotes"] as? ResultMap).flatMap { EditorialNote(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "editorialNotes")
      }
    }

    public struct Artwork: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Artwork"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("url", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(url: String) {
        self.init(unsafeResultMap: ["__typename": "Artwork", "url": url])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The URL to request the image asset. The image filename must be
      /// preceded by {w}x{h}, as placeholders for the width and height values as
      /// described above (for example, {w}x{h}bb.jpeg).
      public var url: String {
        get {
          return resultMap["url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "url")
        }
      }
    }

    public struct EditorialNote: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["EditorialNotes"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("short", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(short: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "EditorialNotes", "short": short])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) Notes shown when the content is prominently displayed.
      public var short: String? {
        get {
          return resultMap["short"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "short")
        }
      }
    }
  }
}

public struct SongCellFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment SongCellFragment on Song {
      __typename
      id
      attributes {
        __typename
        name
        artistName
        durationInMillis
        releaseDate
        artwork {
          __typename
          url
        }
        previews {
          __typename
          url
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Song"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(String.self))),
    GraphQLField("attributes", type: .object(Attribute.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String, attributes: Attribute? = nil) {
    self.init(unsafeResultMap: ["__typename": "Song", "id": id, "attributes": attributes.flatMap { (value: Attribute) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return resultMap["id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The attributes for the song.
  public var attributes: Attribute? {
    get {
      return (resultMap["attributes"] as? ResultMap).flatMap { Attribute(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "attributes")
    }
  }

  public struct Attribute: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["SongAttributes"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("artistName", type: .nonNull(.scalar(String.self))),
      GraphQLField("durationInMillis", type: .scalar(Int.self)),
      GraphQLField("releaseDate", type: .scalar(String.self)),
      GraphQLField("artwork", type: .nonNull(.object(Artwork.selections))),
      GraphQLField("previews", type: .nonNull(.list(.nonNull(.object(Preview.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String, artistName: String, durationInMillis: Int? = nil, releaseDate: String? = nil, artwork: Artwork, previews: [Preview]) {
      self.init(unsafeResultMap: ["__typename": "SongAttributes", "name": name, "artistName": artistName, "durationInMillis": durationInMillis, "releaseDate": releaseDate, "artwork": artwork.resultMap, "previews": previews.map { (value: Preview) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// (Required) The localized name of the song.
    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    /// (Required) The artist’s name.
    public var artistName: String {
      get {
        return resultMap["artistName"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "artistName")
      }
    }

    /// The duration of the song in milliseconds.
    public var durationInMillis: Int? {
      get {
        return resultMap["durationInMillis"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "durationInMillis")
      }
    }

    /// (Required) The release date of the song in YYYY-MM-DD format.
    public var releaseDate: String? {
      get {
        return resultMap["releaseDate"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "releaseDate")
      }
    }

    /// (Required) The album artwork.
    public var artwork: Artwork {
      get {
        return Artwork(unsafeResultMap: resultMap["artwork"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "artwork")
      }
    }

    /// (Required) The preview assets for the song.
    public var previews: [Preview] {
      get {
        return (resultMap["previews"] as! [ResultMap]).map { (value: ResultMap) -> Preview in Preview(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Preview) -> ResultMap in value.resultMap }, forKey: "previews")
      }
    }

    public struct Artwork: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Artwork"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("url", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(url: String) {
        self.init(unsafeResultMap: ["__typename": "Artwork", "url": url])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The URL to request the image asset. The image filename must be
      /// preceded by {w}x{h}, as placeholders for the width and height values as
      /// described above (for example, {w}x{h}bb.jpeg).
      public var url: String {
        get {
          return resultMap["url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "url")
        }
      }
    }

    public struct Preview: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Preview"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("url", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(url: String) {
        self.init(unsafeResultMap: ["__typename": "Preview", "url": url])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The preview URL for the content.
      public var url: String {
        get {
          return resultMap["url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "url")
        }
      }
    }
  }
}

public struct MusicVideoCellFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment MusicVideoCellFragment on MusicVideo {
      __typename
      id
      attributes {
        __typename
        name
        artistName
        releaseDate
        artwork {
          __typename
          url
        }
        previews {
          __typename
          url
          hlsUrl
        }
      }
      type
    }
    """

  public static let possibleTypes: [String] = ["MusicVideo"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(String.self))),
    GraphQLField("attributes", type: .object(Attribute.selections)),
    GraphQLField("type", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String, attributes: Attribute? = nil, type: String) {
    self.init(unsafeResultMap: ["__typename": "MusicVideo", "id": id, "attributes": attributes.flatMap { (value: Attribute) -> ResultMap in value.resultMap }, "type": type])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return resultMap["id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The attributes for the music video.
  public var attributes: Attribute? {
    get {
      return (resultMap["attributes"] as? ResultMap).flatMap { Attribute(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "attributes")
    }
  }

  /// (Required) This value will always be musicVideos.
  public var type: String {
    get {
      return resultMap["type"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  public struct Attribute: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["MusicVideoAttributes"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("artistName", type: .nonNull(.scalar(String.self))),
      GraphQLField("releaseDate", type: .scalar(String.self)),
      GraphQLField("artwork", type: .nonNull(.object(Artwork.selections))),
      GraphQLField("previews", type: .nonNull(.list(.nonNull(.object(Preview.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String, artistName: String, releaseDate: String? = nil, artwork: Artwork, previews: [Preview]) {
      self.init(unsafeResultMap: ["__typename": "MusicVideoAttributes", "name": name, "artistName": artistName, "releaseDate": releaseDate, "artwork": artwork.resultMap, "previews": previews.map { (value: Preview) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// (Required) The localized name of the music video.
    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    /// (Required) The artist’s name.
    public var artistName: String {
      get {
        return resultMap["artistName"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "artistName")
      }
    }

    /// (Required) The release date of the music video in YYYY-MM-DD format.
    public var releaseDate: String? {
      get {
        return resultMap["releaseDate"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "releaseDate")
      }
    }

    /// (Required) The artwork for the music video’s associated album.
    public var artwork: Artwork {
      get {
        return Artwork(unsafeResultMap: resultMap["artwork"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "artwork")
      }
    }

    /// (Required) The preview assets for the music video.
    public var previews: [Preview] {
      get {
        return (resultMap["previews"] as! [ResultMap]).map { (value: ResultMap) -> Preview in Preview(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Preview) -> ResultMap in value.resultMap }, forKey: "previews")
      }
    }

    public struct Artwork: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Artwork"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("url", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(url: String) {
        self.init(unsafeResultMap: ["__typename": "Artwork", "url": url])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The URL to request the image asset. The image filename must be
      /// preceded by {w}x{h}, as placeholders for the width and height values as
      /// described above (for example, {w}x{h}bb.jpeg).
      public var url: String {
        get {
          return resultMap["url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "url")
        }
      }
    }

    public struct Preview: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Preview"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("url", type: .nonNull(.scalar(String.self))),
        GraphQLField("hlsUrl", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(url: String, hlsUrl: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Preview", "url": url, "hlsUrl": hlsUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The preview URL for the content.
      public var url: String {
        get {
          return resultMap["url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "url")
        }
      }

      /// The preview URL for the video content.
      public var hlsUrl: String? {
        get {
          return resultMap["hlsUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "hlsUrl")
        }
      }
    }
  }
}

public struct ArtistCellFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ArtistCellFragment on Artist {
      __typename
      id
      attributes {
        __typename
        name
        genreNames
      }
      type
    }
    """

  public static let possibleTypes: [String] = ["Artist"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(String.self))),
    GraphQLField("attributes", type: .object(Attribute.selections)),
    GraphQLField("type", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String, attributes: Attribute? = nil, type: String) {
    self.init(unsafeResultMap: ["__typename": "Artist", "id": id, "attributes": attributes.flatMap { (value: Attribute) -> ResultMap in value.resultMap }, "type": type])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return resultMap["id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The attributes for the artist.
  public var attributes: Attribute? {
    get {
      return (resultMap["attributes"] as? ResultMap).flatMap { Attribute(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "attributes")
    }
  }

  /// (Required) This value will always be artists.
  public var type: String {
    get {
      return resultMap["type"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  public struct Attribute: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["ArtistAttributes"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("genreNames", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String, genreNames: [String]) {
      self.init(unsafeResultMap: ["__typename": "ArtistAttributes", "name": name, "genreNames": genreNames])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// (Required) The localized name of the artist.
    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    /// (Required) The names of the genres associated with this artist.
    public var genreNames: [String] {
      get {
        return resultMap["genreNames"]! as! [String]
      }
      set {
        resultMap.updateValue(newValue, forKey: "genreNames")
      }
    }
  }
}

public struct PlaylistNavigationFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment PlaylistNavigationFragment on Playlist {
      __typename
      relationships {
        __typename
        tracks {
          __typename
          data {
            __typename
            ... on Song {
              ...SongCellFragment
            }
            ... on MusicVideo {
              ...MusicVideoCellFragment
            }
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Playlist"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("relationships", type: .object(Relationship.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(relationships: Relationship? = nil) {
    self.init(unsafeResultMap: ["__typename": "Playlist", "relationships": relationships.flatMap { (value: Relationship) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The relationships for the playlist.
  public var relationships: Relationship? {
    get {
      return (resultMap["relationships"] as? ResultMap).flatMap { Relationship(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "relationships")
    }
  }

  public struct Relationship: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["PlaylistRelationships"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("tracks", type: .object(Track.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(tracks: Track? = nil) {
      self.init(unsafeResultMap: ["__typename": "PlaylistRelationships", "tracks": tracks.flatMap { (value: Track) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The songs and music videos included in the playlist. By default, tracks includes objects.
    /// Fetch limits: 100 default, 300 maximum
    public var tracks: Track? {
      get {
        return (resultMap["tracks"] as? ResultMap).flatMap { Track(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "tracks")
      }
    }

    public struct Track: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TrackRelationship"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "TrackRelationship", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data for the track included in the relationship.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Song", "MusicVideo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLTypeCase(
            variants: ["Song": AsSong.selections, "MusicVideo": AsMusicVideo.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asSong: AsSong? {
          get {
            if !AsSong.possibleTypes.contains(__typename) { return nil }
            return AsSong(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsSong: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Song"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(SongCellFragment.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var songCellFragment: SongCellFragment {
              get {
                return SongCellFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public var asMusicVideo: AsMusicVideo? {
          get {
            if !AsMusicVideo.possibleTypes.contains(__typename) { return nil }
            return AsMusicVideo(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsMusicVideo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MusicVideo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(MusicVideoCellFragment.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var musicVideoCellFragment: MusicVideoCellFragment {
              get {
                return MusicVideoCellFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public struct AlbumNavigationFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment AlbumNavigationFragment on Album {
      __typename
      relationships {
        __typename
        tracks {
          __typename
          data {
            __typename
            ... on Song {
              ...SongCellFragment
            }
            ... on MusicVideo {
              ...MusicVideoCellFragment
            }
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Album"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("relationships", type: .object(Relationship.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(relationships: Relationship? = nil) {
    self.init(unsafeResultMap: ["__typename": "Album", "relationships": relationships.flatMap { (value: Relationship) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The relationships for the album.
  public var relationships: Relationship? {
    get {
      return (resultMap["relationships"] as? ResultMap).flatMap { Relationship(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "relationships")
    }
  }

  public struct Relationship: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["AlbumRelationships"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("tracks", type: .object(Track.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(tracks: Track? = nil) {
      self.init(unsafeResultMap: ["__typename": "AlbumRelationships", "tracks": tracks.flatMap { (value: Track) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The songs and music videos on the album. By default, tracks includes objects.
    /// Fetch limits: 300 default, 300 maximum
    public var tracks: Track? {
      get {
        return (resultMap["tracks"] as? ResultMap).flatMap { Track(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "tracks")
      }
    }

    public struct Track: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TrackRelationship"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "TrackRelationship", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data for the track included in the relationship.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Song", "MusicVideo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLTypeCase(
            variants: ["Song": AsSong.selections, "MusicVideo": AsMusicVideo.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asSong: AsSong? {
          get {
            if !AsSong.possibleTypes.contains(__typename) { return nil }
            return AsSong(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsSong: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Song"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(SongCellFragment.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var songCellFragment: SongCellFragment {
              get {
                return SongCellFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public var asMusicVideo: AsMusicVideo? {
          get {
            if !AsMusicVideo.possibleTypes.contains(__typename) { return nil }
            return AsMusicVideo(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsMusicVideo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MusicVideo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(MusicVideoCellFragment.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var musicVideoCellFragment: MusicVideoCellFragment {
              get {
                return MusicVideoCellFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public struct SongNavigationFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment SongNavigationFragment on Song {
      __typename
      relationships {
        __typename
        albums {
          __typename
          data {
            __typename
            ...AlbumCellFragment
          }
        }
        artists {
          __typename
          data {
            __typename
            ...ArtistCellFragment
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Song"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("relationships", type: .object(Relationship.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(relationships: Relationship? = nil) {
    self.init(unsafeResultMap: ["__typename": "Song", "relationships": relationships.flatMap { (value: Relationship) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The relationships for the song.
  public var relationships: Relationship? {
    get {
      return (resultMap["relationships"] as? ResultMap).flatMap { Relationship(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "relationships")
    }
  }

  public struct Relationship: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["SongRelationships"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("albums", type: .object(Album.selections)),
      GraphQLField("artists", type: .object(Artist.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(albums: Album? = nil, artists: Artist? = nil) {
      self.init(unsafeResultMap: ["__typename": "SongRelationships", "albums": albums.flatMap { (value: Album) -> ResultMap in value.resultMap }, "artists": artists.flatMap { (value: Artist) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The albums associated with the song. By default, albums includes identifiers only.
    /// Fetch limits: 10 default, 10 maximum
    public var albums: Album? {
      get {
        return (resultMap["albums"] as? ResultMap).flatMap { Album(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "albums")
      }
    }

    /// The artists associated with the song. By default, artists includes identifiers only.
    /// Fetch limits: 10 default, 10 maximum
    public var artists: Artist? {
      get {
        return (resultMap["artists"] as? ResultMap).flatMap { Artist(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "artists")
      }
    }

    public struct Album: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AlbumRelationship"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "AlbumRelationship", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data for the album included in the relationship.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Album"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(AlbumCellFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var albumCellFragment: AlbumCellFragment {
            get {
              return AlbumCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }

    public struct Artist: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ArtistRelationship"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "ArtistRelationship", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data for the artist included in the relationship.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Artist"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ArtistCellFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var artistCellFragment: ArtistCellFragment {
            get {
              return ArtistCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct MusicVideoNavigationFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment MusicVideoNavigationFragment on MusicVideo {
      __typename
      relationships {
        __typename
        albums {
          __typename
          data {
            __typename
            ...AlbumCellFragment
          }
        }
        artists {
          __typename
          data {
            __typename
            ...ArtistCellFragment
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["MusicVideo"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("relationships", type: .object(Relationship.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(relationships: Relationship? = nil) {
    self.init(unsafeResultMap: ["__typename": "MusicVideo", "relationships": relationships.flatMap { (value: Relationship) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The relationships for the music video.
  public var relationships: Relationship? {
    get {
      return (resultMap["relationships"] as? ResultMap).flatMap { Relationship(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "relationships")
    }
  }

  public struct Relationship: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["MusicVideoRelationships"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("albums", type: .object(Album.selections)),
      GraphQLField("artists", type: .object(Artist.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(albums: Album? = nil, artists: Artist? = nil) {
      self.init(unsafeResultMap: ["__typename": "MusicVideoRelationships", "albums": albums.flatMap { (value: Album) -> ResultMap in value.resultMap }, "artists": artists.flatMap { (value: Artist) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The albums associated with the music video. By default, albums includes identifiers only.
    /// Fetch limits: 10 default, 10 maximum
    public var albums: Album? {
      get {
        return (resultMap["albums"] as? ResultMap).flatMap { Album(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "albums")
      }
    }

    /// The artists associated with the music video. By default, artists includes identifiers only.
    /// Fetch limits: 10 default, 10 maximum
    public var artists: Artist? {
      get {
        return (resultMap["artists"] as? ResultMap).flatMap { Artist(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "artists")
      }
    }

    public struct Album: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AlbumRelationship"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "AlbumRelationship", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data for the album included in the relationship.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Album"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(AlbumCellFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var albumCellFragment: AlbumCellFragment {
            get {
              return AlbumCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }

    public struct Artist: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ArtistRelationship"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "ArtistRelationship", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data for the artist included in the relationship.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Artist"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ArtistCellFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var artistCellFragment: ArtistCellFragment {
            get {
              return ArtistCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct ArtistNavigationFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ArtistNavigationFragment on Artist {
      __typename
      relationships {
        __typename
        albums {
          __typename
          data {
            __typename
            ...AlbumCellFragment
          }
        }
        musicVideos {
          __typename
          data {
            __typename
            ...MusicVideoCellFragment
          }
        }
        playlists {
          __typename
          data {
            __typename
            ...PlaylistCellFragment
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Artist"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("relationships", type: .object(Relationship.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(relationships: Relationship? = nil) {
    self.init(unsafeResultMap: ["__typename": "Artist", "relationships": relationships.flatMap { (value: Relationship) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The relationships for the artist.
  public var relationships: Relationship? {
    get {
      return (resultMap["relationships"] as? ResultMap).flatMap { Relationship(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "relationships")
    }
  }

  public struct Relationship: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["ArtistRelationships"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("albums", type: .object(Album.selections)),
      GraphQLField("musicVideos", type: .object(MusicVideo.selections)),
      GraphQLField("playlists", type: .object(Playlist.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(albums: Album? = nil, musicVideos: MusicVideo? = nil, playlists: Playlist? = nil) {
      self.init(unsafeResultMap: ["__typename": "ArtistRelationships", "albums": albums.flatMap { (value: Album) -> ResultMap in value.resultMap }, "musicVideos": musicVideos.flatMap { (value: MusicVideo) -> ResultMap in value.resultMap }, "playlists": playlists.flatMap { (value: Playlist) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The albums associated with the artist. By default, albums includes identifiers only.
    /// Fetch limits: 25 default, 100 maximum
    public var albums: Album? {
      get {
        return (resultMap["albums"] as? ResultMap).flatMap { Album(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "albums")
      }
    }

    /// The music videos associated with the artist. By default, musicVideos is not included.
    /// Fetch limits: 25 default, 100 maximum
    public var musicVideos: MusicVideo? {
      get {
        return (resultMap["musicVideos"] as? ResultMap).flatMap { MusicVideo(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "musicVideos")
      }
    }

    /// The playlists associated with the artist. By default, playlists is not included.
    /// Fetch limits: 10 default, 10 maximum
    public var playlists: Playlist? {
      get {
        return (resultMap["playlists"] as? ResultMap).flatMap { Playlist(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "playlists")
      }
    }

    public struct Album: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AlbumRelationship"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "AlbumRelationship", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data for the album included in the relationship.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Album"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(AlbumCellFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var albumCellFragment: AlbumCellFragment {
            get {
              return AlbumCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }

    public struct MusicVideo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MusicVideoRelationship"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "MusicVideoRelationship", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data for the music video included in the relationship.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MusicVideo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(MusicVideoCellFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var musicVideoCellFragment: MusicVideoCellFragment {
            get {
              return MusicVideoCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }

    public struct Playlist: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PlaylistRelationship"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.list(.nonNull(.object(Datum.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(data: [Datum]) {
        self.init(unsafeResultMap: ["__typename": "PlaylistRelationship", "data": data.map { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// (Required) The data for the playlist included in the relationship.
      public var data: [Datum] {
        get {
          return (resultMap["data"] as! [ResultMap]).map { (value: ResultMap) -> Datum in Datum(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Datum) -> ResultMap in value.resultMap }, forKey: "data")
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Playlist"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PlaylistCellFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var playlistCellFragment: PlaylistCellFragment {
            get {
              return PlaylistCellFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}
