<!doctype html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>${songs['results'][0]['collectionName']}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${request.static_url('albumapp:static/bootstrap/css/bootstrap.css')}"/>
    <link rel="stylesheet" href="${request.static_url('albumapp:static/css/flat-ui.css')}"/>
</head>
<body>
    <div class="container music">
        <div class="row mbl">
            <div class="demo-headline">
                <h2 class="demo-panel-title">${songs['results'][0]['collectionName']}</h2>
            </div>
        </div>
        <div class="row mbl">
            <div class="span4 demo-tiles">
                <div class="tile">
                    <img src="${request.static_url('albumapp:static/images/jacket/')}${album['albumId']}.jpg" alt="${songs['results'][0]['collectionName']}"/>
                    <p><a href="${songs['results'][0]['collectionViewUrl']}" target="_blank"><img src="http://ax.phobos.apple.com.edgesuite.net/images/badgeitunes61x15dark.gif" alt="iTunesリンク"/></a></p>
                </div>
            </div>
            <div class="span8">
                <p>${album['info']}</p>
            </div>
        </div>
        <div class="row" id="songs">
            <div class="span12">
                <h3 class="demo-panel-title">Songs</h3>
                <table width="100%" class="table">
                    <thead>
                    <tr>
                        <th class="index"></th>
                        <th class="name">タイトル</th>
                        <th class="ascending">試聴</th>
                        <th class="iTSlink">iTunesで見る</th>
                    </tr>
                    </thead>
                    <tbody>

                    %for song_data in songs['results'][1:]:
                        <tr class="song">
                        <td class="index"></td>
                        <td class="name">${song_data['trackName']}</td>
                        <td class="ascending">
                            <audio src="${song_data['previewUrl']}" controls="controls" preload="none">
                                <a href="${song_data['previewUrl']}" target="_blank">試聴する</a>
                            </audio>
                        </td>
                        <td class="iTSLink"><a href="${song_data['trackViewUrl']}" target="_blank">iTunesで見る</a></td>
                        </tr>
                    %endfor
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="${request.static_url('albumapp:static/js/jquery-1.8.3.min.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/jquery.ui.touch-punch.min.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/jquery-ui-1.10.3.custom.min.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/bootstrap.min.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/bootstrap.min.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/bootstrap-select.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/bootstrap-switch.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/flatui-checkbox.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/flatui-radio.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/jquery.tagsinput.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/jquery.placeholder.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/application.js')}"></script>
</body>
</html>