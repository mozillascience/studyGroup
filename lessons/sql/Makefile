lesson:
	Rscript -e "library(rmarkdown); rmarkdown::render('lesson.md')"

open:
	open lesson.html

python-notebook:
	jupyter notebook python-sql.ipynb

r-notebook:
	jupyter notebook r-sql.ipynb

requirements:
	pip install -r requirements/requirements.txt
	R --no-save < requirements/requirements.R

mtcars-init:
	sqlite3 mtcars.sqlite < mtcars-init.sql

.PHONY: lesson open requirements python-notebook r-notebook
