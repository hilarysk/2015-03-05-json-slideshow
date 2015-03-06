For this project, you'll be building the following:

(I've deliberated left most technology names off. But if you think about each requirement below, I bet you can figure out what language/tool we've learned that I intend for you to use.)

A database that stores information about slides:
title
body text
order
An API that reads from the database and returns JSON.
A webpage containing elements that are styled to look like a slideshow presenter.
Don't go overboard with this. Just have a main window for the slide's content (which is empty for now) and prev/next buttons. Beautiful is not required, but you can see fancy examples here.
A script that requests information from the API (from #2 above) when the prev/next buttons are clicked.
A script that modifies the contents of the webpage (from #3 above) to show the correct slide.
Some way to pre-fill the slideshow with the first slide when the page loads.
(Note: When we think "slideshow", we sometimes imagine a slideshow of images. That's not what you're building here. Think of it more like a PowerPoint presentation, where each slide has a title and some body text.)