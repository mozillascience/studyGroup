# The following command was used to create the animals file
# A list of animals was copied from Wikipedia, then this command is run
# the list is then pasted into the terminal, followed by ctrl-D (end of file)
cat | sed -e 's/\[edit\]//' | sed -e 's/ *(list)//' > animals
