#!/usr/bin/env python
# -*- coding: utf-8 -*-

import urllib2
import json

class LookingupiTS(object):
    """
    iTunes Store Search APIを使用して、該当するiTunes IDの
    アルバム内容（曲を含む）を取得する
    """

    def __init__(self):
        self.__URL = "https://itunes.apple.com/lookup?id="
        self.__ENTITY = '&entity='
        self.__LANG = '&lang='
        self.__COUNTRY = '&country='


    def lookup(self, iTunesID, country='JP', entity='song', lang='ja_jp'):
        """
        iTunes Store APIのlookupを呼び出す
        :param iTunesID: lookupしたいID
        :param country: iTunes Storeの国指定
        :param entity: 検索したい情報
        :param lang: 応答結果の国別表示
        :return:
        """

        try:
            # URLを組み立てて、JSONを問い合わせ
            url = self.__URL + iTunesID + self.__ENTITY + entity + self.__LANG + lang + self.__COUNTRY + country
            httpres = urllib2.urlopen(url)
            jsonres = json.load(httpres)

            return jsonres
        except urllib2.HTTPError, e:
            print(e.reason)
        except urllib2.URLError, e:
            print(e.reason)


if __name__ == '__main__':
    its = LookingupiTS()
