# Neovim

Shortcuts overview for VSCode and NeoVim

## Vim movements

### Moving between windows
(Neovim and VSCode)
* `<leader>h`: Move to window on the left
* `<leader>l`: Move to window on the right
* `<leader>j`: Move to window on the bottom
* `<leader>k`: Move to window on the top

## Spliting Screen
(Neovim & VSCode)
* `<leader>v`: Split the window vertically
* `<leader>s`: Split the window horizontally

## Tab Navigation
(VSCode only)
* `<S-j>` : previous tab
* `<S-k>` : next tab

## Terminal
(Neovim (TODO add to VSCode))
* `<C-t>`: Switch terminal

* `<C-\><C-n>` : exit insert mode in terminal
* `<esc>` : exit insert mode in terminal (in toggle term plugin)
* `<i>` : insert mode in terminal

### Comment out code

## Rename all same words in the file
(Neovim only)
* `<leader>r` Rename all same words in the file

### Save, Close and Save&Close


### Open Terminal
* toggle terminal

### Open FileTree
* `<C-n>` (Neovim and VSCode)

### Open Search File
* `<leader>ff` open search file (neovim only)
* `<leader>fg` open search grep (neovim only)

## Fugitive Plugin (Neovim only)
* `<leader>gs` show git status in separate Fugitive window

  ### In Ove window
  * `dd` GviffSplit vertical split
  * `dv` GdiffSplit custom mapping setup by the user (vertical split by default)
  * `dp` Git diff on the file under the cursor. (inline)
  * `ds` `dh` GhdiffSplit on the file under the cursor (horizontal window split)
  * `dq` Cloas all but one diff buffer

  ### Working with Staging Unstaging
  * `s` stage add
  * `-` Stage or Unstage
  * `U` Unstage everything
  * `X` Discard the change under the cursoe (Checkout file)
  *  `=` Toggle Show/Hide roll out the diff inline of file under cursor.
  *  `<` `>` Show / Hide roll out of the diff inlie of file under cursor.
  * `<leader>p` push
  * `<cc> commit


  ### Working with Diffs
  * (dv) `Gvdiff origin/master` see the diff comparing to another branch
  * `[c` / `]c` go to previous / next change
  * `= Enter` in visual mode, format line, or selection
  * `[d` go to next error
  * `]d` go to previous error

## LSP
* `<leader>ca` code Action (Neovim and VSCode)
* `<leader>f` format file
* `gh` hover to see definition (VSCode only)
* `<leader>vrn` rename (Neovim only)

## Usefull tricks
* `Vyp` copy and paste the line. Duplicate line.
* `:s/oldWord/newWord/g` replace all same words with another one in a line
* `:e filename` create a new file - it will open a new buffer. Saving that buffer is needed.
*  `=ap` nice format
* `:so` source, it executes the vim script from the specific file. It will show us also the errors.

## Commentary
* `gcc` to comment out a line
* `gc` to commenta out in visual mode, ot with combination like `gcap` comment out a paragraph

## C# files
* `<C-i>` dotnet run

## Editor Settings
* `:nu` numbers, run to have line numbers
* `:rnu` relative numbers,

## NerdTree
* `<leader>nf` find active file in nerdtree
* `cd` in nerd tree node - change cd for telescope etc, not working with toggleterminal yet
