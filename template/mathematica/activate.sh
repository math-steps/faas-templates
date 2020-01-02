#!/bin/bash
echo "Activating wolfram engine...."
sudo wolframscript -activate -username <USERNAME> -password <PASSWORD>
sudo wolframscript -activate
sudo wolframscript -code Print["wolfram engine successfully_activated..."]