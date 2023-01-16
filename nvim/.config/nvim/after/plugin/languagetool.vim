let g:languagetool_jar='$HOME/LanguageTool/LanguageTool-5.9/languagetool-commandline.jar'
let g:languagetool_enable_rules='PASSIVE_VOICE'

nmap <F9> :LanguageToolCheck<CR>
vmap <F9> :LanguageToolCheck<CR>
nmap <F8> :LanguageToolClear<CR>

" For latex integration see vimtex config file: ~/.config/nvim/after/plugin/vimtex.vim
