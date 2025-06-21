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
    <script>
        let CONF = {{ conf }};
        console.log(PROGRESS);
        for (var chal in PROGRESS) {
            console.log(chal);
            var d = document.getElementById(`${chal}-problem-div`);
            var badge = PROGRESS[chal]["badge"];
            if (badge !== undefined && badge !== "none") {
                var color = CONF[`${badge}-color`];
                var badgeEl = document.createElement("div");
                badgeEl.classList.add("homepage-badge");
                badgeEl.classList.add("effect-shine");
                badgeEl.style.backgroundColor = color;
                d.appendChild(badgeEl);
            }
        }
    </script>
</body>
</html>
