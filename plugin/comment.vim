function! MyComment()
  let commentPattern = ''
  let addComment = ''
  let removeComment = ''

  if (&ft == 'cpp' || &ft == 'c' || &ft == 'java')
    let commentPattern = '^\s*\/\/'
    let addComment = '//'
    let removeComment = '\/\/'
  elseif (&ft == 'vim')
    let commentPattern = '^\s*"'
    let addComment = '"'
    let removeComment = '"'
  elseif (&ft == 'ruby' || &ft == 'python' || &ft == 'sh')
    let commentPattern = '^\s*#'
    let addComment = '#'
    let removeComment = '#'
  elseif (&ft == 'sql')
    let commentPattern = '^\s*--'
    let addComment = '--'
    let removeComment = '--'
  endif

  let currentLine = getline('.')
  if currentLine =~ commentPattern
    let currentLine = substitute(currentLine, removeComment, '', '')
  else
    let currentLine = addComment . currentLine
  endif
  call setline(line('.'), currentLine)
endfunction
nnoremap <C-c> :call MyComment()<CR>
