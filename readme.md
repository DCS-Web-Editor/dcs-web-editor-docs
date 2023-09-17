# DCS Web Editor User Manual

Github pages built using Jekyll for easy markdown content creation.

## How to add to or modify the manual

Install Jekyll: https://jekyllrb.com/docs/

The Sections folder contains the .md files, and every .md file contains the main content of the site. Modify the .md files (in markdown format) to change the content.

If you add new sections, you'll need to link them in the _layouts > default.html in the same style as the existing relative urls.

After making changes, run `jekyll build` in the root folder.