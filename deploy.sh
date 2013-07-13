#!/bin/bash 
# touch _build/html/.nojekyll
# ghp-import -p _build/html/ 
#!/bin/bash

rsync -ruv --iconv=utf-8,utf-8 _build/html/ root@g2w.me:/home/notes/
