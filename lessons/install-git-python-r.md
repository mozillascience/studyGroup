# Installing Git

Installation instructions for Git can be found on the
[Git download site](http://git-scm.com/book/en/Getting-Started-Installing-Git)
- On Windows: Download the `.exe` file from this
  [Github link](http://msysgit.github.io) and run it.
- On Mac: To use the graphical Git installer, download from this
  [SourceForge link](http://sourceforge.net/projects/git-osx-installer/)
- On Linux: Use your respective package manager (for example, if you
  use Ubuntu or Debian, run this code: `sudo apt-get install git`)


# Installing Python

Python can be managed through the Anaconda platform, which is [available for
Linux, macOS and Windows](https://www.anaconda.com/distribution/#download-section).
The Python3 installer is a suitable download choice for most people.

## Using Python

1. When the Anaconda installation has finished, Python is accessible by running
   `python` in a terminal (on Windows, use the `Anaconda Prompt`).
2. Anaconda also includes graphical interfaces for interacting with Python,
   which can be invoked by running `spyder` or `jupyter-lab` from the command
   line.
3. To get an introduction on how to use Python, please read the tutorial over
   at [Software
   Carpentry](https://swcarpentry.github.io/python-novice-inflammation/).

### Installing packages

After Anaconda has been installed on your system, you can use the command line
`conda` package manager or the GUI-driven `anaconda-navigator` to install
Python packages. For comprehensive instructions on both of these, refer to the
[official
documentation](https://docs.continuum.io/anaconda/#navigator-or-conda). Brief
step-by-step instructions to get up and running with `conda` follow.

1. To install a new Python package from the Anaconda repositories, simply run
   `conda install <package name>` in a terminal. You can also use the `pip`
   package manager, but it will be easier to keep track of packages by sticking
   to one installation method.
2. Some packages are not available in the default Anaconda repositories. User
   contributed packaged are available in Anaconda "channels", use `anaconda
   search -t conda <package name>`, to find a channel with the desired package.
   To install this package, use `conda install -c <channel name> <package
   name>`. The [conda forge channel](https://conda-forge.github.io/) channel
   has many of the packages not in the default repositories.

## Trying Python without installing

There are a few online services that provide solutions to run Python and Jupyter
Notebooks without installing anything. These often come with some limitations
but is a simple way to just try things out:

-   https://notebooks.ai/ Optional to create account (but necessary for saving
    progress). Most up to date version of some commonly used packages at the
    time of testing.
-   https://codeocean.com/ Account required. Sign up with institutional email
    for extra storage and run time. Flexible but requires slight setup of
    specifying which packages to install.
-   https://colab.research.google.com/notebooks/welcome.ipynb Account required.
    Google branded design.
-   https://jupyter.org/try No account required. Not possible to save progress.
    The Notebook runs fine in the classic Jupyter version, but when run from
    JupyterLab our experience is that it outputs lots of font-related warnings
    when plotting (non-critical, but annoying).

# Installing R

## Official way

If you are only or mainly using R, this method is the official and most common
way of installing R:

1. Download R from the [Comprehensive R Archive Network
   (CRAN)](https://cran.r-project.org/), which is the official source for R and
   R packages. From this page you can find R for Windows, Mac, and Linux.
   Follow the instructions and get R installed on your computer.
2. Download and install
   [RStudio](https://www.rstudio.com/products/rstudio/download/#download),
   which is the most commonly used and most powerful interface for using R.
   Since R, like most other programming languages, is just a way of
   communicating with the computer, RStudio is a way for humans to communicate
   to R. RStudio is the recommended program for using R and all our R tutorials
   use RStudio.
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

