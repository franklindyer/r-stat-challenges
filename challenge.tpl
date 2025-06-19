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
    <script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML' async></script>
</head>

<body>
<div id="main-container">

    {{ content }}

    <button id="code-run-button" disabled>Run code</button>
    <div id="run-score-box"></div>
    <pre id="code-error-box"></pre>
    <div class="progress-bar" id="main-progress-bar"><div class="progress-bar-value"></div></div>
    <div id="editor-container">
        <div id="editor" style="height: 800px;">{{ skeleton }}</div>
        <div id="scoring-hint-box">
            <b>Scoring</b> <br> <hr>
            <b>Bronze:</b> {{ chal['scoring']['bronze'] }} <br>
            <b>Silver:</b> {{ chal['scoring']['silver'] }} <br>
            <b>Gold:</b> {{ chal['scoring']['gold'] }} <br>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.42.0/ace.js" type="text/javascript" charset="utf-8"></script>

    <script>
        let CHALLENGE = "{{ chal['id'] }}";
        let SCORING = {{ chal['scoring'] }};
        let CONF = {{ conf }};
    </script>

    <script type="text/javascript" src="/index.js"></script>

</div>
</body>
</html>
