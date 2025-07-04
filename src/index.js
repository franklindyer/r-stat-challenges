if (!(CHALLENGE in PROGRESS)) {
    PROGRESS[CHALLENGE] = {
        "badge": "none"
    };
}

import('https://webr.r-wasm.org/latest/webr.mjs').then(
  async ({ WebR }) => {
    const webR = new WebR();
    await webR.init();

    var setupCode = await fetch('framework.r').then((r) => r.text());
    var puzzleCode = await fetch(`${CHALLENGE}.r`).then((r) => r.text());
    setupCode = setupCode + puzzleCode;

    var runBtn = document.getElementById("code-run-button");
    runBtn.onclick = () => runCode(webR, setupCode);
    runBtn.disabled = false;
    
    var testBtn = document.getElementById("code-test-button");
    testBtn.onclick = () => runTest(webR, setupCode);
    testBtn.disabled = false;
    
    console.log("WebR is here!");
  }
);

var editor = ace.edit("editor");
editor.setTheme("ace/theme/monokai");
editor.renderer.setScrollMargin(3, 3);
editor.getSession().setMode("ace/mode/r");
editor.setOptions({
    maxLines: Infinity
});
if ("editor" in PROGRESS[CHALLENGE]) {
    editor.getSession().setValue(PROGRESS[CHALLENGE]["editor"]);
}

function saveEditor() {
    PROGRESS[CHALLENGE]["editor"] = editor.getValue();
    setProgress(PROGRESS);
}

function registerScore(score) {
    if (score == "gold") {
        PROGRESS[CHALLENGE]["badge"] = "gold";
    } else if (score == "silver" && PROGRESS[CHALLENGE]["badge"] !== "gold") {
        PROGRESS[CHALLENGE]["badge"] = "silver";
    } else if (score == "bronze" && !(PROGRESS[CHALLENGE]["badge"] in ["gold", "silver"])) {
        PROGRESS[CHALLENGE]["badge"] = "bronze";
    }
    setProgress(PROGRESS);
}

function handleGradeResult(grade) {
    var gradeBox = document.getElementById("run-score-box");
    gradeBox.style.display = "block";
    gradeBox.textContent = `Your most recent score: ${grade}`;

    if (grade < SCORING['gold']) {
        gradeBox.style.backgroundColor = CONF['gold-color'];
        gradeBox.classList.add("effect-shine");
        registerScore("gold");
    } else if (grade < SCORING['silver']) {
        gradeBox.style.backgroundColor = CONF['silver-color'];
        gradeBox.classList.add("effect-shine");
        registerScore("silver");
    } else if (grade < SCORING['bronze']) {
        gradeBox.style.backgroundColor = CONF['bronze-color'];
        gradeBox.classList.add("effect-shine");
        registerScore("bronze");
    } else {
        gradeBox.style.backgroundColor = CONF['default-color'];
        gradeBox.classList.remove("effect-shine");
    }
}

async function runTest(webR, setupCode) {
    saveEditor();

    var errorBox = document.getElementById("code-error-box");
    errorBox.style.display = "none";
    document.getElementById("code-test-button").disabled = true;
    
    let exBox = document.getElementById("run-example-box");
    let exParamBox = document.getElementById("run-example-parameter");
    let exObsBox = document.getElementById("run-example-observation");
    let exEstBox = document.getElementById("run-example-estimate");
    let exLossBox = document.getElementById("run-example-loss");

    var code = editor.getValue();
    let shelter = await new webR.Shelter();
    let result0 = await shelter.captureR(setupCode);

    try {
        let result1 = await shelter.captureR(code);
        let testRes = await shelter.evalR("this_tester(decision_fxn)");
        let testResJs = await testRes.toJs();
        let values = testResJs.values.map((x) => x.values);

        exParamBox.textContent = `Parameter: ${values[0]}`;
        exObsBox.textContent = `Observation: ${values[1]}`;
        exEstBox.textContent = `Your estimate: ${values[2]}`;
        exLossBox.textContent = `Loss: ${values[3]}`;
        exBox.style.display = "block";
    } catch (e) {
        errorBox.style.display = "block";
        errorBox.textContent = e.message;
    } finally {
        shelter.purge();

        document.getElementById("code-test-button").disabled = false;
    }
}

async function runCode(webR, setupCode) {
    saveEditor();

    var errorBox = document.getElementById("code-error-box");
    errorBox.style.display = "none";
    document.getElementById("code-run-button").disabled = true;
    document.getElementById("main-progress-bar").style.display = "block";
    let exBox = document.getElementById("run-example-box");
    exBox.style.display = "none";

    var code = editor.getValue();
    let shelter = await new webR.Shelter();
    shelter.captureR(setupCode);

    try {
        let result1 = await shelter.captureR(code);
        let result2 = await shelter.captureR("final_grade <- this_puzzle(decision_fxn)");
        let grade = await shelter.evalR("final_grade");
        grade = await grade.toJs();
       
        handleGradeResult(grade.values); 
    } catch (e) {
        errorBox.style.display = "block";
        errorBox.textContent = e.message;
    } finally {
        shelter.purge();

        document.getElementById("code-run-button").disabled = false;
        document.getElementById("main-progress-bar").style.display = "none";
    }
    
}
