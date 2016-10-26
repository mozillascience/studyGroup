lesson:
	Rscript -e "library(rmarkdown); rmarkdown::render('lesson.md')"

slides:
	Rscript -e "library(rmarkdown); rmarkdown::render('slides.Rmd')"

open:
	open lesson.html

jupyter:
	jupyter notebook

requirements:
	R --no-save < requirements/requirements.R
	pip install -r requirements/requirements.txt

.PHONY: lesson slides open jupyter requirements
