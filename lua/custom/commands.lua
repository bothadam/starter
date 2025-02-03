-- Define a Vim function for :ajb
vim.cmd([[
  function! AjbCommand()
    let filetype = &filetype
    let log_statement = ''

    if filetype == 'java'
      let log_statement = 'log.debug("ajb {}", );'
    elseif filetype == 'javascript' || filetype == 'typescript' || filetype == 'jsx' || filetype == 'tsx'
      let log_statement = 'console.log("ajb ", );'
    else
      echohl WarningMsg | echo "No log statement defined for this file type!" | echohl None
      return
    endif

    call setline('.', log_statement)
  endfunction
]])

-- Map the function to the :ajb command
vim.cmd("command! -nargs=0 Ajb call AjbCommand()")
