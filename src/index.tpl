<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, type=text/html" charset="UTF-8">
    <link href="/index.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <h1>Statistical problems in R</h1>
    <ul>
    {% for chal in chals %}
        <ul><a href="/challenges/{{ chal['id'] }}.html">{{ chal['title'] }}</a></ul>
    {% endfor %} 
    </ul>
</body>
</html>
