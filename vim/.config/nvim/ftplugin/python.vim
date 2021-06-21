setlocal colorcolumn=80
setlocal path=.,**
setlocal wildignore=*/__pycache__/*,*.pyc " ce sa fie ignorat in path

set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)

function! PyInclude(fname)
    let parts = split(a:fname, ' import ')
    let l = parts[0]
    if len(parts) > 1
        let r = parts[1]
        let joined = join([l, r]. '.')
        let fp = substitute(joined, '\.', '/', 'g') . '.py'
        let found = glob(fp, 1)
        if len(found)
            return found

        endif
    endif
    return substitute(l, '\.', '/', 'g') . '.py'
endfunction

setlocal includeexpr=PyInclude(v:fname)
setlocal define=^\\s*\\<\\(def\\\|class\\)\\>

" Run code
nmap <Leader>R :split<CR><c-w>j:term python %<CR>i
