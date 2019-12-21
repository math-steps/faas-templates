# faas-templates

- This is a repository for faas-templates that enable users to create functions that solve
a particular problem.

- The functions are then wrapped neatly into rest apis templates using openfaas. 

## How to build new functions

1. Create and change into a new folder

1. Clone the templates with: 
`faas template pull https://github.com/math-recon/faas-templates.git`

1. Create a new function with: 

    faas new --lang mathematica `<function-name>`

1. Change `<function-name>`.yml to stack.yml

1. Change `<function-name>` folder to function/
 
1.  add the following files in the `function folder`
 
    - `preprocess_params.wls` (put code to process parameters here)

        ```mathematica
        #!/usr/bin/env wolframscript -fun

        params = Import["function/params.json", "RawJSON"]
        expectedParams = <| 1 -> "n"|>
        errors = <||>
        catch[
            Do[
                If[Not[KeyExistsQ[params, expectedParams[x]]],
                    errors = Append[errors, "missing " <> ToString[x] -> ToString[x] <> " is expected as a parameter"]
                ]
            , 
                {x, Keys[expectedParams]}
            ]
        ]
        If[errors == <||>,
        (* Run code *)
            True,
        (* Print errors *)
        Print[ExportString[errors, "RawJSON"]]
            False
        ]
        ```
    - `code.wls` (Put your code logic here)
    
1. Check the template builds with `faas build`
