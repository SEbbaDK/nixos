function ds
cd (subman)/data-scripts
and if [ (basename "$VIRTUAL_ENV") != data-scripts ]
if [ -d data-scripts ]
source data-scripts/bin/activate.fish
else
python3 -m venv data-scripts
and source data-scripts/bin/activate.fish
and python3 -m pip install -r requirements.txt
end
end
end
