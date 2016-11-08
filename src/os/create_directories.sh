#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_directories() {

    declare -a DIRECTORIES=(
        "$HOME/R/library"
	
	"$HOME/Documents/private"
	"$HOME/Documents/private/pk"
	"$HOME/Documents/private/documents"
	"$HOME/Documents/private/documents/scanned"
	"$HOME/Documents/private/applications"
	"$HOME/Documents/private/applications/photo"
	"$HOME/Documents/private/cv"
	"$HOME/Documents/private/freelance"
	"$HOME/Documents/private/credentials"
	"$HOME/Documents/private/taxes"
	"$HOME/Documents/private/business_card"
	"$HOME/Documents/private/car"
	"$HOME/Documents/private/other"

	"$HOME/Documents/other"
	"$HOME/Documents/other/backup_scripts"
	"$HOME/Documents/other/credentials"
	"$HOME/Documents/other/software"
	"$HOME/Documents/other/software/rpackages"
	"$HOME/Documents/other/software/shell"
	"$HOME/Documents/other/software/psql"
	"$HOME/Documents/other/edild.github.com"
	"$HOME/Documents/other/projects"

	"$HOME/Documents/work"
	"$HOME/Documents/work/teaching"
	"$HOME/Documents/work/teaching/old_teaching"
	"$HOME/Documents/work/teaching/courses"
	"$HOME/Documents/work/teaching/theses"
	"$HOME/Documents/work/research"
	"$HOME/Documents/work/research/projects"
	"$HOME/Documents/work/research/old_projects"
	"$HOME/Documents/work/research/data"
	"$HOME/Documents/work/research/reviews"
	"$HOME/Documents/work/research/reprints"

	"$HOME/Documents/work/other"
	"$HOME/Documents/work/other/templates"

    )

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${DIRECTORIES[@]}"; do
        mkd "$i"
    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_info "Create directories"
    create_directories
}

main
