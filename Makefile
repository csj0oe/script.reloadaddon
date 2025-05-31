VENV = ../.venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip

.PHONY: run clean

run: $(VENV)/bin/activate
	$(PYTHON) default.py

package:
	cd .. && rm -fr reload-*.zip && zip -r reload-$$(date +%s).zip script.reloadaddon -x script.reloadaddon/.git/**\* -x script.reloadaddon/.idea/**\*


$(VENV)/bin/activate: requirements.txt
	python -m venv $(VENV)
	$(PIP) install -r requirements.txt


clean:
	rm -rf __pycache__
	rm -rf $(VENV)
