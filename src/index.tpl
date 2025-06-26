<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, type=text/html" charset="UTF-8">
    <link href="/index.css" type="text/css" rel="stylesheet" />
    <script type="text/x-mathjax-config">
    MathJax.Hub.Config({
        tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]},
        processEscapes: true,
        menuSettings: { inTabOrder: false },
        "AssistiveMML": {
            disabled: false,
            styles: {
                 ".MJX_Assistive_MathML": {
                    position:"absolute!important",
                    clip: (MathJax.Hub.Browser.isMSIE && (document.documentMode||0) < 8 ?
                        "rect(1px 1px 1px 1px)" : "rect(1px, 1px, 1px, 1px)"),
                    padding: "1px 0 0 0!important",
                    border: "0!important",
                    height: "1px!important",
                    width: "1px!important",
                    overflow: "hidden!important",
                    display:"block!important"
                }
            }
        }
    });
    </script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTM
L' async></script>
</head>
<body>
    <h1>Parameter estimation problems in R</h1>
    {{ content }}
    <div id="problem-list-container">
    {% for chal in chals %}
        <div class="problem-container-div" id="{{ chal['id'] }}-problem-div"
            onclick="location.href='/challenges/{{ chal['id'] }}.html'">
            <a><a>{{ chal['difficulty'] }}</a> &nbsp; {{ chal['title'] }}</a>
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
