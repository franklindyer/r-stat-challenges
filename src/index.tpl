<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, type=text/html" charset="UTF-8">
    <link href="/index.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <h1>Parameter estimation problems in R</h1>
    <div id="problem-list-container">
    {% for chal in chals %}
        <div class="problem-container-div" id="{{ chal['id'] }}-problem-div"
            onclick="location.href='/challenges/{{ chal['id'] }}.html'">
            <a>{{ chal['title'] }}</a>
        </div>
    {% endfor %} 
    </div>
    <script type="text/javascript" src="/shared.js"></script>
</body>
</html>
