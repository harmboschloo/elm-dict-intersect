// @ts-check
const { range } = require("./utils");

exports.generate = n => {
  const all = range(2, n);
  const all2 = range(3, n);

  return `module Dict.Intersect.Internal exposing
    ( ${all.map(i => `fold${i}`).join(`
    , `)}
    )

import Dict exposing (Dict)



-- FOLD2 --

${generateFoldN(2)}

foldl2AutoSelect :
    (comparable -> v1 -> v2 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> acc
foldl2AutoSelect fn acc dict1 dict2 =
    if Dict.size dict1 <= Dict.size dict2 then
        fold2 Dict.foldl fn acc dict1 dict2

    else
        fold2 Dict.foldl (\\k v2 v1 acc_ -> fn k v1 v2 acc_) acc dict2 dict1


foldr2AutoSelect :
    (comparable -> v1 -> v2 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> acc
foldr2AutoSelect fn acc dict1 dict2 =
    if Dict.size dict1 <= Dict.size dict2 then
        fold2 Dict.foldr fn acc dict1 dict2

    else
        fold2 Dict.foldr (\\k v2 v1 acc_ -> fn k v1 v2 acc_) acc dict2 dict1

${all2.map(
  i => `

-- FOLD${i} --

${generateFoldN(i)}${/*generateFoldNAutoSelect(i, "foldl")*/ ""}${
    /*generateFoldNAutoSelect(i, "foldr")*/ ""
  }`
).join(`
`)}`;
};

const generateFoldN = n => {
  const values = range(1, n);

  return `
fold${n} :
    ((comparable -> v1 -> acc -> acc) -> acc -> Dict comparable v1 -> acc)
    -> (comparable -> ${values.map(v => `v${v}`).join(" -> ")} -> acc -> acc)
    -> acc
    ${values.map(v => `-> Dict comparable v${v}`).join(`
    `)}
    -> acc
fold${n} foldFn fn acc ${values.map(v => `dict${v}`).join(" ")} =
    foldFn
        (\\k v1 acc_ ->
${generateFoldNHelp(2, n)}
        )
        acc
        dict1
`;
};

const generateFoldNHelp = (i, n) => {
  const values = range(1, n);
  const pad = range(0, i - 2)
    .map(_ => "        ")
    .join("");

  return `${pad}    case Dict.get k dict${i} of
${pad}        Just v${i} ->
${
  i === n
    ? `${pad}            fn k ${values.map(v => `v${v}`).join(" ")} acc_`
    : generateFoldNHelp(i + 1, n)
}

${pad}        Nothing ->
${pad}            acc_`;
};

const generateFoldNAutoSelect = (n, foldFn) => {
  const values = range(1, n);
  const values2 = range(2, n);

  return `
${foldFn}${n}AutoSelect :
    (comparable -> ${values.map(i => `v${i}`).join(" -> ")} -> acc -> acc)
    -> acc
    ${values.map(v => `-> Dict comparable v${v}`).join(`
    `)}
    -> acc
${foldFn}${n}AutoSelect fn acc ${values.map(v => `dict${v}`).join(" ")} =
    let
        ${values.map(
          v =>
            `size${v} =
            Dict.size dict${v}`
        ).join(`

        `)}

        minSize =
            ${values.map(v => `size${v}`).join(" |> min ")}
    in
    if minSize == size1 then
        fold${n} Dict.${foldFn} fn acc ${values.map(v => `dict${v}`).join(" ")}

    else${values2.map(v2 => {
      const otherValues = values.filter(ov => ov !== v2);
      return `${v2 < n ? ` if minSize == size${v2} then` : ``}
        fold${n} Dict.${foldFn} (\\k v${v2} ${otherValues
        .map(ov => `v${ov}`)
        .join(" ")} acc_ -> fn k ${values
        .map(v => `v${v}`)
        .join(" ")} acc_) acc dict${v2} ${otherValues
        .map(ov => `dict${ov}`)
        .join(" ")}`;
    }).join(`

    else`)}
`;
};
