# Installing Python

Python can be managed through the Anaconda platform, which is [available for Linux, OSX and Windows](https://www.continuum.io/downloads). The default installation includes Python. The 64bit Python3 installer is a suitable download choice for most people.

After Anaconda has been installed on your system, you can use the command line `conda` package manager or the GUI-driven `anaconda-navigator` to install Python packages. For comprehensive instructions on both of these, refer to the [official documentation](https://docs.continuum.io/anaconda/#navigator-or-conda). Brief step-by-step instructions to get up and running with `conda` follow.

## Python
1. When the Anaconda installation has finished, Python is accessible by running
   `python` in a terminal (on Windows, use the `Anaconda Prompt`).
2. Anaconda also includes graphical interfaces for interacting with Python,
   which can be invoked by running `spyder` or `jupyter-lab` from the command line.
3. To install a new python package from the Anaconda repositories, simply run `conda install <package name>` in a terminal. You can also use the `pip` package manager, but it will be easier to keep track of packages by sticking to one installation method.
4. To get an introduction on how to use Python, please read the tutorial over at [Software Carpentry](https://swcarpentry.github.io/python-novice-inflammation/).

## User submitted packages

Some packages are not available in the default Anaconda repositories. User contributed packaged are available in Anaconda "channels", use `anaconda search -t conda <package name>`, to find a channel with the desired package. To install this package, use `conda install -c <channel name> <package name>`. The [conda forge channel](https://conda-forge.github.io/) channel has many of the packages not in the default repositories, and the [bioconda](https://bioconda.github.io/) channel specifically targets bioconductor packages.

# Installing R

## Official way

If you are only or mainly using R, this method is the standard, most common, and
official way of installing R:

1. Download R from the [Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/), 
which is the official source for R and R packages. From this page you can find R
for Windows, Mac, and Linux. Follow the instructions and get R installed on your
computer.
2. Download and install [RStudio](https://www.rstudio.com/products/rstudio/download/#download),
which is the most commonly used and most powerful interface to using R. Since
R, like most other programming languages, is just a way of communicating with 
the computer, RStudio is a way for humans to communicate to R. RStudio is the 
recommended program to use when using R. All our R tutorials use RStudio.
3. Installing R packages is done within RStudio, or through the R console via
the `install.packages` command.

To get an introduction on how to use R, please read the tutorial over at
[Software Carpentry](https://swcarpentry.github.io/r-novice-inflammation/).

## Anaconda way

It is also possible to [install R via
Anaconda](https://docs.anaconda.com/anaconda/user-guide/tasks/use-r-language),
just as with Python. This is convenient if you already have Anaconda installed
or want an easy way to manage multiple R environments on the same machine.

1. R can be installed via `conda install -c r r-essentials r-base`, which
   bundles R with some of its most frequently used libraries. `-c r` specifies
   that this package will be fetched from the R-channel in the Anaconda
   repositories. After the installation completes, R can be invoked from the
   command line by typing `R`.
2. Like with Python, `jupyter-lab` can be used with R, simply launch
   the notebook and click `New >> R` (technically made possible via the
   `r-irkernel` and `r-irdisplay` packages in the `r-essentials` bundle).
   Another GUI-driven editor for R can be installed via `conda install -c
   r rstudio`, and launched by typing `rstudio` at the command prompt.
3. To install a new R package, simply type `conda install -c r <package name>`.
   All R package names are prefixed with `r-`. You can also use the standard
   `install.packages()` within R, but it will be easier to keep track of
   packages by sticking to one installation method.

