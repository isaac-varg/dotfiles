---
categories:
- "[[dotfiles]]"
content:
- "[[Neovim]]"
- "[[language servers]]"
---
These are some steps I had to take to get the qmlls language server working with my neovim, which I use LazyNvim. 

This is all already reflected in my dotfiles, but I wanted to note it here in case something went wrong on future systems.

--- 

```bash
sudo pacman -S unixodbc
```
 - I had a missing shared dependency making qmlls not work so this is how I installed it

```bash
ls /usr/lib/qt6/qml
```
- I had to make sure that the qmlls knew where my actual Qt/QML modules where located so they could be properly pointed to in my 
- this is how i verified where they where
