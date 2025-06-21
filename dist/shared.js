function getProgress() {
    var progress = localStorage.getItem("progress");
    if (progress == null || progress.length == 0) {
        progress = {};
    } else {
        progress = JSON.parse(progress);
    }
    return progress;
}

function setProgress(progress) {
    localStorage.setItem("progress", JSON.stringify(progress));
}

let PROGRESS = getProgress();
