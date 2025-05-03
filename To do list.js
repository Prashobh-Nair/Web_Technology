function addTask() {
    let taskInput = document.getElementById("taskInput");
    let taskText = taskInput.value.trim();
    if (taskText === "") return;

    let li = document.createElement("li");
    li.textContent = taskText;
    li.onclick = function () {
        this.remove();
    };

    document.getElementById("taskList").appendChild(li);
    taskInput.value = "";
}
