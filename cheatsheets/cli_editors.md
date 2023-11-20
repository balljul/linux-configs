# Command Line Editors

## Table of Contents

- [Nano](#nano)
- [Vi](#vi)
    - [Insert mode](#vi-insert)
    - [Normal mode](#vi-normal)
    - [Command mode](#vi-command)
    - [Visual mode](#vi-visual)
- [Vim](#vim)
- [NeoVim](#nvim)

<a name="nano"></a>
## Nano aka. GNU nano
Nano is a really simple text editor.  
Also Nano is always preinstalled on Unix and Unix-like operation systems.  
The only commands you really need to know to work with nano are:
- `<C-o>` `Ctrl + o` => Save the file (`<C-s>` `Ctrl + s`)
- `<C-x>` `Ctrl + x` => Close the editor (`Alt + f4`)


<a name="vi"></a>
## Vi
**Stands for Visual**
Vi is also always preinstalled on Unix and Unix-like operation systems.  
So you can always use either nano or vi on those type of systems.  

### The different modes 
![Vi Modes](data:image/png;base64,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)

As you can see there are 4 different modes in vi.  
This may seem weird at first but you will get used to it rather quickly.  

<a name="vi-insert"></a>
#### Insert mode 
The Insert mode allows you to write content to your file.  
You can enter the insert mode by pressing the `i` key.  
To escape the insert mode just press the `Esc` key.  
There isnt much more to explain about the insert mode so lets move onto the normal mode.

<a name="vi-normal"></a>
#### Normal Mode
The normal mode lets you execute actions like paste, delete, etc.  
Here are the basics:  
- `h` => Move your cursor to the left
- `l` => Move your cursor to the right
- `j` => Move your cursor down
- `k` => Move your cursor up

- `yy` => Yanks (copies) the content of the current line 
- `p` => Pastes in the copied content
- `dd` => deletes the current line
- `i` => Enter insert mode
- `:` => Enter command mode
- `v` or `V` => Enter visual code

Those are just some basics and I will go into more detail in the vim chapter.  

<a name="vi-command"></a>
#### Command mode
The command mode can be accessed by 

<a name="vi-visual"></a>
#### Visual Mode



<a name="vim"></a>
## Vim
**Stands for Vi IMproved**




<a name="nvim"></a>
## NeoVim
**Stands for new Vim**


