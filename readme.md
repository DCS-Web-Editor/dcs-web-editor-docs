# DCS Web Editor User Manual

Github pages built using [MkDocs](https://squidfunk.github.io/mkdocs-material/) for easy markdown content creation.

## How to add to or modify the manual  

### Prerequisites:
 - Install Git: https://git-scm.com/
 - Install MkDocs: https://squidfunk.github.io/mkdocs-material/getting-started/

You can run a localhost server with live reloading using MkDocs and Git Bash.

Create a fork or clone of the repository.

### Making changes

Open a Git Bash terminal in the root of your repository folder and run `mkdocs serve`. Open the browser of your choice and navigate to `localhost:8000`.

You should now be set up to edit to your heart's content.

### Structure

The docs/sections/ folder contains the .md files, and every .md file contains the main content of the site. Modify the .md files (in [markdown](https://www.markdownguide.org/basic-syntax/) format) to change the content.

If you add new sections, you'll need to also add them in the `mkdocs.yml` in the same style as the existing structure.

### Contribute

Create a Pull Request.

Celebrate.
