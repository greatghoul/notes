@echo off
type nul >> _build\html\.nojekyll
ghp-import.py -p _build\html\ 
