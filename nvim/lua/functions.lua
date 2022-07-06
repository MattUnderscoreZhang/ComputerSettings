local cmd = vim.cmd

-- don't redefine these functions on config reload
-- calculator via bash bc
cmd([[
function! MyCalc(str)
return system("echo 'x=" . a:str . ";d=.5/10^" . g:MyCalcPrecision
\. ";if (x<0) d=-d; x+=d; scale=" . g:MyCalcPrecision . ";print x/1' | bc -l")
endfunction

function! DayCalcPercent(str)
return system("echo -n \\\(; echo 'x=(" . a:str . ")*100;d=.5/10^" . g:MyCalcPrecision
\. ";if (x<0) d=-d; x+=d; scale=" . g:MyCalcPrecision . ";print x/1' | bc -l; echo -n \\\%\\\)")
endfunction

function! MyCalcNoRound(str)
return system("echo 'scale=" . g:MyCalcPrecision . " ; print " . a:str . "' | bc -l")
endfunction

let g:MyCalcPrecision = 2  " Control the precision with this variable

map <silent> <leader>cr :s/\$\(.*\)\$/\=MyCalc(submatch(1))/g<CR>:noh<CR>
map <silent> <leader>cp :s/\$\(.*\)\$/\=DayCalcPercent(submatch(1))/g<CR>:noh<CR>
]])
