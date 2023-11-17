const robot = require("robotjs");
const removedEmojis = process.argv[2]
  .replaceAll(":apple:", "")
  .replaceAll(":pear:", "")
  .split("\n");
const lines = removedEmojis.map((line) =>
  line.replace(/^\s+/, "").replace("  ", " ")
);
console.log(lines);
function typeLine(line) {
  robot.typeString(line);
  robot.keyTap("enter");
}

function startTyping() {
  lines.forEach((line, index) => {
    setTimeout(() => {
      typeLine(line);
    }, 100 * index);
  });
}

setTimeout(() => {
  startTyping();
}, 3000);
