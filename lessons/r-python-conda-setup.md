# Installing Python and R
Both Python and R can be managed through the Anaconda platform, which is [available for Linux, OSX and Windows](https://www.continuum.io/downloads). The default installation includes Python, and R can easily be installed later. The 64bit Python3 installer is a suitable download choice for most people.

After Anaconda has been installed on your system, you can use the command line `conda` package manager or the GUI-driven `anaconda-navigator` to install Python packages, R, and R libraries. For comprehensive instructions on both of these, refer to the [official documentation](https://docs.continuum.io/anaconda/#navigator-or-conda). Brief step-by-step instructions to get up and running with `conda` follow.

## Python
1. When the Anaconda installation has finished, Python is accessible by running `python` in a terminal (on Windows, you might have to run the Anaconda specific command prompt to access Python).
2. Anaconda also includes graphical interfaces for interacting with Python, which can be invoked by running `spyder` or `jupyter-notebook` from the command line.
3. To install a new python package from the Anaconda repositories, simply run `conda install <package name>` in a terminal. You can also use the `pip` package manager, but it will be easier to keep track of packages by sticking to one installation method.
4. To get an introduction on how to use Python, please read the tutorial over at [Software Carpentry](https://swcarpentry.github.io/python-novice-inflammation/).

## R
1. R can be installed via `conda install -c r r-essentials`, which bundles R with some of its most frequently used libraries (for a minimal R setup, substitute `r` or `r-base` for `r-essentials`). `-c r` specifies that this package will be fetched from the R-channel in the Anaconda repositories. After the installation completes, R can be invoked from the command line by typing `R`.
2. Like with Python, the `jupyter-notebook` can be used with R, simply launch the notebook and click `New >> R` (technically made possible via the `r-irkernel` and `r-irdisplay` packages in the `r-essentials` bundle). Another GUI-driven editor for R can be installed via `conda install -c r rstudio`, and launched by typing `rstudio` at the command prompt.
3. To install a new R package, simply type `conda install -c r <package name>`. All R package names are prefixed with `r-`. You can also use the standard `install.packages()` within R, but it will be easier to keep track of packages by sticking to one installation method.
4. To get an introduction on how to use R, please read the tutorial over at [Software Carpentry](https://swcarpentry.github.io/r-novice-inflammation/).

## User submitted packages
Some packages are not available in the default Anaconda repositories, e.g. the bioconductor packages for R. User contributed packaged are available in Anaconda "channels" (as with R above), use `anaconda search -t conda <package name>`, to find a channel with the desired package. To install this package, use `conda install -c <channel name> <package name>`. The [conda forge channel](https://conda-forge.github.io/) channel has many of the packages not in the default repositories, and the [bioconda](https://bioconda.github.io/) channel specifically targets bioconductor packages.
