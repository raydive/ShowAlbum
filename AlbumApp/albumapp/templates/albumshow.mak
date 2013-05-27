<!doctype html>
<html lang="jp">
<head>
    <meta charset="UTF-8">
    <title>Soundworks-nana Album List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${request.static_url('albumapp:static/bootstrap/css/bootstrap.css')}"/>
    <link rel="stylesheet" href="${request.static_url('albumapp:static/css/flat-ui.css')}"/>
    <link rel="stylesheet" href="${request.static_url('albumapp:static/css/colorbox.css')}"/>
    <link rel="stylesheet" href="${request.static_url('albumapp:static/css/app.css')}"/>
</head>
<body>
    <!-- コンテンツ表示 -->
    <div class="container contents mtl">
        <div class="row demo-row">
        <div class="demo-headline">
            <div class="demo-logo">
                <h1>Soundworks-nana Album List</h1>
            </div>
        </div>
        </div>
        <div class="row demo-row">
            <div class="span2">
                <aside id="side_menu">
                    <ul class="fui-list unstyled">
                        %for artist in artist_data:
                        <li>
                            <a id="${artist['artistId']}" class="artist" href="#">${artist['artistName']}</a>
                        </li>
                        %endfor
                    </ul>
                </aside>
            </div>
            <div class="span10">
                <article id="album_view" class="demo-tiles row">
                    %for album in album_data:
                        <div class="album span2 tile ${album['artistId']}" id="${album['collectionId']}">
                            <img src="${request.static_url('albumapp:static/images/jacket/')}${album['collectionId']}.jpg" alt="${album['collectionName']}"/>
                            <a class="album" href="/album/${album['collectionId']}"><p class="tile-title">${album['collectionName']}</p></a>
                        </div>
                    %endfor
                </article>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="${request.static_url('albumapp:static/js/jquery-1.8.3.min.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/jquery.colorbox-min.js')}"></script>
    <script type="text/javascript" src="${request.static_url('albumapp:static/js/jquery.masonry.min.js')}"></script>
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
    <script type="text/javascript">
        $(document).ready(function() {
            $('#album_view').masonry({ itemSelector:'div.album', columnWidth:50, columnHeight: 250});
            $('a.album').colorbox({iframe:true, width:"100%", height:"80%"});
            $('a.artist').click(function() {
                var artist = $(this).attr('id');
                $('div.album').hide(1000);
                $('div.album.'+artist).show(1000);
            });
        });
    </script>
</body>
</html>

