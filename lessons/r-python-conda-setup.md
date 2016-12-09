# Installing Python and R
Both Python and R can be managed through the Anaconda platform, which is [available for Linux, OSX and Windows](https://www.continuum.io/downloads). The default installation includes Python, and R can easily be installed later. The 64bit Python3 installer is a suitable download choice for most people.

After Anaconda has been installed on your system, you can use the command line `conda` package manager or the GUI-driven `anaconda-navigator` to install Python packages, R, and R libraries. For comprehensive instructions on both of these, refer to the [official documentation](https://docs.continuum.io/anaconda/#navigator-or-conda). Brief step-by-step instructions to get up and running follow.

## Python
1. When the Anaconda installation has finished, Python is accessible by running `python` in a terminal (on Windows, you might have to run the Anaconda specific command prompt to access Python).
2. Anaconda also includes graphical interfaces for interacting with Python, which can be invoked by running `spyder` or `jupyter-notebook` from the command line.
3. To install a new python package from the Anaconda repositories, simply type `conda install <package name>`.
4. To get an introduction to how to use Python, please read the tutorial over at [Software Carpentry](http://swcarpentry.github.io/python-novice-inflammation/).

## R
1. R (and its most frequently used libraries) can be installed via `conda install -c r r-base r-essentials`. In contrast to Python, you here need to specify the R-channel (`-c r`). After this, R can be invoked from the command line by typing `R`.
2. Like with Python, `jupyter-notebook` can be used with R, simply launch the notebook and click `New >> R`. A good IDE for R is `rstudio`, which can be installed via `conda install -c r rstudio`.
3. To install a new R package, simply type `conda install -c r <package name>`. You can also use the standard `install.packages()` within R, if a package is not available in the Anaconda repositories.
4. To get an introduction to how to use R, please read the tutorial over at [Software Carpentry](http://swcarpentry.github.io/r-novice-inflammation/).

## User submitted packages
All packages might not be available in the default Anaconda repositories, e.g. the bioconductor packages for R. To search among user contributed packages, use `anaconda search -t conda <package name>`. To install the package you want, use `conda install -c <channel name> <package name>`. The [conda forge channel](https://conda-forge.github.io/) user has many of the packages not in the default repositories.
