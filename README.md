# faas-templates

- This is a repository for faas-templates that enable users to create functions that solve
a particular problem.

- The functions are then wrapped neatly into rest apis templates using openfaas. 

## How to build new functions

1. Create and change into a new folder

2. Clone the templates with: 
`faas template pull https://github.com/superuser-chi/faas-templates.git`

3. Create a new function with: 

    faas new --lang mathematica `<function-name>`

4. Change `<function-name>`.yml to stack.yml

5. Change `<function-name>` folder to function/
 
6. Check the template builds with `faas build`
