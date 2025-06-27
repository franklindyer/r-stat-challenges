<html>
<head>
    <meta charset='utf-8' />
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

</head>
<body>
    <h1>{{ chal['title'] }}</h1>
    <h2 class="challenge-page-subtitle">{{ chal['subtitle'] }}</h2>
    <hr>

    {{ content }}

    <button id="code-run-button" disabled>Score my answer</button>
    <button id="code-test-button" disabled>Run a test</button>
    <div id="run-score-box" class="result-box"></div>
    <div id="run-example-box">
        <div class="run-example-subbox result-box" id="run-example-parameter"></div>
        <div class="run-example-subbox result-box" id="run-example-observation"></div>
        <div class="run-example-subbox result-box" id="run-example-estimate"></div>
        <div class="run-example-subbox result-box" id="run-example-loss"></div>
    </div>
    <pre id="code-error-box"></pre>
    <div class="progress-bar" id="main-progress-bar"><div class="progress-bar-value"></div></div>
    <div>
        <div id="editor" style="height: 800px;">{{ skeleton }}</div>
        <div id="scoring-hint-box">
            Scoring <hr> 
            <b>Bronze:</b> {{ chal['scoring']['bronze'] }} <br>
            <b>Silver:</b> {{ chal['scoring']['silver'] }} <br>
            <b>Gold:</b> {{ chal['scoring']['gold'] }}
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.42.0/ace.js" type="text/javascript" charset="utf-8"></script>
    <script>
        let CONF = {{ conf }};
        let CHALLENGE = "{{ chal['id'] }}";
        let SCORING = {{ chal['scoring'] }};
    </script>
    <script type="text/javascript" src="/shared.js"></script>
    <script type="text/javascript" src="/index.js"></script>

</body>
</html>
