#!/usr/bin/env wolframscript

inputStr=$ScriptInputString <> Import["!cat","String"]
params=ImportString[inputStr, "RawJSON"]
quotedParams = <||>
Do[
      quotedParams = Append[quotedParams, ToString[x] -> ToString[params[x]]]
   , 
   {x, Keys[params]}
];

 (* Write params assoication to a .json file *)
Export["function/params.json", quotedParams]

 (* Test for errors and return result *)
result = Get["function/preprocess_params.wls"]
If[result,
   (* Run the mathematica code *)
   Run["function/code.wls"],
   Print["Halting process..."]
]
