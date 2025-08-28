" split line move
function! AdjustVerticalSplit(dir)
  " dir = +N 或 -N，表示增大或缩小宽度
  let curwin = win_getid()
  let curcol = win_screenpos(curwin)[1]

  " 找出所有窗口 id 和对应的左列位置
  let wins = getwininfo()
  " 按列号升序排序窗口，最左边窗口第一个
  call sort(wins, {a,b -> a.wincol - b.wincol})

  " 找出当前窗口在列表里的索引
  let idx = -1
  for i in range(len(wins))
    if wins[i].winid == curwin
      let idx = i
      break
    endif
  endfor

  if idx == 0
    " 当前窗口是最左边，调整当前窗口宽度
    execute "vertical resize " . (wins[idx].width + a:dir)
  elseif idx == len(wins) - 1
    " 当前窗口是最右边，调整当前窗口宽度，方向取反
    execute "vertical resize " . (wins[idx].width - a:dir)
  else
    " 不是最左边，调整左边窗口宽度
    let leftwin = wins[idx - 1].winid
    call win_execute(leftwin, "vertical resize " . (wins[idx - 1].width + a:dir))
    " 光标回到当前窗口（确保焦点不变）
    call win_gotoid(curwin)
  endif
endfunction

function! AdjustHorizontalSplit(dir)
  " dir = +N 或 -N，表示增大或缩小高度
  let curwin = win_getid()
  let currow = win_screenpos(curwin)[0]

  " 找出所有窗口 id 和对应的行号
  let wins = getwininfo()
  " 按行号升序排序窗口，最上面窗口第一个
  call sort(wins, {a,b -> a.winrow - b.winrow})

  " 找出当前窗口在列表里的索引
  let idx = -1
  for i in range(len(wins))
    if wins[i].winid == curwin
      let idx = i
      break
    endif
  endfor

  if idx == 1
    " 当前窗口是最上面，调整当前窗口高度
    execute "resize " . (wins[idx].height + a:dir)
  else
    " 不是最上面，调整上边窗口高度
    let topwin = wins[idx - 1].winid
    call win_execute(topwin, "resize " . (wins[idx - 1].height + a:dir))
    " 光标回到当前窗口（确保焦点不变）
    call win_gotoid(curwin)
  endif
endfunction

function! ShowCurrentWinColGroupIdx()
  let curwin = win_getid()
  let wins = getwininfo()
  call sort(wins, {a,b -> a.wincol - b.wincol})

  " 用来存储分组序号
  let group_idx = 0
  " 记录上一行的wincol，用于比较是否相同
  let prev_col = -1

  " 建立一个列表，存放每个窗口对应的组序号
  let groups = []

  for w in wins
    if w.wincol != prev_col
      " 不同的wincol，序号+1
      let group_idx += 1
      let prev_col = w.wincol
    endif
    call add(groups, group_idx)
  endfor

  " 找当前窗口对应的序号
  let idx = -1
  for i in range(len(wins))
    if wins[i].winid == curwin
      let idx = groups[i]
      break
    endif
  endfor

  echo "Current window col group index: " . idx
endfunction

function! ShowCurrentWinRowGroupIdx()
  let curwin = win_getid()
  let wins = getwininfo()
  call sort(wins, {a,b -> a.winrow - b.winrow})

  let group_idx = 0
  let prev_row = -1
  let groups = []

  for w in wins
    if w.winrow != prev_row
      let group_idx += 1
      let prev_row = w.winrow
    endif
    call add(groups, group_idx)
  endfor

  let idx = -1
  for i in range(len(wins))
    if wins[i].winid == curwin
      let idx = groups[i]
      break
    endif
  endfor

  echo "Current window row group index: " . idx
endfunction


" 映射快捷键，调整窗口大小，按你需求修改步长
nnoremap <silent> <C-w>H :call AdjustVerticalSplit(-5)<CR>
nnoremap <silent> <C-w>L :call AdjustVerticalSplit(5)<CR>
nnoremap <silent> <C-w>K :call AdjustHorizontalSplit(-2)<CR>
nnoremap <silent> <C-w>J :call AdjustHorizontalSplit(2)<CR>
