# DCS Web Editor User Manual

Github pages built using Jekyll for easy markdown content creation.

## How to add to or modify the manual  

### Prerequisites:
 - Install Git: https://git-scm.com/
 - Install Jekyll: https://jekyllrb.com/docs/installation/

You can run a localhost server with live reloading using Jekyll and Git Bash.

Create a Fork of the repository.

### Making changes

Before you make any meaningful changes, navigate to `_layouts > default.html` and COMMENT OUT `<base href="https://dcs-web-editor.github.io/dcs-web-editor-docs/">`, if you don't do this the LOCAL SERVER WILL NOT WORK.

Open a Git Bash terminal in the root of your repository folder and run `Jekyll serve --livereload`. Open the browser of your choice and navigate to `localhost:4000`.

You should now be set up to edit to your heart's content.

### Structure

Any HTML changes need to be done in `_layouts > default.html`.

The CSS file is in `assets > css > style.css`.

The Sections folder contains the .md files, and every .md file contains the main content of the site. Modify the .md files (in [markdown](https://www.markdownguide.org/basic-syntax/) format) to change the content.

If you add new sections, you'll need to link them in the _layouts > default.html in the same style as the existing relative urls.

### Build

After making changes, go back to `_layouts > default.html` and UNCOMMENT `<base href="https://dcs-web-editor.github.io/dcs-web-editor-docs/">`.

Stop your server in git bash using Ctrl + C.

Using git bash, run `jekyll build` in the root folder.

Celebrate.