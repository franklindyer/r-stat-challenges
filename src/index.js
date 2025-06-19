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

function handleGradeResult(grade) {
    var gradeBox = document.getElementById("run-score-box");
    gradeBox.style.display = "block";
    gradeBox.textContent = `Your most recent score: ${grade}`;

    if (grade < SCORING['gold']) {
        gradeBox.style.backgroundColor = CONF['gold-color'];
        gradeBox.classList.add("effect-shine");
    } else if (grade < SCORING['silver']) {
        gradeBox.style.backgroundColor = CONF['silver-color'];
        gradeBox.classList.add("effect-shine");
    } else if (grade < SCORING['bronze']) {
        gradeBox.style.backgroundColor = CONF['bronze-color'];
        gradeBox.classList.add("effect-shine");
    } else {
        gradeBox.style.backgroundColor = CONF['default-color'];
        gradeBox.classList.remove("effect-shine");
    }
}

async function runCode(webR, setupCode) {
    var errorBox = document.getElementById("code-error-box");
    errorBox.style.display = "none";
    document.getElementById("code-run-button").disabled = true;
    document.getElementById("main-progress-bar").style.display = "block";

    var code = editor.getValue();
    let shelter = await new webR.Shelter();
    shelter.captureR(setupCode);

    try {
        let result1 = await shelter.captureR(code);
        let result2 = await shelter.captureR("final_grade <- this_puzzle(decision_fxn)");
        let grade = await shelter.evalR("final_grade");
        grade = await grade.toJs();
       
        console.log(result2);
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
