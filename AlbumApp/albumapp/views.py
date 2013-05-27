# -*- coding: utf-8 -*-

import iTunesSearchWrapper

def home_view(request):
    """
    アルバム一覧表示
    :param request:
    :return:
    """
    album_data = request.db['sukima_album'].find()

    albums = [{ u'collectionId' : d[u'collectionId'],
              u'collectionName' : d[u'collectionName'],
              u'collectionPrice' : d[u'collectionPrice'],
              u'artistId' : d[u'artistId'] } for d in album_data]
    artis_data = request.db['sukima_artist'].find()
    artists = [{ u'artistId' : d[u'artistId'],
                 u'artistName' : d[u'artistName'] } for d in artis_data]

    response_data = { u'album_data' : albums , u'artist_data' : artists }

    return response_data

def artist_view(request):
    """
    アーティスト情報をJSONで取得する
    TODO: AngularJSなどのクライアントMVCフレームワークで使用するために実装する

    :param request:
    :return: アーティスト情報(json)をレスポンスとする
    """
    artistId = request.matchdict['artistId']
    artist_data = request.db['sukima_album'].find({ u'artistId' : int(artistId) })
    data = [{ u'collectionId' : d[u'collectionId'],
              u'collectionName' : d[u'collectionName'],
              u'collectionPrice' : d[u'collectionPrice'],
              u'artistId' : d[u'artistId'] } for d in artist_data]
    response_data = { u'artist_data' : data, u'size' : len(data) }

    return response_data

def detail_view(request):
    '''
    アルバム詳細表示
    :param request: リクエスト（albumIdでアルバムを指定）
    :return: 指定されたアルバムの情報と曲情報をレスポンスとする
    '''
    albumId = request.matchdict['albumId']
    album_detail_data = request.db['sukima_album_detail'].find({ u'albumId' : int(albumId) })

    its_api = iTunesSearchWrapper.LookingupiTS()
    song_data = its_api.lookup(iTunesID=albumId)

    # アルバム情報とiTunes Search APIから取ってきた値をレスポンスに設定
    album_data = [{ u'albumId' : d[u'albumId'], u'info' : d[u'info'] } for d in album_detail_data ].pop()
    response_data = dict(album=album_data, songs=song_data)
    response_data['albumId'] = albumId

    return response_data
