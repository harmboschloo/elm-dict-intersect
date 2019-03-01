// @ts-check

exports.range = (start, end) =>
  Array(end - start + 1)
    .fill(0)
    .map((_, index) => start + index);
