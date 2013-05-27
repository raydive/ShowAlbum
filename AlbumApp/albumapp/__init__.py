# -*- coding: utf-8 -*-

from pyramid.config import Configurator
from pyramid.events import subscriber
from pyramid.renderers import JSON
from pyramid.events import NewRequest
import pymongo

def main(global_config, **settings):
    """ This function returns a WSGI application.
    """
    config = Configurator(settings=settings)
    config.add_renderer('utf8_json', JSON(ensure_ascii=False))
    add_view(config)

    # MongoDB
    def add_mongo_db(event):
        settings = event.request.registry.settings
        url = settings['mongodb.url']
        db_name = settings['mongodb.db_name']
        db = settings['mongodb_conn'][db_name]
        event.request.db = db

    db_uri = settings['mongodb.url']
    MongoDB = pymongo.Connection
    if 'pyramid_debugtoolbar' in set(settings.values()):
        class MongoDB(pymongo.Connection):
            def __html__(self):
                return 'MongoDB: <b>{}></b>'.format(self)

    conn = MongoDB(db_uri)
    config.registry.settings['mongodb_conn'] = conn
    config.add_subscriber(add_mongo_db, NewRequest)
    config.scan('albumapp')
    return config.make_wsgi_app()


def add_view(config):
    """
    URLのルーティングとViewの結びつけを行う
    :param config: 設定
    """
    config.add_route('home', '/')
    config.add_view('albumapp.views.home_view',
                    route_name='home',
                    renderer='albumapp:templates/albumshow.mak')
    config.add_route('album_detail', '/album/{albumId}')
    config.add_view('albumapp.views.detail_view',
                    route_name='album_detail',
                    renderer='albumapp:templates/albumdetail.mak')

    config.add_route('artist_json', '/artist/{artistId}')
    config.add_view('albumapp.views.artist_view',
                    route_name='artist_json',
                    renderer='utf8_json')

    config.add_static_view('static', 'albumapp:static')