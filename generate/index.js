// @ts-check

const path = require("path");
const fs = require("fs");
const internal = require("./internal");
const { range } = require("./utils");

const n = 8;
const outputPath = path.resolve(__dirname, "../src");

writeFile(`Dict/Intersect/Internal.elm`, internal.generate(n));

function writeFile(file, code) {
  const filePath = path.resolve(outputPath, file);

  fs.writeFile(filePath, code, error => {
    if (error) {
      console.error(error);
    } else {
      console.log(`Generated ${filePath}`);
    }
  });
}
