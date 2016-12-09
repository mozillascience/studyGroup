# https://irkernel.github.io/installation/

install.packages(
    c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'),
    repo='http://cran.utstat.utoronto.ca/'
)
devtools::install_github('IRkernel/IRkernel')
IRkernel::installspec()

install.packages(c('RSQLite', 'sqldf'), repo='http://cran.utstat.utoronto.ca/')
